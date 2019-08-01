//
//  FirstViewController.m
//  FlutterHybridiOS
//
//  Created by ZDQ on 2019/8/1.
//  Copyright © 2019 zdq. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UILabel *receiveDartMsg;
@property (weak, nonatomic) IBOutlet UILabel *channelLab;
@property(nonatomic,assign) BOOL useEventChannel;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showMessage:) name:@"showMessage" object:nil];

   
}
//switch 点击方法
- (IBAction)switchClick:(id)sender {
    UISwitch * switchB = (UISwitch *)sender;
    if (switchB.on) {
        self.useEventChannel = YES;
        self.channelLab.text = @"EventChannel";
    }else{
        self.useEventChannel = NO;
        self.channelLab.text = @"BasicMessageChannel";

    }
}
- (void)showMessage:(NSNotification *)notification{
    id params = notification.object;
    self.receiveDartMsg.text = [NSString stringWithFormat:@"来自Dart：%@",params];
}
//textfield  编辑方法
- (IBAction)editChange:(id)sender {
    NSString * text=((UITextField*)sender).text;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"sendMessage" object:@{@"message": text,@"useEventChannel":self.useEventChannel? @"true":@"false"}];
}

@end
