using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WorldManager : MonoBehaviour
{
    public static Dictionary<int, Dictionary<int, GameObject>> Blocks = new Dictionary<int, Dictionary<int, GameObject>>();

    public void Awake()
    {
        QualitySettings.vSyncCount = 0;

        if (QualitySettings.vSyncCount == 0)
        {
            Application.targetFrameRate = 60;
        }
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
}
