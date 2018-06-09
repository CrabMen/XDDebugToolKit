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
 
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"Cell"];
    self.testCasesClasses = @[
                              @"XDZombieTestViewController",
                              
                              ];
}


#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.testCasesClasses.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cls = self.testCasesClasses[indexPath.row];
    UIViewController *vc = [self getViewControllerFromStoryboardByStoryBoardID:cls];
    [self.navigationController pushViewController:vc animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = self.testCasesClasses[indexPath.row];
    return cell;
}

#pragma mark -
- (UIViewController *)getViewControllerFromStoryboardByStoryBoardID:(NSString *)storyBoardID {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:storyBoardID];
    return vc;
}

@end
