#include <stdio.h>

int strlen(char arg1[]) {
  int x = 0;
  while(arg1[x] != '\0') {
    x++;
  }
  return x;
}

int main() {
  int x;
  x = strlen("The end");
  printf("The return value from strlen(\"The end\") is %d\n",x);
}
