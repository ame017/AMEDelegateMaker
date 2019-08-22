//
//  SourceEditorCommand.m
//  DelegateMaker
//
//  Created by AME on 2019/8/22.
//  Copyright © 2019 ame017. All rights reserved.
//

#import "SourceEditorCommand.h"
#import "AMEDelegateMaker.h"

@implementation SourceEditorCommand

- (void)performCommandWithInvocation:(XCSourceEditorCommandInvocation *)invocation completionHandler:(void (^)(NSError * _Nullable nilOrError))completionHandler
{
    // Implement your command here, invoking the completion handler when done. Pass it nil on success, and an NSError on failure.
    NSLog(@"%@",invocation);
    
    if ([invocation.commandIdentifier hasSuffix:@"SourceEditorCommand"]){
        [[AMEDelegateMaker shardMaker]makeDelegate:invocation];
    }
    completionHandler(nil);
}

@end
