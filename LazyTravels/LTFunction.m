//
//  LTFunction.m
//  LazyTravels
//
//  Created by radar on 2018/9/2.
//  Copyright © 2018年 radar. All rights reserved.
//

#import "LTFunction.h"

@implementation LTFunction


//旋转一个view
+ (void)rotateView:(UIView*)view                //要旋转的view
             angle:(CGFloat)angle               //旋转的角度 +为顺时针 -为逆时针，如 M_PI 或 -M_PI/2
          duration:(float)duration              //旋转速度，要转完angle指定的角度需要的时间
        completion:(void(^)(void))completion
{
    if(!view) return;
    if(angle == 0.0) return;
    if(duration == 0.0) return;
    
    [UIView animateWithDuration:duration  
                          delay:0.0  
                        options:UIViewAnimationOptionCurveEaseInOut  
                     animations:^{  
                         view.transform = CGAffineTransformRotate(view.transform, angle);  
                     }  
                     completion:^(BOOL finished) {  
                         if(completion)
                         {
                             completion();
                         }
                     }]; 
}




@end
