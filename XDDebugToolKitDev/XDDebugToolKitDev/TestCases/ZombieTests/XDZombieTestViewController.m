//
//  XDZombieTestViewController.m
//  XDDebugToolKitDev
//
//  Created by SuXinDe on 2018/6/10.
//  Copyright © 2018年 su xinde. All rights reserved.
//

#import "XDZombieTestViewController.h"
#import "XDZombieDetector.h"
@interface XDZombieTestViewController ()

@property (nonatomic, assign) id assignObject;

@end

@implementation XDZombieTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    id object = [NSObject new];
    self.assignObject = object;
    [XDZombieDetector start];
}

- (IBAction)zombiePtrDetectClickAction:(id)sender {
    NSLog(@"%@", self.assignObject);
}

@end
