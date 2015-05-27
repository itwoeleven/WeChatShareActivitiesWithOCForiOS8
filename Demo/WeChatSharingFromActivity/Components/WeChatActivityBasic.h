//
//  WeChatActivityBasic.h
//  
//
//  Created by Leo Han on 15/5/13.
//
//

#import <UIKit/UIKit.h>
#import "WXApi.h"

@interface WeChatActivityBasic : UIActivity
@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, assign) BOOL isSessionScene;

@end
