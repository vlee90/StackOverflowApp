//
//  NetworkControllerTest.m
//  StackOverflowApp
//
//  Created by Vincent Lee on 11/13/14.
//  Copyright (c) 2014 VincentLee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetworkController.h"
#import <XCTest/XCTest.h>

@interface NetworkControllerTest : XCTestCase

@end

@implementation NetworkControllerTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testIfJSONParseIsNSDictionary {
    NSString *pathway = [[NSBundle mainBundle] pathForResource:@"dummy" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:pathway];
    NetworkController *networkController = [[NetworkController alloc] init];
    NSDictionary *dict = [networkController parseJSON:data];
    XCTAssert([dict isKindOfClass:[NSDictionary class]]);
    
}

@end
