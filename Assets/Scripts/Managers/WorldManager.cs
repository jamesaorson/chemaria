using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Formatters.Binary;
using UnityEngine;

public class WorldManager : MonoBehaviour
{
    public static Dictionary<int, Dictionary<int, GameObject>> Blocks = new Dictionary<int, Dictionary<int, GameObject>>();

    public static string SaveFilePath
    {
        get
        {
            return Application.persistentDataPath + "/Saves/";
        }
    }

    public void Awake()
    {
        /*QualitySettings.vSyncCount = 0;

        if (QualitySettings.vSyncCount == 0)
        {
            Application.targetFrameRate = 60;
        }*/
    }

    public static void AddBlock(Vector3 position, GameObject block)
    {
        int x = (int)position.x;
        int y = (int)position.y;
        Dictionary<int, GameObject> blocksOnX;

        Blocks.TryGetValue(x, out blocksOnX);
        if (blocksOnX == null)
        {
            blocksOnX = new Dictionary<int, GameObject>();
            Blocks[x] = blocksOnX;
        }

        blocksOnX[y] = block;
    }

    public static Block GetBlock(Vector3 position)
    {
        int x = Mathf.FloorToInt(position.x);
        int y = Mathf.FloorToInt(position.y);
        GameObject result = null;
        Dictionary<int, GameObject> blocksOnX;

        Blocks.TryGetValue(x, out blocksOnX);
        if (blocksOnX != null)
        {
            blocksOnX.TryGetValue(y, out result);
        }

        return result == null ? null : result.GetComponent<Block>();
    }

    public static Block GetBlockFromMouse()
    {
        var mousePosition = Camera.main.ScreenToWorldPoint(Input.mousePosition);

        var rayPosition = new Vector2(mousePosition.x, mousePosition.y);
        var raycastHit = Physics2D.Raycast(rayPosition, Vector2.zero, 0f);
        if (raycastHit)
        {
            return raycastHit.transform.gameObject.GetComponent<Block>();
        }
        return null;
    }

    public static void RemoveBlock(Vector3 position)
    {
        int x = Mathf.FloorToInt(position.x);
        int y = Mathf.FloorToInt(position.y);
        Dictionary<int, GameObject> blocksOnX;

        Blocks.TryGetValue(x, out blocksOnX);
        if (blocksOnX != null && blocksOnX.ContainsKey(y))
        {
            blocksOnX.Remove(y);   
        }
    }

    public static bool LoadWorld(string fileName)
    {
        string filePath = SaveFilePath + fileName;
        print("Try to load");
        if (!File.Exists(filePath))
        {
            return false;
        }

        var binaryFormatter = new BinaryFormatter();
        var filestream = File.OpenRead(filePath);
        var saveFile = (SaveFile)binaryFormatter.Deserialize(filestream);
        LoadWorldFromSaveFile(saveFile);
        filestream.Close();

        print("Loaded");

        return true;
    }

    public static void SaveWorld(string fileName)
    {
        string filePath = SaveFilePath + fileName;
        print("Try to save");
        if (!Directory.Exists(SaveFilePath))
        {
            Directory.CreateDirectory(SaveFilePath);
        }
        
        if (File.Exists(filePath))
        {
            File.Delete(filePath);
        }

        var binaryFormatter = new BinaryFormatter();
        var fileStream = File.Create(filePath);
        var saveFile = CreateSaveFileFromWorld();
        binaryFormatter.Serialize(fileStream, saveFile);
        fileStream.Close();

        print("Saved");
    }

    public static SaveFile CreateSaveFileFromWorld()
    {
        var saveFile = new SaveFile();
        var innerList = Blocks.Values.ToList();

        foreach (var innerBlocks in innerList)
        {
            foreach (var block in innerBlocks.Values)
            {
                var blockList = new List<SaveFile.SerializableVector>();
                if (saveFile.Blocks.ContainsKey(block.tag))
                {
                    blockList = saveFile.Blocks[block.tag];
                }
                else
                {
                    saveFile.Blocks[block.tag] = blockList;
                }
                blockList.Add(new SaveFile.SerializableVector(block.transform.position));
            }
        }

        saveFile.PlayerPosition = new SaveFile.SerializableVector(PlayerController.Rigidbody.transform.position);

        return saveFile;
    }

    public static void LoadWorldFromSaveFile(SaveFile saveFile)
    {
        ResetWorld(saveFile);
        var dirtFactory = FindObjectOfType<DirtFactory>();
        foreach (var blocks in saveFile.Blocks.Values)
        {
            foreach (var block in blocks)
            {
                dirtFactory.CreateDirt(block.x, block.y);
            }
        }
    }

    public static void ResetWorld(SaveFile saveFile)
    {
        foreach(var innerBlocks in Blocks.Values)
        {
            foreach (var block in innerBlocks.Values)
            {
                Destroy(block);
            }
        }

        Blocks.Clear();
        PlayerController.ResetPhysicsConditions();
        var playerPosition = new Vector2(saveFile.PlayerPosition.x, saveFile.PlayerPosition.y);
        PlayerController.Rigidbody.MovePosition(playerPosition);
        PlayerController.MoveCamera(playerPosition);
    }

    [Serializable]
    public class SaveFile
    {
        [Serializable]
        public class SerializableVector
        {
            public float x;
            public float y;
            public float z;

            public SerializableVector(Vector2 vector)
            {
                x = vector.x;
                y = vector.y;
                z = 0;
            }

            public SerializableVector(Vector3 vector)
            {
                x = vector.x;
                y = vector.y;
                z = vector.z;
            }
        }

        public Dictionary<string, List<SerializableVector>> Blocks { get; set; }
        public SerializableVector PlayerPosition { get; set; }

        public SaveFile()
        {
            Blocks = new Dictionary<string, List<SerializableVector>>();
        }
    }
}
 