#include <HsToC/Fib_stub.h>
#include <csrc/HsToC.h>
#include <stdio.h>

int main(int argc, char *argv[])
{
    printf("hello hs-from-c\n");
    //hs_init(&argc, &argv);
    HsToCInit();
    int i = fibonacci_hs(42);
    printf("Fibonacci: %d\n", i);
    HsToCExit();
    //hs_exit();
    return 0;
}

