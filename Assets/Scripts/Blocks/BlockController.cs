using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BlockController : Block
{
    public bool IsMining = false;

    public void OnMouseDown()
    {
        if (IsWithinMiningDistance())
        {
            IsMining = true;
        }
    }

    public void OnMouseOver()
    {
        if (Input.GetMouseButton(0) && IsWithinMiningDistance())
        {
            IsMining = true;
            CurrentDurability -= Player.MiningStrength * Time.deltaTime;

            if (CurrentDurability <= 0)
            {
                Destroy(gameObject);
            }
        }
        else if (IsMining)
        {
            IsMining = false;
            CurrentDurability = MaxDurability;
        }
    }

    public void OnMouseExit()
    {
        if (IsMining)
        {
            IsMining = false;
            CurrentDurability = MaxDurability;
        }
    }

    private bool IsWithinMiningDistance()
    {
        return Vector3.Distance(transform.position, Player.transform.position) < Player.MiningDistance;
    }
}
