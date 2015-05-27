//
//  WeChatActivityBasic.m
//  
//
//  Created by Leo Han on 15/5/13.
//
//

#import "WeChatActivityBasic.h"

@implementation WeChatActivityBasic

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
  if ([WXApi isWXAppInstalled] && [WXApi isWXAppSupportApi]) {
    for (id item in activityItems) {
      if ([item isKindOfClass:[UIImage class]]) {
        return YES;
      }
      
      if ([item isKindOfClass:[NSString class]]) {
        return YES;
      }
      
      if ([item isKindOfClass:[NSURL class]]) {
        return YES;
      }
    }
  }
  return NO;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems {
  for (id item in activityItems) {
    if ([item isKindOfClass:[UIImage class]]) {
      self.image = (UIImage *)item;
    }
    
    if ([item isKindOfClass:[NSString class]]) {
      self.text = (NSString *)item;
    }
    
    if ([item isKindOfClass:[NSURL class]]) {
      self.url = (NSURL *)item;
    }
  }
  
}

- (void)performActivity {
  SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
  req.bText = NO;
  req.message = [[WXMediaMessage alloc]init];
  if (self.isSessionScene) {
    req.scene = WXSceneSession;
  } else {
    req.scene = WXSceneTimeline;
  }
  
  req.message.title = self.text;
  req.message.description = @"就不写什么了";
  
  CGFloat width = 240.0;
  CGFloat height = width * self.image.size.height / self.image.size.width;
  
  CGRect rect = { CGPointZero, width, height };
  UIGraphicsBeginImageContext(CGSizeMake(width, height));
  [self.image drawInRect:rect];
  [[req message] setThumbImage: UIGraphicsGetImageFromCurrentImageContext()];
  UIGraphicsEndImageContext();

}

@end
