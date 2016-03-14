//
//  main.m
//  MITask
//
//  Created by Andrei on 14/03/16.
//  Copyright © 2016 Andrei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MIStoragePermute.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int amount = 0;
        MIStoragePermute *permuteStorage = [MIStoragePermute new];
        NSLog(@"Enter the required number of permutation (e.g. 1000000)");
        scanf("%d", &amount);
        if (amount > 0 && amount <= 3628800)
            [permuteStorage permuteArrayOfNumbers:amount];
        else
            NSLog(@"Incorrect input, try a number between 0 and 3628800");
        }
    return 0;
}
