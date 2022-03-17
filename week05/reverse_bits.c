#include <assert.h>
#include <stdio.h>

#define N_BITS sizeof(Word) * 8

// most machines have 32 bit integers
// C standard states this can be anything >= 16 bits
typedef unsigned int Word;
 
Word reverse_bits(Word value) {

    // 1011 0000 0000 0000
    // 1000 0000 0000 0000 <- how do i make this mask? 1 << 15
    //                                                 1 << (N_BITS - 1)
    // 0100 0000 0000 0000 <-                          1 << 14
    //                                                 1 << (N_BITS - 1 - 1)
    // if i AND these two numbers, and the first bit has been set, i will get
    // 1000 0000 0000 0000
    // if the first bit wasnt set, and i ANDed them
    // for example:
    // 0111 0000 0000 0000
    // 1000 0000 0000 0000
    // gives us zero
    // after reading the first bit, our result should look like 
    // 0000 0000 0000 0001 <- 1 << 0
    // we dont need to do anything for the second bit
    // since the third bit is set, the result should then look like
    // result = 0000 0000 0000 0001
    // mask   = 0000 0000 0000 0100 <- 1 << 2
    // goal   = 0000 0000 0000 0101
    
    int result = 0;
    for (int i = 0; i < N_BITS; i++) {
        Word read_mask = 1 << (N_BITS - 1 - i);
        if (value & read_mask) {
            // this is the same as saying value & read_mask != 0
            // this is because every value except for 0 is considered true in C
            Word write_mask = 1 << i;
            
            result |= write_mask;

        }

    }
    return result;


}

 
int main(void) {
    assert(reverse_bits(0xFFFFFFFF) == 0xFFFFFFFF);
    assert(reverse_bits(0x00000000) == 0x00000000);
    assert(reverse_bits(0x1) == 0x80000000);
    assert(reverse_bits(0x2) == 0x40000000);
    assert(reverse_bits(0x01234567) == 0xE6A2C480);
    printf("All tests passed!\n");
    return 0;
}
