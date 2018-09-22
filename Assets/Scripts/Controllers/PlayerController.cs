using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    public Collider2D Collider;
    public Rigidbody2D Rigidbody;

    public float WalkingAcceleration = 30;
    public float MaxVelocity = 8;

    void Start ()
    {
        Rigidbody = GetComponent<Rigidbody2D>();
        Collider = GetComponent<Collider2D>();
	}
	
	// Update is called once per frame
	void FixedUpdate ()
    {
        float horizontalAxis = Input.GetAxis("Horizontal");

        if (horizontalAxis != 0 && Mathf.Abs(Rigidbody.velocity.x) < MaxVelocity)
        {
            Rigidbody.AddForce(new Vector2(WalkingAcceleration * horizontalAxis * Time.fixedDeltaTime, 0), ForceMode2D.Impulse);
        }

        if (Rigidbody.velocity.sqrMagnitude > 0)
        {
            var playerPosition = Rigidbody.position;
            var cameraPosition = Camera.main.transform.position;
            cameraPosition = new Vector3(playerPosition.x, playerPosition.y, cameraPosition.z);
            Camera.main.transform.position = cameraPosition;
        }

        Debug.Log("Framerate: " + (1.0f / Time.fixedDeltaTime));
    }
}
