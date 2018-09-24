using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    public static Collider2D Collider;
    public static Rigidbody2D Rigidbody;

    public static float WalkingAcceleration = 30;
    public static float MaxVelocity = 8;
    public static float MiningRange = 5;
    public static float MiningStrength = 1;

    private static Block TargetedBlock;
    private static float DeltaTime;

    /* Public Methods */
    public void FixedUpdate()
    {
        if (Rigidbody.velocity.sqrMagnitude > 0)
        {
            var playerPosition = Rigidbody.position;
            var cameraPosition = Camera.main.transform.position;
            cameraPosition = new Vector3(playerPosition.x, playerPosition.y, cameraPosition.z);
            Camera.main.transform.position = cameraPosition;
        }

        PrintFramerate();
    }
    
    public void Start()
    {
        Rigidbody = GetComponent<Rigidbody2D>();
        Collider = GetComponent<Collider2D>();
	}

    /* Static Methods */
    public static void BreakBlock()
    {
        bool shouldResetDurability = false;
        var block = WorldManager.GetBlockFromMouse();
        
        if (block != null)
        {
            //print("Targeted a block");
            if (!IsCloseEnoughToMine(block))
            {
                block = null;
                shouldResetDurability = true;
            }
            else
            {
                if (TargetedBlock != null && TargetedBlock != block)
                {
                    shouldResetDurability = true;
                }
                if (block.Mine(MiningStrength))
                {
                    block = null;
                }
            }
        }
        else if (TargetedBlock != null)
        {
            shouldResetDurability = true;
        }

        if (shouldResetDurability && TargetedBlock != null)
        {
            TargetedBlock.ResetDurability();
        }

        TargetedBlock = block;
    }

    public static void Move(float horizontalAxis)
    {
        if (Mathf.Abs(Rigidbody.velocity.x) < MaxVelocity)
        {
            Rigidbody.AddForce(new Vector2(WalkingAcceleration * horizontalAxis * Time.fixedDeltaTime, 0), ForceMode2D.Impulse);
        }
    }

    /* Private Methods */
    private static bool IsCloseEnoughToMine(Block block)
    {
        return Vector3.Distance(block.transform.position, Rigidbody.transform.position) <= MiningRange;
    }

    private static void PrintFramerate()
    {
        DeltaTime += (Time.unscaledDeltaTime - DeltaTime) * 0.1f;
        print("Framerate: " + (1.0f / DeltaTime));
    }
}
