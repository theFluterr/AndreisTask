//
//  MIDivisionPermutation.m
//  MITask
//
//  Created by Andrei on 15/03/16.
//  Copyright © 2016 Andrei. All rights reserved.
//

#import "MIDivisionPermutation.h"

@implementation MIDivisionPermutation

-(id)init{
    self = [super init];
    if (!self) return nil;
 
    storageArray = [NSMutableArray arrayWithArray:@[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J"]];
    outputArray = [NSMutableArray new];
    return self;
}
//Find factorial
-(int)factorialRecursive:(int)operand
{
    if( operand == 1 || operand == 0) {
        return 1;
    } else if( operand < 0 ) {
        return(-1);
    }
    return operand * [self factorialRecursive:operand-1];
}

//Calculate required permutatuion:
//First - find factorial of overall letters - 1, which represents remaining permutations for rest of letters
//Second - find the value which intersects with required permutation number by multiplying the factorial
//Get the multiplier and add corresponding object from array at multiplier index
//Remove the object from storage
//Decrease the required value (because we have "checked" some before)
//Thus, we find required permutation by adding needed letters one by one
-(void)calculatePermutationNumber:(int)required {
    int multiplier = 0;
    for (int i = 0; i < 10; i++){
        
        multiplier = 0;
        int total = [self factorialRecursive:(int)[storageArray count ] - 1];
        int index=0;
        for (int g=1; multiplier<required;g++){
            multiplier=multiplier+total;
            index=g;
        }
        index--;
        [outputArray addObject:[storageArray objectAtIndex:index]];
        [storageArray removeObjectAtIndex:index];
    required = required - total * index;
    }
    NSLog(@"%@", outputArray);
}

@end
