//
//  MIDivisionPermutation.h
//  MITask
//
//  Created by Andrei on 15/03/16.
//  Copyright © 2016 Andrei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MIDivisionPermutation : NSObject {
    NSMutableArray *storageArray;
    NSMutableArray *outputArray;
}

-(void)calculatePermutationNumber:(int)required;

@end
