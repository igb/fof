//
//  FofTests.m
//  FofTests
//
//  Created by Ian Brown  on 9/16/18.
//  Copyright © 2018 Ian Brown. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Grid.h"

@interface FofTests : XCTestCase

@end

@implementation FofTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testTransform {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    XCTAssert(-4 == [[[Grid alloc] init] transform:520 :600 :20]);
    
}

- (void)testMap {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    XCTAssert(-4 == [[[Grid alloc] init] transform:520 :600 :20]);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
