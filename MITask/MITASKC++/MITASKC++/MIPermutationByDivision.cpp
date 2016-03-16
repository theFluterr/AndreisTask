//
//  MIPermutationByDivision.cpp
//  MITASKC++
//
//  Created by Andrei on 16/03/16.
//  Copyright © 2016 Andrei. All rights reserved.
//
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <iostream>
#include <algorithm>
#include <array>

#include "MIPermutationByDivision.h"
using namespace std;

//Find factorial
int factorialRecursive (int operand){
    if( operand == 1 || operand == 0) {
        return 1;
    } else if( operand < 0 ) {
        return(-1);
    }
    return operand * ::factorialRecursive(operand - 1);
}

//Calculate required permutatuion:
//First - find factorial of overall letters - 1, which represents remaining permutations for rest of letters
//Second - find the value which intersects with required permutation number by multiplying the factorial
//Get the multiplier and add corresponding object from array at multiplier index
//Remove the object from storage
//Decrease the required value (because we have "checked" some before)
//Thus, we find required permutation by adding needed letters one by one

void MIStorageDivision::calculatePermutationNumber(int required){
    int multiplier = 0;
    std::string storageString = "ABCDEFGHIJ";
    for (int i = 0; i < 10; i++) {
        multiplier = 0;
        int total = ::factorialRecursive((int)(storageString.length()) - 1);
        int index = 0;
        for (int g=1; multiplier<required;g++){
            multiplier=multiplier+total;
            index=g;
        }
        index--;
        finalOutput += storageString[index];
        storageString.erase(std::remove(storageString.begin(), storageString.end(), storageString[index]), storageString.end());
        required = required - total * index;
    }
    printf("%s\n", finalOutput.c_str());
}