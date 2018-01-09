//
//  ACCameraView.h
//  ACCameraDemo
//
//  Created by LiYang on 2018/1/9.
//  Copyright © 2018年 LiYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ACCameraTopView.h"
#import "ACCameraBottomView.h"
#import "ACCameraManager.h"

@interface ACCameraView : UIView

  //顶部操作菜单
@property (nonatomic, strong) ACCameraTopView            *topView;
// 底部操作菜单图层
@property (nonatomic, strong) ACCameraBottomView         *bottomView;

@property (nonatomic, strong) ACCameraManager    *cameraManager;


@end
