#include <stdio.h>

int main(){
  unsigned int guess;   //current guess for prime
  unsigned int factor;  // possible factor of guess
  unsigned int limit;   // find primes up to this value 

  limit=30; //find the primes up to 30
  guess = 1; //initial guess
  while (guess < limit) { // outer while loop
      guess++; 
      factor=1; 
      do { //inner while loop
		  factor++; 
		  if (factor==guess){ //isPrime
			  printf("found a prime\n");
			  break; //jump to outer while loop
			  
		  }
	  } while(guess % factor != 0);
  }
}
