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
    int arr[] = {2, 4, 10};
    int val = prod_array(arr, 3);
    printf("The value product of the array elements is %d\n", val);
}