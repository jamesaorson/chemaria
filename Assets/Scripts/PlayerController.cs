using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    public float MiningDistance = 10f;
    public float MiningStrength = 2f;
    public float MaxWalkingSpeed = 15;
    public float WalkingAcceleration = 20;
    public float CurrentWalkingSpeed = 0;

    void FixedUpdate()
    {
        var horizontalAxis = Input.GetAxis("Horizontal");
        if (horizontalAxis != 0)
        {
            CurrentWalkingSpeed += WalkingAcceleration * Time.deltaTime;
            if (Mathf.Abs(CurrentWalkingSpeed) > MaxWalkingSpeed)
            {
                CurrentWalkingSpeed = MaxWalkingSpeed;
            }
            var movement = new Vector3(horizontalAxis * CurrentWalkingSpeed * Time.deltaTime, 0, 0);
            var position = transform.position;
            position += movement;
            transform.position = position;
        }
        else
        {
            CurrentWalkingSpeed = 0;
        }

        
        var cameraPosition = Camera.main.transform.position;
        Camera.main.transform.position = new Vector3(transform.position.x, transform.position.y, cameraPosition.z);
        Debug.Log("Framerate: " + (1.0f / Time.deltaTime));
    }
}