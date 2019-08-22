//
//  AMEDelegateMaker.m
//  DelegateMaker
//
//  Created by AME on 2019/8/22.
//  Copyright © 2019 ame017. All rights reserved.
//

#import "AMEDelegateMaker.h"
#import "NSString+AMEGetterMaker.h"

static AMEDelegateMaker * _ame_delegate_maker;
@implementation AMEDelegateMaker

+ (instancetype)shardMaker{
    @synchronized (self) {
        if (!_ame_delegate_maker) {
            _ame_delegate_maker = [AMEDelegateMaker new];
        }
    }
    return _ame_delegate_maker;
}

- (void)makeDelegate:(XCSourceEditorCommandInvocation *)invocation{
    self.invocation = invocation;
    [self make];
}
- (void)make{
    XCSourceTextRange *range = self.invocation.buffer.selections[0];
    if (range) {
        NSString * text = self.invocation.buffer.lines[range.start.line];
        //这里应该是interface行
        //@interface HKMarketHeaderView : HKBaseView;
        NSString * className = [text getStringWithOutSpaceBetweenString1:@"@interface " string2:@" :"];
        if (!className || [className isEqualToString:@""]) {
            return;
        }
        NSLog(@"%@",className);
        
        NSString * delegateString = [NSString stringWithFormat:@"\n@property (nonatomic, weak) id<%@Delegate> delegate;",className];
        
        //protocol
        /*
         @class HKMarketHeaderView;
         @protocol HKMarketHeaderViewDelegate <NSObject>
         
         @required
         
         @optional
         - (void)hk_marketHeaderViewListButtonClick:(HKMarketHeaderView *)view;
         
         @end
         */
        NSString * line0 = [NSString stringWithFormat:@"\n@class %@;",className];
        NSString * line1 = [NSString stringWithFormat:@"\n@protocol %@Delegate <NSObject>\n",className];
        NSString * line2 = [NSString stringWithFormat:@"\n@required\n"];
        NSString * line3 = [NSString stringWithFormat:@"\n@optional\n"];
        
        //获取小写前缀的类名
        NSString * prefixLowercaseClassName = [self makePrefixLowercaseClassNameWithClassName:className];
        
        NSString * line4 = [NSString stringWithFormat:@"\n- (void)%@:(%@ *)view;\n",prefixLowercaseClassName,className];
        NSString * line5 = [NSString stringWithFormat:@"\n@end"];
        NSString * protocolString = [NSString stringWithFormat:@"%@%@%@%@%@%@",line0,line1,line2,line3,line4,line5];
        [self.invocation.buffer.lines insertObject:delegateString atIndex:range.start.line+1];
        [self.invocation.buffer.lines insertObject:protocolString atIndex:range.start.line];
    }
}
- (NSString *)makePrefixLowercaseClassNameWithClassName:(NSString *)className{
    NSString *temp = nil;
    BOOL isLowercase = NO;
    NSString * prefixLowercaseClassName = className.copy;
    for(int i = 0; i < prefixLowercaseClassName.length && !isLowercase; i++){
        temp = [prefixLowercaseClassName substringWithRange:NSMakeRange(i, 1)];
        if ([temp ame_compareWithRegex:@"[A-Z]*"]) {
            temp = [temp lowercaseString];
        }else{
            isLowercase = YES;
            break;
        }
        NSString * prefix = [prefixLowercaseClassName substringToIndex:i];
        NSString * suffix = [prefixLowercaseClassName substringFromIndex:i+1];
        prefixLowercaseClassName = [NSString stringWithFormat:@"%@%@%@",prefix,temp,suffix];
    }
    NSLog(@"prefixLowercaseClassName : %@",prefixLowercaseClassName);
    return prefixLowercaseClassName;
}
@end
