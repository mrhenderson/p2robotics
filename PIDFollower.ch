/* File: PIDFollower.ch
   The Ev3 robot will follow a line based on PID control theory */
#include <mindstorms.h>

CMindstorms robot;

int loop = 0;
double target;  // how much to subtract from a raw light reading to convert it to an error value
double Kp = 1,  // proportional constant
       Ki = 0,  // integral constant
       Kd = 0;  // derivative constant
double targetPower = 10;  // the power level of both motors when the error is 0 and the robot goes straight ahead
double error,  // it tells us how far off the line's edge we are
       lastError;
double integral = 0,
       dVal = 0;
double turn;  // output of the PID controller

int lightValue;
int powerLeft,  // power set for the left motor
    powerRight;  // power set for the right motor

robot.setSensorLight(PORT3, "Reflect"); // initialize the light sensor
robot.setSensorTouch(PORT1,"Touch"); // Initialize the touch sensor to stop the loop
/* an infinite while-loop */
while (loop == 0) {
    robot.getSensorLight(PORT3, lightValue);


    error = lightValue - target;  //proportional term in the PID controller
    integral = lastError + error;  // integral term in the PID controller
    dVal = (error-lastError);  // derivative term in the PID controller
    turn = Kp*error + Ki*integral + Kd*dVal;

    /* correction of the output power */
    powerLeft = round(targetPower + turn/10);
    powerRight = round(targetPower - turn/10);

    /* set power of two motors */
    robot.setJointPower(PORT3, powerLeft);
    robot.setJointPower(PORT2, powerRight);
    robot.moveForeverNB();

    lastError = error;  // set current error to last error before we are about to get the new error when the loop cycles again
    robot.getSensorTouch(PORT1, loop);
}
