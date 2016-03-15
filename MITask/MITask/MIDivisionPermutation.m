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
    NSArray *values = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J"];
    NSArray *keys = @[@0, @1, @2, @3, @4, @5, @6, @7, @8, @9];
    storageDictionary = [NSMutableDictionary dictionaryWithObjects:values forKeys:keys];
    outputArray = [NSMutableArray new];
    return self;
}

-(int)factorialRecursive:(int)operand
{
    if( operand == 1 || operand == 0) {
        return 1;
    } else if( operand < 0 ) {
        return(-1);
    }
    return operand * [self factorialRecursive:operand-1];
}


-(void)calculatePermutationNumber:(int)required {
    
    int multiplier = 0;
    BOOL isCompleted = NO;
    for (int i = 0; i < 10; i++){
        multiplier = 0;
        int total = [self factorialRecursive:(int)[storageDictionary count]];
        int preIncrementTotalForOne = total / (int)[storageDictionary count];
        int totalForOne = total / (int)[storageDictionary count];
    for (multiplier = 1; totalForOne <= required; ++multiplier){
        totalForOne = totalForOne * multiplier;
    }
    [outputArray addObject:[storageDictionary objectForKey:[NSNumber numberWithInt:multiplier - 2]]];
    [storageDictionary removeObjectForKey:[NSNumber numberWithInt:multiplier - 2]];
    required = required - preIncrementTotalForOne;
    }
    NSLog(@"%@", outputArray);
}

@end
