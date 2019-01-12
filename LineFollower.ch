/*
ls.ch - Demo of the motor and light sensor
2018-09-24: Creators Name Goes Here
2018-10-26: Updating for LineFollower Code - mh



*/

#include <mindstorms.h> // Include the mindstorm ch library/header
CMindstorms robot; // Create the robot object from CMindstorms
robot.connectWithAddress(" 00:16:53:4f:bf:80",1);
// ------------------- Setting up variables ---------------------
int lightVal, // current light reading from the sensor on port 3
    target=20, // expected light reading on the line
    error=0, // current error after reading light value 
    lastError=0, // error in the last run
    correction=0, // adjust steering
    loop = 0,// sets loop to 0
    basePower = 2, // This might need to change
    leftPower=basePower,
    rightPower=basePower,
    touchVal; 
    

double Ki=0, // Could be doubles
    Kp=1,
    Kd=0,
    integral,
    dVal;

// Start the timer
double time1, time2, elapsedtime;
robot.systemTime(time1);       // get the system time since the system starts

// ---------------------------------------------------------------

robot.setSensorLight(PORT3, "Reflect"); // Setting up light sensor on Port 3
robot.setSensorTouch(PORT1,"Touch");

// -------------------- And now we begin our loop -----------------

while (loop < 1 ) {
//    printf("old lastError = %d\n",lastError);
    robot.getSensorLight(PORT3, lightVal);
    error = target - lightVal; // How far off are we?
    integral = lastError + error;
    dVal = error - lastError;
    lastError = error;
    correction = Kp*error + Ki * integral + Kd * dVal; // calculate our offset
    
    // Check the value of the touch sensor
    robot.getSensorTouch(PORT1, touchVal);
    loop = loop + touchVal;    
    /* Calculate the change in power to each motor */
    
    leftPower = basePower - correction/basePower;
    rightPower = basePower + correction/basePower;
    leftPower = round(leftPower);
    rightPower = round(rightPower);
    // Set power levels for each robot
    robot.setJointPower(JOINT2,leftPower);
    robot.setJointPower(JOINT3,rightPower);
    printf("lightVal = %d\n",lightVal);
    printf("leftPower = %d\n",leftPower);
    printf("rightPower = %d\n",rightPower);
//    printf("new lastError = %d\n",lastError);
    printf("correction = %d\n",correction);
//    printf("integral = %lf\n",integral);
//    printf("derivative = %lf\n",dVal);
//    printf("new lastError = %d\n",lastError);
    //loop=loop+1;
    // printf(loop);
    
    // Move the robot
 //   robot.moveForeverNB();
    robot.systemTime(time2);       // get the system time since the system starts
    elapsedtime = time2 - time1;
    printf("Time Check: %.2lf\n",elapsedtime);
    time2 = time1;
    
}


























/*
robot.setSensorLight(PORT4, "Reflect"); //Set the light sensor to read "Reflect" light values

// Function to determine which way to steer
void steerBot(int lv) {
    // Function receives light value as lv and changes the power levels to the motors
    printf("Run function to determine which way to steer based on light value.\n");
}
while (loop == 0) { //Start a loop until loop is set to something other than 0,
    
    if (lightVal > 50) { // compares lightVal to 50
        //run a function to steer the robot
        // pass lightVal variable; // sets loop to 1
        }
    };

*/

