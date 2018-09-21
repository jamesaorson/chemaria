using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StoneController : BlockController {

    public StoneController()
    {
        MaxDurability = 3;
        CurrentDurability = MaxDurability;
    }
}