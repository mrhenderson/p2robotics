#include <stdio.h>
FILE *fpt;
if ((fpt=fopen("testfile","w")) == NULL) {
    printf("Cannot open the file for writing\n");
    exit(1);
}
fputs("Hello, World!\n",fpt);
printf("Hello, World!\n");
int n;
for(n=1;n<4;n++) {
 
    fprintf(fpt,"test %d\n",n);
}
fputs("Goodbye!\n",fpt);
/*

create a for loop
it will store something in a variable
output the variable each time using fputs

Expected output:
Hello, World!
test 1
test 2
test 3
Goodbye!

*/


// VERY IMPORTANT! Remember to include the fclose statement and only do it once after
// everything has been written to the file.

fclose(fpt);
 
