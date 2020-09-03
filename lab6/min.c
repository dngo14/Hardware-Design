#include<stdio.h>
#include<math.h>

double min(double x, double y) {
  if (x < y)
    return x;
  else
    return y;
} 

int main() {
    printf("Enter two doubles\n");
    double x, y, z;
    scanf("%d%d", &x, &y);
    z = min(x, y);
    printf("The call min(%d, %d) returns the value %d\n",x, y, z);
}
