//
//  ACCameraView.m
//  ACCameraDemo
//
//  Created by LiYang on 2018/1/9.
//  Copyright © 2018年 LiYang. All rights reserved.
//

#import "ACCameraView.h"
#import "ACCameraHeader.h"

#define IS_IPHONE4 ([UIScreen mainScreen].bounds.size.height == 480)


#define iphone4_image_scale 480 / 320

#define iphone6_image_scale 500 / 375

#define headerView_height 50
#define bottomView_height 80
@interface ACCameraView ()<ACCameraBottomViewDelegate,ACCameraTopViewDelegate>

@end

@implementation ACCameraView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}


- (void)setupUI {
    [self addSubview:self.topView];
    [self.cameraManager startCamera];
    [self addSubview:self.bottomView];
}
- (void)dealloc {
    [self.cameraManager stopCamera];
}

#pragma mark 摄像头位置按钮
- (ACCameraManager *)cameraManager {
   ACCameraManager * manager =    [ACCameraManager cameraManager];
    CGRect frame = CGRectMake(0, CGRectGetMaxY(self.topView.frame),  self.bounds.size.width, self.bounds.size.height - headerView_height - bottomView_height);
    [manager setVieweFrame:frame superview:self];
    [manager setfocusImage:[UIImage imageNamed:@"touch_focus_x"]];
    [manager setFilterAtIndex:0];
    self.cameraManager = manager;

    return manager;
}
#pragma mark getter 方法

- (ACCameraTopView*)topView {
    if (!_topView) {
        _topView = [[ACCameraTopView alloc] initWithFrame:CGRectMake(0, ACCAMERA_NAVI_TOP_PADDING, self.bounds.size.width, ACCAMERA_AdjustValue(44))];
        _topView.backgroundColor = [UIColor blackColor];
        _topView.delegate = self;
    }
    return _topView;
}



- (ACCameraBottomView*)bottomView {
    if (!_bottomView) {
        _bottomView = [[ACCameraBottomView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.cameraManager.cameraScreen.frame), self.bounds.size.width, self.bounds.size.height - self.topView.bounds.size.height - self.cameraManager.cameraScreen.frame.size.height - ACCAMERA_NAVI_TOP_PADDING - ACCAMERA_BOTTOM_PADDING)];
        _bottomView.backgroundColor = [UIColor blackColor];
        _bottomView.delegate        = self;
        
//        [ACPhotoTool latestAsset:^(ACAsset * _Nullable asset) {
//            [_bottomView setTheLatestImageWith:asset.image];
//        }];
    }
    return _bottomView;
}

#pragma mark bottomViewDelegate && topViewDelegate


//- (void)takePhoto:(ACCameraBottomView*)cameraBottomView {
//    if (self.delegate && [self.delegate respondsToSelector:@selector(takePhotoAction:)]) {
//        [self.delegate takePhotoAction:self];
//    }
//}
//- (void)showPhotoAlblum:(ACCameraBottomView *)cameraBottomView {
//    if (self.delegate && [self.delegate respondsToSelector:@selector(showPhotoAlbum:)]) {
//        [self.delegate showPhotoAlbum:self];
//    }
//}
//- (void)tintPhoto:(ACCameraBottomView *)cameraBottomView {
//    if (self.delegate && [self.delegate respondsToSelector:@selector(tintPhotoAlbum:)]) {
//        [self.delegate tintPhotoAlbum:self];
//    }
//}
//- (void)touchCancel:(ACCameraTopView *)cameraTopView {
//    if (self.delegate && [self.delegate respondsToSelector:@selector(cancelAction:)]) {
//        [self.delegate cancelAction:self];
//    }
//}
//- (void)switchCamera:(ACCameraTopView *)cameraTopView {
//    if (self.delegate && [self.delegate respondsToSelector:@selector(switchCameraAction:)]) {
//        [self.delegate switchCameraAction:self ];
//    }
//}
//- (void)sharkStart:(ACCameraTopView *)cameraTopView {
//    if (self.delegate && [self.delegate respondsToSelector:@selector(flashLightAction:)]) {
//        [self.delegate flashLightAction:self];
//    }
//}


@end
