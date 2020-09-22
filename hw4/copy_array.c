#include<stdio.h>
#include<math.h>

int copy_array(int x[],int y, int z[]) {
  for(int i = 0; i<y; i++) {
    z[i]=x[i];
  }
  return y;
}

int main() {
  int A[] = {5, 4, 3, 2, 1};
  int B[5];
  copy_array(A, 3, B);
}
