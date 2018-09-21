using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DirtController : BlockController {

	public DirtController()
    {
        MaxDurability = 1;
        CurrentDurability = MaxDurability;
    }
}
