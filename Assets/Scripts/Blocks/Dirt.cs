using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Dirt : Block
{
    public void Start()
    {
        MaxDurability = 1;
        CurrentDurability = MaxDurability;
    }
}
