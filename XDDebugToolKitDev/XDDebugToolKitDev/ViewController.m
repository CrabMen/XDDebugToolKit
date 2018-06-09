//
//  ViewController.m
//  XDDebugToolKitDev
//
//  Created by SuXinDe on 2018/6/10.
//  Copyright © 2018年 su xinde. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *testCasesClasses;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.title = @"XDDebugTookKit";
    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"Cell"];
    self.testCasesClasses = @[
                              @{@"XDZombieTestViewController":@"OC野指针对象检测"},
                              
                              ];
}


#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.testCasesClasses.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *obj = self.testCasesClasses[indexPath.row];
    NSString *cls = obj.allKeys.firstObject;
    UIViewController *vc = [self getViewControllerFromStoryboardByStoryBoardID:cls];
    vc.title = obj.allValues.firstObject;
    [self.navigationController pushViewController:vc animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    NSDictionary *obj = self.testCasesClasses[indexPath.row];
    cell.textLabel.text = obj.allValues.firstObject;
    return cell;
}

#pragma mark -
- (UIViewController *)getViewControllerFromStoryboardByStoryBoardID:(NSString *)storyBoardID {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:storyBoardID];
    return vc;
}

@end
