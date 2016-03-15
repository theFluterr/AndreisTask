//
//  MIStoragePermute.m
//  MITask
//
//  Created by Andrei on 14/03/16.
//  Copyright © 2016 Andrei. All rights reserved.
//

#import "MIStoragePermute.h"

@implementation MIStoragePermute

//Initialize the object with two arrays
-(id)init {
    self = [super init];
    if (!self) return nil;
    storageNumberArray = @[@0, @1, @2, @3, @4, @5, @6, @7, @8, @9];
    storageAlphabeticArray = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J"];
    finalOutput = [NSMutableArray new];
    return self;
}

//Prepare the output by mapping alphabetic array to corresponding indexes in numeric array (the array which was permutated)
-(NSArray*)returnAlphabeticArray {
    for (NSNumber *number in storageNumberArray)
        [finalOutput addObject:[storageAlphabeticArray objectAtIndex:[number intValue]]];
    if ([finalOutput count] > 10)
        [finalOutput removeObjectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 10)]];
    return finalOutput;
}

//Find the "second" integer
-(int)findSecondIntegerIndex:(NSArray*)array forFirstInteger:(int)firstInteger afterIndex:(int)index andLastIndex:(int)lastIndex{
    int secondIndex = index;
    for (int i = index + 1; i <= lastIndex; i++)
        if ([[array objectAtIndex:i] intValue] > firstInteger && [[array objectAtIndex:i] intValue] < [[array objectAtIndex:secondIndex] intValue])
            secondIndex = i;
    return secondIndex;
}

//Swap "first" int with "second", then sort the rest of array
-(void)swapFirstInteger:(int)first withSecond:(int)second andSortAfterIndex:(int)firstIndex  withSecondIndex:(int)secondIndex{
    NSMutableArray *mutableCopy = [[NSMutableArray alloc] initWithArray:storageNumberArray];
    //Swap
    [mutableCopy replaceObjectAtIndex:firstIndex withObject:[NSNumber numberWithInt:second]];
    [mutableCopy replaceObjectAtIndex:secondIndex withObject:[NSNumber numberWithInt:first]];
    //Sort
    NSArray *sortingArray = [mutableCopy objectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(firstIndex + 1, [storageNumberArray count] - 1 - firstIndex)]];
    sortingArray = [sortingArray sortedArrayUsingSelector:@selector(compare:)];
    [mutableCopy replaceObjectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(firstIndex + 1, [storageNumberArray count] -1 - firstIndex)] withObjects:sortingArray];
    
    storageNumberArray = (NSArray *)mutableCopy;
}

//Permutation function
//Firstly, find the "rightmost" int that is smaller than its neighbour on the right (the "first" int)
//Then, find the int on the right hand after the "first" integer, but is still the smallest one (the "second" int)
//Swap two integers
//Sort the part of the array that is on the right of the "first" int previous position
//Output, if reached the required permutation

-(void)permuteArrayOfNumbers:(int)times {
    int first = 0;
    int second = 0;
    int firstIndex = 0;  
    int iterationNumber = 0;
    BOOL isPermuted = false;
    int i = 0;
    while (isPermuted == NO) {
        //Find the "first" int and its index
        iterationNumber++;
        for (i = (int)[storageNumberArray count] - 2; i >= 0; --i) {
            if ([storageNumberArray objectAtIndex:i] < [storageNumberArray objectAtIndex:i+1]){
                first = [[storageNumberArray objectAtIndex:i] intValue];
                firstIndex = i;
                break;
            }
        }
        //Check for completion & output
        if (iterationNumber == times || i == -1){
            NSLog(@"%@", [self returnAlphabeticArray]);
            isPermuted = YES;
        }
    
        else {
            //Find the "second" int and its index
            int secondIndex = [self findSecondIntegerIndex:storageNumberArray forFirstInteger:first afterIndex:firstIndex + 1 andLastIndex:(int)[storageNumberArray count] - 1];
            second = [[storageNumberArray objectAtIndex:secondIndex] intValue];
            
            //Swap & sort
            [self swapFirstInteger:first withSecond:second andSortAfterIndex:firstIndex withSecondIndex:secondIndex];
        }
    }
}

@end
