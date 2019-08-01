//
//  MainViewController.m
//  FlutterHybridiOS
//
//  Created by ZDQ on 2019/8/1.
//  Copyright © 2019 zdq. All rights reserved.
//

#import "MainViewController.h"
#import <Flutter/Flutter.h>

@interface MainViewController ()<FlutterStreamHandler>
@property (nonatomic, strong) FlutterViewController* flutterViewController;
@property (nonatomic) FlutterBasicMessageChannel* messageChannel;
@property (nonatomic) FlutterEventChannel* eventChannel;
@property (nonatomic) FlutterMethodChannel* methodChannel;
@property (nonatomic) FlutterEventSink eventSink;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sendMessage:) name:@"sendMessage" object:nil];
    [super viewDidLoad];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[FlutterViewController class]]) {
        self.flutterViewController = segue.destinationViewController;
        [self.flutterViewController setInitialRoute:self.inputParams];
        [self initChannel];
    }
}
//初始化channel
- (void)initChannel{
    [self initMessageChannel];
    [self initMethodChannel];
    [self initEventChannel];

}
- (void)initMessageChannel{
/*
 BasicMessageChannel ： 1，Native端将消息发送给Dart 端，之后，Dart还会回传回来，所以感觉形成了一个环，2， Dart端将消息发送给Native 端，之后，Native 端也会回传给Dart端
 */
    self.messageChannel = [[FlutterBasicMessageChannel alloc] initWithName:@"BasicMessageChannelPlugin" binaryMessenger:self.flutterViewController codec:[FlutterStringCodec sharedInstance]];
    __weak typeof(self) weakSelf = self;
    //设置消息处理器，处理来自Dart的消息
    [self.messageChannel setMessageHandler:^(id  _Nullable message, FlutterReply  _Nonnull callback) {
        //收到Dart 端的消息之后，回复给Dart 端
        callback([NSString stringWithFormat:@"BasicMessageChannel收到%@",message]);
        [weakSelf sendShow:message];
    }];
}
- (void)initMethodChannel{
/*
 methodChannel ： 主要是flutter 调用 native 端，native 处理 Dart 端传来的数据行了
 */
    self.methodChannel = [FlutterMethodChannel methodChannelWithName:@"MethodChannelPlugin" binaryMessenger:self.flutterViewController];
    __weak typeof(self) weakSelf = self;
    [self.methodChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([call.method isEqualToString:@"send"]) {
            //收到消息返回给Dart 端
            result([NSString stringWithFormat:@"MethodChannelPlugin 收到L：%@",call.arguments]);
            [weakSelf sendShow:call.arguments];
        }
    }];
    
}
- (void)initEventChannel{
    /*
     eventChannel: 主要是native 端掉 flutter 端，比如，native 将网络状态一直传给 flutter 端，
     */
    self.eventChannel = [FlutterEventChannel eventChannelWithName:@"EventChannelPlugin" binaryMessenger:self.flutterViewController];
//    设置回调的代理，Dart端传来的消息会走这个代理
    [self.eventChannel setStreamHandler:self];
}

#pragma mark - sendMessage
- (void)sendMessage:(NSNotification*)notification{
    NSString* mesage = [notification.object valueForKey:@"message"];
    if ([@"true" isEqual:[notification.object valueForKey:@"useEventChannel"]]) {
        //用EventChannel发送数据给Dart 端
        if (self.eventSink != nil) {
            self.eventSink(mesage);
        }
    } else {
        //用MessageChannel发送数据给Dart 端
        [self.messageChannel sendMessage: mesage reply:^(id  _Nullable reply) {
            if (reply != nil) {
                [self sendShow:reply];
            }
        }];
    }
}

//收到Dart模块消息，转发到 FirstViewController 中去
- (void)sendShow:(NSString*) message{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"showMessage" object:message];
}

#pragma  mark -- FlutterStreamHandler
//这个onListen是Flutter端开始监听这个channel时的回调，第二个参数 EventSink是用来传数据的载体
- (FlutterError* _Nullable)onListenWithArguments:(id _Nullable)arguments
                                       eventSink:(FlutterEventSink)events;
{
    // arguments flutter给native的参数
    // 回调给flutter， 建议使用实例指向，因为该block可以使用多次
    self.eventSink = events;
    return nil;
    
}
// flutter不再接收
- (FlutterError* _Nullable)onCancelWithArguments:(id _Nullable)arguments;
{
    self.eventSink = nil;
    return nil;
}
@end
