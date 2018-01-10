//
//  ACCameraViewController.m
//  ACCameraDemo
//
//  Created by LiYang on 2018/1/9.
//  Copyright © 2018年 LiYang. All rights reserved.
//

#import "ACCameraViewController.h"
 #import <AudioToolbox/AudioToolbox.h>
#import "ACCameraTopView.h"
#import "ACCameraBottomView.h"
#import "ACCameraManager.h"
#import "UIView+ACCameraFrame.h"
#import "ACCameraHeader.h"

@interface ACCameraViewController ()<ACCameraTopViewDelegate,ACCameraBottomViewDelegate>

@property (nonatomic, readonly)ACCameraManager * cameraManager;
@property (nonatomic, strong)ACCameraTopView * topView;
@property (nonatomic, strong)ACCameraBottomView * bottomView;

@end

@implementation ACCameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
 
    [self setui];
 
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}
- (void)dealloc {
    [self.cameraManager stopCamera];
}
- (BOOL)prefersStatusBarHidden {
    return YES;
}
- (void)setui {
    [self.view addSubview:self.topView];
    CGRect frame = CGRectMake(0, CGRectGetMaxY(self.topView.frame), self.view.ca_width,self.view.ca_height - self.topView.ca_height - ACCAMERA_AdjustValue(120));
    [self.cameraManager setVieweFrame:frame superview:self.view];
    [self.cameraManager setfocusImage:[UIImage imageNamed:@"touch_focus_x"]];
    [self.cameraManager setFilterAtIndex:1];
    [self.cameraManager startCamera];
    [self.view addSubview:self.bottomView];
}

- (ACCameraTopView *)topView {
    if (!_topView) {
        _topView = [[ACCameraTopView alloc] initWithFrame:CGRectMake(0, 0, self.view.ca_width, ACCAMERA_AdjustValue(44))];
        _topView.delegate = self;
        _topView.backgroundColor = [UIColor blackColor];
    }
    return _topView;
}

- (ACCameraManager*)cameraManager {
    ACCameraManager * manager =    [ACCameraManager cameraManager];
    
    return manager;
}

- (ACCameraBottomView*)bottomView {
    if (!_bottomView) {
        _bottomView = [[ACCameraBottomView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.cameraManager.cameraScreen.frame), self.view.ca_width, self.view.ca_height - self.topView.ca_height - self.cameraManager.cameraScreen.ca_height)];
        _bottomView.delegate = self;
        _bottomView.backgroundColor = [UIColor blackColor];
    }
    return _bottomView;
}


#pragma mark Top and Bottom delegate

- (void)touchCancel:(ACCameraTopView*)cameraTopView{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)switchCamera:(ACCameraTopView*)cameraTopView{
#pragma mark 改变摄像头位置
    if (self.cameraManager.position == LMCameraManagerDevicePositionBack)
        self.cameraManager.position = LMCameraManagerDevicePositionFront;
    else
        self.cameraManager.position = LMCameraManagerDevicePositionBack;
}

- (void)sharkStart:(ACCameraTopView*)cameraTopView sharkBtn:(UIButton *)btn {
    switch (self.cameraManager.flashMode) {
        case LMCameraManagerFlashModeAuto:
            self.cameraManager.flashMode = LMCameraManagerFlashModeOn;
            [btn setImage:[UIImage imageNamed:@"flashing_on"] forState:UIControlStateNormal];
            break;
        case LMCameraManagerFlashModeOff:
            self.cameraManager.flashMode = LMCameraManagerFlashModeAuto;
            [btn setImage:[UIImage imageNamed:@"flashing_auto"] forState:UIControlStateNormal];
            break;
        case LMCameraManagerFlashModeOn:
            self.cameraManager.flashMode = LMCameraManagerFlashModeOff;
            [btn setImage:[UIImage imageNamed:@"flashing_off"] forState:UIControlStateNormal];
            break;
            
        default:
            break;
    }
}


- (void)takePhoto:(ACCameraBottomView*)cameraBottomView{
    
     [self.cameraManager snapshotSuccess:^(UIImage *image) {
        
    } snapshotFailure:^{
        NSLog(@"拍照失败");
    }];
}

- (void)showPhotoAlblum:(ACCameraBottomView*)cameraBottomView{
    
}

- (void)tintPhoto:(ACCameraBottomView*)cameraBottomView {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
