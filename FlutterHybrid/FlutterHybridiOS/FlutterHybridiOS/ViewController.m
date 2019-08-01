//
//  ViewController.m
//  FlutterHybridiOS
//
//  Created by ZDQ on 2019/7/31.
//  Copyright © 2019 zdq. All rights reserved.
//

#import "ViewController.h"
#import <Flutter/Flutter.h>
#import <FlutterPluginRegistrant/GeneratedPluginRegistrant.h>//导入插件需要这个
#import "MainViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Flutter和iOS混合开发";
}
- (IBAction)flutterVCClick:(id)sender {
    
    FlutterViewController * vc = [[FlutterViewController alloc] init];
    //    可设置参数和路由
    [vc setInitialRoute:@"{name:'page',data:['aa','bb','cc']}"];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[MainViewController class]]) {
        ((MainViewController *)segue.destinationViewController).inputParams = self.textField.text;
    }
}


@end
