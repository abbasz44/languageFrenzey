#include <stdio.h>
#include <stdlib.h>
#include <time.h> 

//this is non recursion function decided to use unsigned just in case of unsigned numbers
//a is the multiplier b is the other 
unsigned int nonrecursion(unsigned int a, unsigned int b){
//declare variables
   unsigned int p = 0;

//implementing algorithm here for non recursive
   while(a > 0){
       if ((a % 2) == 1){
            p = (b + p);
       }
        b = b*2;
        a = a/2; 
   }

   return p;
}

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
    printf("%d \n", nonrecursion(a, b));
    end = clock();
//print how long 
    printf("Runtime for nonrecursive fucntion in c is: %f \n", ((double)(end - begin))/ CLOCKS_PER_SEC);
    printf("\n"); 
}