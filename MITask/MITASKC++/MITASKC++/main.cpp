//
//  main.cpp
//  MITASKC++
//
//  Created by Andrei on 15/03/16.
//  Copyright © 2016 Andrei. All rights reserved.
//

#include <iostream>
#include "MIPermutation.h"
#include "MIPermutationByDivision.h"

int main(int argc, const char * argv[]) {
    std::cout << "Enter 0 to calculate with slower algorithm and 1 to calculate with a faster one\n";
    int selection = 0;
    scanf("%d", &selection);
    
    if (selection == 0){
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
    }
    
    else if (selection == 1){
        int amount = 0;
        std::cout << "Enter the required number of permutation (e.g. 1000000)\n";
        scanf("%d", &amount);
        if (amount > 0 && amount <= 3628800){
            MIStorageDivision divisionStorage;
            divisionStorage.calculatePermutationNumber(amount);
        }
        else {
            std::cout << "Incorrect input, try a number between 0 and 3628800\n";
        }
    
    }
    
    else {
        std::cout << "Incorrect input, enter 0 or 1";
    }
    return 0;
}
