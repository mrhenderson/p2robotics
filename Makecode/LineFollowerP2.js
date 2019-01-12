// Setup Variables Here

let lasterror = 0
let kP = 0
let kI = 0
let baseSpeed = 0
let kD = 0
let target = 0
let error = 0
kD = 0
kI = 0
lasterror = 0
kP = 1
baseSpeed = 50

// Helper Functions
function getError() {
    let curError = sensors.color3.light(LightIntensityMode.Reflected) - target
    return curError
}

// OnStart
pause(1000)
target = sensors.color3.light(LightIntensityMode.Reflected)

// Forever Block

forever(function () {
    error = getError()
    motors.largeBC.tank(baseSpeed - error * kP, baseSpeed + error * kP)
})
