//
//  Constants.h
//  LazyTravels
//
//  Created by radar on 2018/8/27.
//  Copyright © 2018年 radar. All rights reserved.
//
//用来放一些本项目专用的东西，如果有通用的方法等，以后转移到RDDevLibrary里边去

#import "DeviceUtils.h"

//常用的宏设定
#define IMAGE(str) [UIImage imageNamed:str]     //快速创建一个图片对象

#define IPHONEX [DeviceUtils deviceIsiPhoneX]   //是否iPhoneX
 
#define NAV_BAR_HEIGHT    (IPHONEX)?88.0f: 64.0f
#define STATUS_BAR_HEIGHT (IPHONEX)?44.0f: 20.0f



 



