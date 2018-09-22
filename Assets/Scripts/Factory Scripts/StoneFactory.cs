using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StoneFactory : MonoBehaviour
{
    public Transform Stone;

    public void Start()
    {
        for (int y = 0; y > -10; --y)
        {
            for (int x = 0; x > -10; --x)
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
        return Instantiate(Stone, position, Quaternion.identity).gameObject;
    }
}
