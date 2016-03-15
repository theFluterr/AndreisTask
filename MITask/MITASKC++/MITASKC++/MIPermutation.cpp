//
//  MIPermutation.cpp
//  MITASKC++
//
//  Created by Andrei on 15/03/16.
//  Copyright © 2016 Andrei. All rights reserved.
//

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <iostream>
#include <algorithm>
#include <array>

#include "MIPermutation.h"
using namespace std;

int findSecondIntegerIndex(int array[], int first, int index, int lastIndex) {
    int secondIndex = index;
    for (int i = index + 1; i <= lastIndex; i++) {
        if (array[i] > first && array[i] < array[secondIndex]) {
            secondIndex = i;
        }
    }
    return secondIndex;
}

int findDifference (const void *intOne, const void *intTwo){
    return ( *(int *)intOne - *(int *)intTwo );
}

int* swapAndSort(int first, int second, int firstIndex, int secondIndex, int array[10]) {
    array[firstIndex] = second;
    array[secondIndex] = first;
    qsort(array + firstIndex + 1,  sizeof(array[0])*10/sizeof(int) - firstIndex - 1, sizeof(array[1]), findDifference);
    int *c = array;
    return c;
}

void MIStorage::permutateArrayOfNumbers(int times) {
    int first = 0;
    int second = 0;
    int firstIndex = 0;
    int iterationNumber = 0;
    bool isPermuted = false;
    int i = 0;
    for (int k = 0; k < 10; k++) {
        storageNumberArray[k] = k;
    }
    
        while (isPermuted == false) {
        iterationNumber ++;
        for (i = sizeof(storageNumberArray)/sizeof(int) - 2; i >= 0; --i) {
            if (storageNumberArray [i] < storageNumberArray [i+1]) {
                first = storageNumberArray[i];
                firstIndex = i;
                break;
            }
        }
        
        if (iterationNumber == times || i == -1) {
            cout << "FIN";
            isPermuted = true;
            }
        int secondIndex = findSecondIntegerIndex(storageNumberArray, first, firstIndex + 1, sizeof(storageNumberArray)/sizeof(int) - 1);
        second = storageNumberArray [secondIndex];
        
        for (int j = 0; j < sizeof(storageNumberArray)/sizeof(int); j++) {
            storageNumberArray[j] = swapAndSort(first, second, firstIndex, secondIndex, storageNumberArray)[j];
        }
        
    }
    
}
