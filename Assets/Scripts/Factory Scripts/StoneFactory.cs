using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StoneFactory : MonoBehaviour
{
    public Transform Stone;

    public void Start()
    {
        for (int y = 0; y > -16; --y)
        {
            for (int x = -16; x <= 0; ++x)
            {
                CreateStone(x, y);
            }
        }
    }

    public GameObject CreateStone(float x = 0, float y = 0)
    {
        return CreateStone(new Vector3(x, y, 0));
    }

    public GameObject CreateStone(Vector3 position)
    {
        var newBlock = Instantiate(Stone, position, Quaternion.identity).gameObject;
        WorldManager.AddBlock(position, newBlock);
        return newBlock;
    }
}
