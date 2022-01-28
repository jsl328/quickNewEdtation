//
//  Regx.m
//  QPicVideo
//
//  Created by jiangsl on 2022/1/28.
//

#import "Regx.h"

@implementation Regx
-(instancetype)init
{
    if (self =[super init]) {
        
    }
    return self;
}
-(void)match:(NSString *)reg{
    NSString *searchText =@"<a href='xxx'><span></span></a><span></span>";
    NSError *error = NULL;
//    NSString *regx = @"/<a href='(.+?)'>(.+?)/a>/gi";
    NSString *regx = @"<.+?>";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regx options:NSRegularExpressionCaseInsensitive error:&error];
    NSTextCheckingResult *result = [regex firstMatchInString:searchText options:0 range:NSMakeRange(0, [searchText length])];
    if (result) {
     NSLog(@"%@", [searchText substringWithRange:result.range]);
    }
}
@end
