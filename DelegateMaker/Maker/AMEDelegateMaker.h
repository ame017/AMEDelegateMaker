//
//  AMEDelegateMaker.h
//  DelegateMaker
//
//  Created by AME on 2019/8/22.
//  Copyright © 2019 ame017. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <XcodeKit/XcodeKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AMEDelegateMaker : NSObject

@property (nonatomic, strong)XCSourceEditorCommandInvocation *invocation;

+ (instancetype)shardMaker;
- (void)makeDelegate:(XCSourceEditorCommandInvocation *)invocation;

@end

NS_ASSUME_NONNULL_END
