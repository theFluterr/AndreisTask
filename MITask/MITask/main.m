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
        MIStoragePermute *permuteStorage = [MIStoragePermute new];
        [permuteStorage permuteArrayOfNumbers];
        //NSLog(@"%@", [permuteStorage returnNumericArray]);
    }
    return 0;
}
