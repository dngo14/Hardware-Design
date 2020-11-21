#include <stdio.h>

int maxin(int x) {
  int count = 0;
  int accumulator = 0;
  int num = 0;
  printf("Enter inputs: \n");
  while(count != x) {
    scanf("%d", &num);
    accumulator = accumulator + num;
    count++;
  }
  return accumulator;
}

int main() {
  int max;
  max = maxin(5);
  printf("The number is %d\n", max);
}
