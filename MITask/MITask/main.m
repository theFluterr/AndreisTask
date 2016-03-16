//
//  main.m
//  MITask
//
//  Created by Andrei on 14/03/16.
//  Copyright © 2016 Andrei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MIStoragePermute.h"
#import "MIDivisionPermutation.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Enter 0 to calculate with slower algorithm and 1 to calculate with a faster one");
        int selection = 0;
        scanf("%d", &selection);
        
        if (selection == 0){
        int amount = 0;
        MIStoragePermute *permuteStorage = [MIStoragePermute new];
        NSLog(@"Enter the required number of permutation (e.g. 1000000)");
        scanf("%d", &amount);
        if (amount > 0 && amount <= 3628800)
            [permuteStorage permuteArrayOfNumbers:amount];
        else
            NSLog(@"Incorrect input, try a number between 0 and 3628800");
        }
        
        else if (selection == 1){
        MIDivisionPermutation *divisionPermutator = [MIDivisionPermutation new];
        int amount = 0;
        NSLog(@"Enter the required number of permutation (e.g. 1000000)");
        scanf("%d", &amount);
        if (amount > 0 && amount <= 3628800)
            [divisionPermutator calculatePermutationNumber:amount];
        else
            NSLog(@"Incorrect input, try a number between 0 and 3628800");
        }
        
        else
            NSLog(@"Incorrect input, enter 0 or 1");
        
    }
        
    return 0;
}
