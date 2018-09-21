using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StoneFactory : MonoBehaviour
{
    public Transform Stone;

    public void Start()
    {
        for (int y = 0; y >= -50; --y)
        {
            for (int x = -50; x <= 0; ++x)
            {
                Create(x, y);
            }
        }
    }

    public Transform Create(float x = 0, float y = 0, float z = 0)
    {
        return Create(new Vector3(x, y, z));
    }

    public Transform Create(Vector3 position)
    {
        return Instantiate(Stone, position, Quaternion.identity);
    }
}
