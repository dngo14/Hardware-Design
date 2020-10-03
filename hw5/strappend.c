#include <stdio.h>

void strappend(char *arg1, char *arg2) {
  int num = 0;
  int num2 = 0;
  while(arg1[num] != '\0') {
    num++;
  }
    while(arg2[num2] != '\0') {
    arg1[num] = arg2[num2];
    num++;
    num2++;
    }
    arg1[num] = '\0';
}

int main () {
  char A[100] = "From start ";
  strappend(A, "to finish");
  printf("%s\n", A);
}

		
    
