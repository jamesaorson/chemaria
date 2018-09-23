using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Stone : Block
{    
	public void Start ()
    {
        MaxDurability = 3;
        CurrentDurability = MaxDurability;
	}
}
