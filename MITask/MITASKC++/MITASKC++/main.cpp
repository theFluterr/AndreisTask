//
//  main.cpp
//  MITASKC++
//
//  Created by Andrei on 15/03/16.
//  Copyright © 2016 Andrei. All rights reserved.
//

#include <iostream>
#include "MIPermutation.h"

int main(int argc, const char * argv[]) {
    
    int amount = 0;
    MIStorage storage;
    std::cout << "Enter the required number of permutation (e.g. 1000000)\n";
    scanf("%d", &amount);
    if (amount > 0 && amount <= 3628800){
        storage.permutateArrayOfNumbers(amount);
    }
    else {
        std::cout << "Incorrect input, try a number between 0 and 3628800\n";
    }
    return 0;
}
