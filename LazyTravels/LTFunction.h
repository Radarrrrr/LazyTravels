//
//  LTFunction.h
//  LazyTravels
//
//  Created by radar on 2018/9/2.
//  Copyright © 2018年 radar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LTFunction : NSObject


//旋转一个view
//PS：本方法只提供固定角度的一次性旋转，不能无限循环，因为如果无限循环则必须要有停下来，如果需要那功能，请使用UIButton+Spin类别提供的方法。
+ (void)rotateView:(UIView*)view                //要旋转的view
             angle:(CGFloat)angle                 //旋转的角度 +为顺时针 -为逆时针，如 M_PI 或 -M_PI/2
          duration:(float)duration              //旋转速度，要转完angle指定的角度需要的时间
        completion:(void(^)(void))completion;




@end
