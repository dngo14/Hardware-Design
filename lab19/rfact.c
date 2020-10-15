#include <stdio.h>
#include <math.h>

int fact(int n) {
  if (n == 0)
    return 1;
  else
    return n * fact(n-1);
}

int main() {
  int x;
  printf("Enter a non-negative integer: ");
  scanf("%d",&x);
  if(x < 0) {
    printf("error, negative integer entered\n");
    return -1;
  }
  int n;
  n = fact(x);
  printf("The factorial of %d is %d\n",x,n);
  return 0;
}
  
