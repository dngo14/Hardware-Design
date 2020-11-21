#include <stdio.h>

int shift(char x[], char y[], int z) {
  int count = 0;
  while(y[count] != '\0') {
    x[count] = y[count];
    count++;
  }
  x[count] = '\0';
  int counter = 0;
  count = 0;
  while(x[count]!='\0'){
    x[count] = x[count] + z;
    counter = counter + x[count];
    count++;
    }
  return counter;
}

int main() {
  char arr[50];     
  int x = shift(arr, "Abcde", 1);
  printf("shift(arr, Abcde, 1) returned %d,and arr[] holds %s\n", x, arr);
}
