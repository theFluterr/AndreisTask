//
//  MIStoragePermute.m
//  MITask
//
//  Created by Andrei on 14/03/16.
//  Copyright © 2016 Andrei. All rights reserved.
//

#import "MIStoragePermute.h"

@implementation MIStoragePermute

-(id)init {
    self = [super init];
    if (!self) return nil;
    storageNumberArray = @[@0, @1, @2, @3];
    storageAlphabeticArray = @[@"A", @"B", @"C", @"D"];
    finalOutput = [NSMutableArray new];
    return self;
}

-(NSArray*)returnNumericArray{
    return storageNumberArray;
}

-(NSArray*)returnAlphabeticArray {
    for (NSNumber *number in storageNumberArray)
        [finalOutput addObject:[storageAlphabeticArray objectAtIndex:[number intValue]]];
    if ([finalOutput count] > 4)
        [finalOutput removeObjectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 4)]];
    return finalOutput;
}

-(int)findSecondIntegerIndex:(NSArray*)array forFirstInteger:(int)firstInteger afterIndex:(int)index andLastIndex:(int)lastIndex{
    int secondIndex = index;
    for (int i = index + 1; i <= lastIndex; i++)
        if ([[array objectAtIndex:i] intValue] > firstInteger && [[array objectAtIndex:i] intValue] < [[array objectAtIndex:secondIndex] intValue])
            secondIndex = i;
    return secondIndex;
}

-(void)permuteArrayOfNumbers {
    int first = 0;
    int second = 0;
    int firstIndex = 0;
    int checkForCompletion = 0;
    BOOL isPermuted = false;
    int i = 0;
    while (isPermuted == NO) {
        
        NSLog(@"%@", [self returnAlphabeticArray]);
    
        for (i = (int)[storageNumberArray count] - 2; i >= 0; --i) {
            checkForCompletion = i;
            if ([storageNumberArray objectAtIndex:i] < [storageNumberArray objectAtIndex:i+1]){
                first = [[storageNumberArray objectAtIndex:i] intValue];
                firstIndex = i;
                break;
            }
        }
        
        if (i == -1)
            isPermuted = YES;
        
        else {
            
            int secondIndex = [self findSecondIntegerIndex:storageNumberArray forFirstInteger:first afterIndex:firstIndex + 1 andLastIndex:(int)[storageNumberArray count] - 1];
            second = [[storageNumberArray objectAtIndex:secondIndex] intValue];
    
        
        NSMutableArray *mutableCopy = [[NSMutableArray alloc] initWithArray:storageNumberArray];
        [mutableCopy replaceObjectAtIndex:firstIndex withObject:[NSNumber numberWithInt:second]];
        [mutableCopy replaceObjectAtIndex:secondIndex withObject:[NSNumber numberWithInt:first]];
        
            
            
        NSArray *sortingArray = [mutableCopy objectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(firstIndex + 1, [storageNumberArray count] - 1 - firstIndex)]];
        sortingArray = [sortingArray sortedArrayUsingSelector:@selector(compare:)];
        
        [mutableCopy replaceObjectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(firstIndex + 1, [storageNumberArray count] -1 - firstIndex)] withObjects:sortingArray];
            
        storageNumberArray = (NSArray *)mutableCopy;
            
            
        }
    }
}

@end
