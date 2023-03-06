#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>

struct exampleStruct {
  short int x=0;    /* 2-byte integer */
  int       y=1;    /* 4-byte integer */
  long int  z=2;    /* 8-byte integer   */
};


	
int main(){
	//down in main
	exampleStruct s={4,5,6};
	std::cout<<s.y<<std::endl;
	return 0;	
}
