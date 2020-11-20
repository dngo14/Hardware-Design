#include <stdio.h>

int dbl(int val) {
  return val + val;
}

int main() {
  int x, y, sum=0;
  printf("Enter two integers in increasing order:  ");
  scanf("%d %d", &x, &y);
  printf("Start value is %d\n", x);
  
  while (x <= y) {
    sum = sum + dbl(x);
    x++;
  }
  printf("The sum of dbl() calls up to %d is %d\n", y, sum);
  return 0;
}
