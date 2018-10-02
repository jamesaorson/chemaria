using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DirtFactory : MonoBehaviour
{
    public Transform Dirt;

    public void Start()
    {
        for (int y = 0; y > -16; --y)
        {
            for (int x = 1; x <= 16; ++x)
            {
                CreateDirt(x, y);
            }
        }
    }

    public GameObject CreateDirt(float x = 0, float y = 0)
    {
        return CreateDirt(new Vector3(x, y, 0));
    }

    public GameObject CreateDirt(Vector3 position)
    {
        var newBlock = Instantiate(Dirt, position, Quaternion.identity).gameObject;
        WorldManager.AddBlock(position, newBlock);
        return newBlock;
    }
}
