//
//  MIStoragePermute.h
//  MITask
//
//  Created by Andrei on 14/03/16.
//  Copyright © 2016 Andrei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MIStoragePermute : NSObject {
    NSMutableArray *finalOutput;
    NSArray* storageNumberArray;
    NSArray* storageAlphabeticArray;
}

-(NSArray*)returnAlphabeticArray;
-(void)permuteArrayOfNumbers:(int)times;

@end
