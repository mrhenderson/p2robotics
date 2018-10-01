/*
temp.ch - simple temperature conversion
cTemp * 9/5 + 32 = fTemp
2018-10-01 : mhenderson
*/

double cTemp,fTemp; // Store 2 variables for Celsius and Fareinheit temps

// Function to convert C to F

double c2f(double tempC) {
    fTemp = tempC * 9/5 + 32;
    printf("%.2lf degrees C = %.2lf degrees F\n", 
        tempC, tempC * 9/5 + 32);
    return fTemp;
    }

// fTemp = cTemp * 9/5 + 32
cTemp = 0;
// 0 degrees C = 32 degrees F
printf("%.2lf degrees C = %.2lf degrees F\n", cTemp, cTemp * 9/5 + 32);
cTemp = 100;
fTemp = cTemp * 9/5 + 32;
printf("%.2lf degrees C = %.2lf degrees F\n",cTemp,fTemp);
// Select a random number between -10 and 100 and convert to Fareinheit
cTemp = randint(-10,100);
fTemp = cTemp * 9/5 + 32;
printf("%.2lf degrees C = %.2lf degrees F\n",cTemp,fTemp);

// Ask for temperature in C and convert to F using 'scanf'
printf("Please enter a temperature in Celsius\n");
scanf("%lf",&cTemp);
// fTemp = cTemp * 9/5 + 32;
printf("%.2lf degrees C = %.2lf degrees F\n",cTemp,c2f(cTemp));

