#include <stdio.h>
#include <stdlib.h> 
#include <time.h>

//this is recursion function decided to use unsigned just in case of unsigned numbers
//a is the multiplier b is the other 
unsigned int recursion(unsigned int a, unsigned int b){
//declare variables 
   unsigned int p = 0;

//implementing algorithm here 
    if (a == 0){
        p = 0;
    }
    else if(a == 1){
        p = b;
    }
    else if((a>1) && ((a%2) == 0)){
        p = recursion((a/2), (b*2));
    }
    else if((a>1) && ((a%2) == 1)){
        p = (b + (recursion((a/2), (b*2))));
    }

    return p;
} 
//main to call fucntion and time
int main(){
//declare variables 
    unsigned int a; 
    unsigned int b; 
    clock_t begin;
    clock_t end; 

//get user input 
    printf("enter a: \n");
    scanf("%d", &a);

    printf("enter b: \n");
    scanf("%d", &b);

//begin clock 
    begin = clock();
//calling function 
    printf("Answer is:%d \n", recursion(a, b));
    end = clock();
//print how long
    printf("Runtime for recursive fucntion in c is: %f \n", ((double)(end - begin))/ CLOCKS_PER_SEC);
    printf("\n"); 

    return 0;
}