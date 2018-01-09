//
//  ACCameraViewController.m
//  ACCameraDemo
//
//  Created by LiYang on 2018/1/9.
//  Copyright © 2018年 LiYang. All rights reserved.
//

#import "ACCameraViewController.h"
#import "ACCameraView.h"
#import <AudioToolbox/AudioToolbox.h>


static SystemSoundID shake_sound_male_id = 0;
@interface ACCameraViewController ()
@property (nonatomic, readonly) ACCameraView * cameraView;

@end

@implementation ACCameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    ACCameraView * camera = [[ACCameraView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:camera];
    
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
