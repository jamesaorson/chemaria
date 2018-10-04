using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LocalPlayerController : MonoBehaviour
{
    public Vector3 PlayerPosition { get
        {
            var position2d = Rigidbody.position;
            return new Vector3(position2d.x, position2d.y, 0);
        }
    }

    public Collider2D Collider;
    public Rigidbody2D Rigidbody;

    public float JumpingStrength = 30;
    public float MaxVelocity = 8;
    public float MiningRange = 5;
    public float MiningStrength = 1;
    public float WalkingAcceleration = 30;

    private Block TargetedBlock;
    private float DeltaTime;

    /* Public Methods */
    public void FixedUpdate()
    {
        if (Rigidbody.velocity.sqrMagnitude > 0)
        {
            MoveCamera(Rigidbody.transform.position);
        }
    }
    
    public void Start()
    {
        Collider = GetComponent<Collider2D>();
        Rigidbody = GetComponent<Rigidbody2D>();
	}

    /* Static Methods */
    public void BreakBlock()
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

    public void Jump()
    {
        if (CanJump())
        {
            Rigidbody.AddForce(new Vector2(0, JumpingStrength), ForceMode2D.Impulse);
        }
    }

    public void Move(float horizontalAxis)
    {
        if (Mathf.Abs(Rigidbody.velocity.x) < MaxVelocity)
        {
            Rigidbody.AddForce(new Vector2(WalkingAcceleration * horizontalAxis * Time.deltaTime, 0), ForceMode2D.Impulse);
        }
    }

    public void MoveCamera(Vector2 newCameraPosition)
    {
        var cameraPosition = Camera.main.transform.position;
        Camera.main.transform.position = new Vector3(newCameraPosition.x, newCameraPosition.y, cameraPosition.z);
    }

    public void ResetPhysicsConditions()
    {
        Rigidbody.velocity = Vector3.zero;
        Rigidbody.angularVelocity = 0;
    }

    /* Private Methods */
    private bool CanJump()
    {
        return Physics2D.Raycast(PlayerPosition, Vector2.down, (Rigidbody.transform.localScale.y / 2.0f) + 0.05f, Constants.GroundLayer);
    }

    private bool CanMine(Block block)
    {
        return Vector3.Distance(block.transform.position, Rigidbody.transform.position) <= MiningRange;
    }
}
