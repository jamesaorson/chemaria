using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InputManager : MonoBehaviour
{
    private float CancelAxis { get { return Input.GetAxis(Constants.CancelName); } }
    private float Fire1Axis { get { return Input.GetAxis(Constants.Fire1Name); } }
    private float Fire2Axis { get { return Input.GetAxis(Constants.Fire2Name); } }
    private float Fire3Axis { get { return Input.GetAxis(Constants.Fire3Name); } }
    private float HorizontalAxis { get { return Input.GetAxis(Constants.HorizontalAxisName); } }
    private float JumpAxis { get { return Input.GetAxis(Constants.JumpName); } }
    private float MouseScrollWheelAxis { get { return Input.GetAxis(Constants.MouseScrollWheelName); } }
    private float MouseXAxis { get { return Input.GetAxis(Constants.MouseXName); } }
    private float MouseYAxis { get { return Input.GetAxis(Constants.MouseYName); } }
    private float SubmitAxis { get { return Input.GetAxis(Constants.SubmitName); } }
    private float VerticalAxis { get { return Input.GetAxis(Constants.VerticalAxisName); } }
	
	public void FixedUpdate() {
        if (HorizontalAxis != 0)
        {
            PlayerController.Move(HorizontalAxis);
        }
        if (Fire1Axis != 0)
        {
            PlayerController.BreakBlock();
        }
    }
}
