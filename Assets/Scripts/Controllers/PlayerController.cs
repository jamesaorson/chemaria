using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    public static Vector3 PlayerPosition { get
        {
            var position2d = Rigidbody.position;
            return new Vector3(position2d.x, position2d.y, 0);
        }
    }

    public static Collider2D Collider;
    public static Rigidbody2D Rigidbody;

    public static float JumpingStrength = 10;
    public static float MaxVelocity = 8;
    public static float MiningRange = 5;
    public static float MiningStrength = 1;
    public static float WalkingAcceleration = 30;

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
    }
    
    public void Start()
    {
        Collider = GetComponent<Collider2D>();
        Rigidbody = GetComponent<Rigidbody2D>();
	}

    /* Static Methods */
    public static void BreakBlock()
    {
        bool shouldResetDurability = false;
        var block = WorldManager.GetBlockFromMouse();
        
        if (block != null)
        {
            if (!CanMine(block))
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

    public static void Jump()
    {
        if (CanJump())
        {
            Rigidbody.AddForce(new Vector2(0, JumpingStrength), ForceMode2D.Impulse);
        }
    }

    public static void Move(float horizontalAxis)
    {
        if (Mathf.Abs(Rigidbody.velocity.x) < MaxVelocity)
        {
            Rigidbody.AddForce(new Vector2(WalkingAcceleration * horizontalAxis * Time.deltaTime, 0), ForceMode2D.Impulse);
        }
    }

    /* Private Methods */
    private static bool CanJump()
    {
        return Physics2D.Raycast(PlayerPosition, Vector2.down, (Rigidbody.transform.localScale.y / 2.0f) + 0.05f, Constants.GroundLayer);
    }

    private static bool CanMine(Block block)
    {
        return Vector3.Distance(block.transform.position, Rigidbody.transform.position) <= MiningRange;
    }
}
