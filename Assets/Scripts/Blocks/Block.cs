using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Block : MonoBehaviour {
    public float CurrentDurability;
    public float MaxDurability;
    public PlayerController Player;

    public Block()
    {
        MaxDurability = 1.5f;
        CurrentDurability = MaxDurability;
    }

    public void Start()
    {
        Player = GameObject.FindGameObjectWithTag("Player").GetComponent<PlayerController>();
    }
}
