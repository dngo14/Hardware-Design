#include <stdio.h>
#include <math.h>

int strlen(char *arg1) {
  int count = 0;
  while ((*arg1) != '\0') {
	 count++;
	 arg1+1;
  }
  return count;
}

int main() {
  int x;
  x = strlen("The end");
  printf("The return value from strlen(\"The end\") is %d\n", x);
}
