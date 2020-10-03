#include <stdio.h>

int strindex(char *arg1, char arg2) {
  int num = 0;
  while(arg1[num] != '\0' & arg1[num] != arg2) {
      num++;
  }
    if(arg1[num] == arg2) {
      return num;
    }
    else {
      return -1;
    }
}
  
int main() {
  int x;
  x = strindex("The end", 'e');
  int y;
  y = strindex("The end", 'a');
  printf("The return value from strindex(\"The end\", 'e') is %i\n", x);
  printf("The return value from strindex(\"The end\", 'a') is %i\n", y);
}


