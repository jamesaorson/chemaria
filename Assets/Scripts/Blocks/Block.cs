using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Block : MonoBehaviour
{
    public float MaxDurability;
    public float CurrentDurability;

    public Block()
    {
        MaxDurability = 2;
        CurrentDurability = MaxDurability;
    }

    public void DestroyBlock()
    {
        WorldManager.RemoveBlock(gameObject.transform.position);
        Destroy(gameObject);
    }

    public bool Mine(float strength)
    {
        CurrentDurability -= (strength * Time.deltaTime);
        if (CurrentDurability <= 0)
        {
            DestroyBlock();
        }
        return CurrentDurability <= 0;
    }

    public void ResetDurability()
    {
        CurrentDurability = MaxDurability;
    }
}
