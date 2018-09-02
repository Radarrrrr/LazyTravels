//
//  DDCenter.h
//  TestNCEDeom
//
//  Created by Radar on 2017/3/16.
//  Copyright © 2017年 Radar. All rights reserved.
//

/* 支持的linkURL字典：

 home://                            //回到首页
 profile://                         //唤起个人中心页面
 setting://                         //唤起setting页面
 http://                            //http和https都直接开启web页面显示
 https://
 
 //以下几个暂时保留以后可能用到
 qrscaner://                        //二维码扫描器
 plaintext://text=xxxx              //进入空白文字页面，用于二维码扫描以后直接显示二维码中的内容
 friendcode://info=xxxx             //扫描二维码获得的好友信息，如果是已经添加的好友，则覆盖修改本地存储的信息

*/
 
 
 
#import <Foundation/Foundation.h>

@interface DDCenter : NSObject

+ (void)actionForLinkURL:(NSString*)linkURL; //中央控制器跳转字典接口，使用字典触发

@end
