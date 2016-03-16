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

//Find the "second" integer
int findSecondIntegerIndex(int array[], int first, int index, int lastIndex) {
    int secondIndex = index;
    for (int i = index + 1; i <= lastIndex; i++) {
        if (array[i] > first && array[i] < array[secondIndex]) {
            secondIndex = i;
        }
    }
    return secondIndex;
}

//Swap "first" int with "second", then sort the rest of array
int* swapAndSort(int first, int second, int firstIndex, int secondIndex, int array[10]) {
    array[firstIndex] = second;
    array[secondIndex] = first;
    int size = 10 - firstIndex - 1;
    int sortingArray[size];
    for (int i = 0; i < size; i++){
        sortingArray[i] = array[i + firstIndex + 1];
    
    }
    std::size_t sizeArr = sizeof(sortingArray)/sizeof(sortingArray[0]);
    std::sort(sortingArray, sortingArray+sizeArr);
    for (int i = firstIndex + 1; i < 10; i++) {
        array[i] = sortingArray[i - firstIndex - 1];
    }
    return array;
}


//Prepare the output by mapping alphabetic array to corresponding indexes in numeric array (the array which was permutated)
int returnAlphabeticArray(int array[]) {
    char storageAlphabeticArray[10] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'};
    char finalOutput[10];
    for (int i = 0; i < 10; i++) {
        int k = array[i];
        finalOutput[i] = storageAlphabeticArray[k];
        printf("%c", finalOutput[i]);
    }
    return 0;
}

//Permutation function
//Firstly, find the "rightmost" int that is smaller than its neighbour on the right (the "first" int)
//Then, find the int on the right hand after the "first" integer, but is still the smallest one (the "second" int)
//Swap two integers
//Sort the part of the array that is on the right of the "first" int previous position
//Output, if reached the required permutation
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
        //Find the "first" int and its index
        for (i = sizeof(storageNumberArray)/sizeof(int) - 2; i >= 0; --i) {
            if (storageNumberArray [i] < storageNumberArray [i+1]) {
                first = storageNumberArray[i];
                firstIndex = i;
                break;
            }
        }
        //Check for completion & output
        if (iterationNumber == times || i == -1) {
            ::returnAlphabeticArray(storageNumberArray);
            printf("\n");
            isPermuted = true;
            }
            
        //Find the "second" int and its index
        int secondIndex = findSecondIntegerIndex(storageNumberArray, first, firstIndex + 1, sizeof(storageNumberArray)/sizeof(int) - 1);
        second = storageNumberArray [secondIndex];
         
        //Swap & sort
        int *newArrPointer = swapAndSort(first, second, firstIndex, secondIndex, storageNumberArray);
            
        for (int j = 0; j < sizeof(storageNumberArray)/sizeof(int); j++) {
            storageNumberArray[j] = newArrPointer[j];
        }
        
    }
    
}
