#include <stdio.h>
#include <math.h>

int min_pair(int x, int y) {
  if (x<y) {
    return x;
      }
  else {
    return y;
      }
}

int main() {
  printf("Enter two integers: ");
  int x, y;
  scanf("%d%d",&x, &y);
  int z = min_pair(x, y);
  printf("The minimum is %d\n",z);
}
