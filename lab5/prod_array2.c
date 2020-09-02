#include<stdio.h>
#include<math.h>

int prod_array(int x[], int y) {
    int z = 1;
    for(int i = 0; i<y; i++) {
        z *= x[i];
    }
    return z;
}

int main() {
    int arr[] = {1, 2, 3, 4, 5};
    int val = prod_array(arr, 5);
    printf("The value product of the array elements is %d\n", val);
}