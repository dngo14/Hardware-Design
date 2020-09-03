#include<stdio.h>
#include<math.h>

float max(float x, float y) {
  if (x < y)
    return y;
  else
    return x;
} 

int main() {
    printf("Enter two floats\n");
    float x, y, z;
    scanf("%f%f", &x, &y);
    z = max(x, y);
    printf("The call max(%f, %f) returns the value %f\n",x, y, z);
}
