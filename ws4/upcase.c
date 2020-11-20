#include <stdio.h>

int upcase(char x[], char y[]) {
  int count = 0;
  int counter = 0;
  while(y[count] != '\0') {
    if (y[count] >= 97 & y[count] <= 122) {
      x[count] = y[count]-32;
     counter++;
     count++;
    }
    else{
      x[count] = y[count];
      count++;
    }
  }
  x[count]='\0';
  return counter;
}

int main() {
  char A[50];
  int x;
  x = upcase(A, "Hello!");
  printf("After %d replacements, A holds %s\n",x, A);
}
			     
