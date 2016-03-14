//
//  MIStoragePermute.h
//  MITask
//
//  Created by Andrei on 14/03/16.
//  Copyright © 2016 Andrei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MIStoragePermute : NSObject {
    NSArray* storageIndexArray;
    NSArray* storageNumberArray;
}

-(NSArray*)returnNumericArray;

-(void)permuteArrayOfNumbers;

@end
