//
//  Utils.m
//  NYCSchools
//
//  Created by Manish Chaturvedi on 10/23/22.
//  Copyright © 2022 Manish Chaturvedi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Utils.h"

@implementation Utils

+ (UIAlertController *)getAlertController:(NSString *)message{
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@""
                                                        message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(10, 5, 50, 50)];
    
    indicator.hidesWhenStopped = YES;
    [indicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    
    [indicator startAnimating];
    [[alert view] addSubview: indicator];
    
    return alert;
}
@end
