//
//  ViewController.m
//  数字键盘
//
//  Created by 贺恒涛 on 15/12/30.
//  Copyright © 2015年 贺恒涛. All rights reserved.
//
#define ApplicationDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)
#define adapterRect    ApplicationDelegate.window.bounds.size.width / 414.0
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight  [UIScreen mainScreen].bounds.size.height

#define networkURL  @"https://www.starbuyer.com/upload/2016/01/14/1452742761.mp4"
#import "ViewController.h"
#import "AppDelegate.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>
@interface ViewController (){
    UIView *pointView;//提示框
    UIView *videoView;//视频
}
@property (nonatomic,strong) MPMoviePlayerController *moviePlayer;//视频播放控制器
@property(nonatomic,strong)NSNotificationCenter *notificationCenter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     //[self addAlertview];
    if (self.moviePlayer.playbackState==MPMoviePlaybackStatePlaying||self.moviePlayer.playbackState==MPMoviePlaybackStatePaused) {
        [self.moviePlayer play];
    }
    else
    {
    }

    // Do any additional setup after loading the view, typically from a nib.
}
-(void)addAlertview{
    
    pointView = [[UIView alloc]initWithFrame:CGRectMake(72 *adapterRect, 313*adapterRect, 272*adapterRect, 105*adapterRect)];
    [pointView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"navigation_bg"]]];
    pointView.backgroundColor = [UIColor redColor];
    pointView.layer.cornerRadius = 15;
    pointView.layer.masksToBounds = YES;
    
    UILabel *alertLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 272*adapterRect, 59*adapterRect)];
    alertLabel.text = @"是否确认发布";
    alertLabel.textAlignment = NSTextAlignmentCenter;
    alertLabel.font = [UIFont systemFontOfSize:20];
    alertLabel.textColor = [UIColor blackColor];
    
    UIImageView *imageLine = [[UIImageView alloc]initWithFrame:CGRectMake(0, 59*adapterRect, 272*adapterRect, 1*adapterRect)];
    imageLine.backgroundColor = [UIColor blackColor];
    UIImageView *imageLine1 = [[UIImageView alloc]initWithFrame:CGRectMake(135*adapterRect, 60*adapterRect, 1*adapterRect, 55*adapterRect)];
    imageLine1.backgroundColor = [UIColor blackColor];
    
    UIButton *sureBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 55*adapterRect, 135*adapterRect, 55*adapterRect)];
    UIButton *canleBtn = [[UIButton alloc]initWithFrame:CGRectMake(136*adapterRect, 55*adapterRect, 136*adapterRect, 55*adapterRect)];
    [sureBtn setTitle:@"发布" forState:UIControlStateNormal];
    [canleBtn setTitle:@"再次确认" forState:UIControlStateNormal];
    sureBtn.titleLabel.textColor = [UIColor blackColor];
    canleBtn.titleLabel.textColor = [UIColor blackColor];
    
    [sureBtn addTarget:self action:@selector(surnbutton) forControlEvents:UIControlEventTouchUpInside];
    [canleBtn addTarget:self action:@selector(canlebutton) forControlEvents:UIControlEventTouchUpInside];
    
    [pointView addSubview:alertLabel];
    [pointView addSubview:imageLine];
    [pointView addSubview:imageLine1];
    [pointView addSubview:sureBtn];
    [pointView addSubview:canleBtn];
    
    [self.view addSubview:pointView];
}
-(void)surnbutton{
    
}
-(void)canlebutton{
    
}
-(void)viewWillAppear:(BOOL)animated{
    [self videoBroadcast];

}
-(void)videoBroadcast{
    NSString *urlStr= @"http://flv2.bn.netease.com/videolib3/1511/19/RiCBl0272/SD/RiCBl0272-mobile.mp4";//[[self.allDataArray objectAtIndex:btn.tag] mp4_url];
    //NSString* UrlStr=[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    self.moviePlayer = [[MPMoviePlayerController alloc]initWithContentURL:[NSURL URLWithString:urlStr]];
    self.moviePlayer.view.frame = CGRectMake(0, 200*adapterRect, 414*adapterRect, 200*adapterRect);
    
    _moviePlayer.view.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    _moviePlayer.movieSourceType=MPMovieSourceTypeStreaming;
    _moviePlayer.controlStyle = MPMovieControlStyleNone;
    
    [self.view addSubview:self.moviePlayer.view];
    [self.moviePlayer play];
    [self addNotification];

}
-(void)addNotification{
    
    self.notificationCenter=[NSNotificationCenter defaultCenter];
    
    
    [self.notificationCenter addObserver:self selector:@selector(mediaPlayerPlaybackStateChange:) name:MPMoviePlayerPlaybackStateDidChangeNotification object:self.moviePlayer];
    
    if ([self.moviePlayer respondsToSelector:@selector(loadState)])
    {
        [self.moviePlayer prepareToPlay];
    }
    else
    {
        [self.moviePlayer play];
    }
    [self.notificationCenter addObserver:self selector:@selector(mediaPlayerPlayFinished:) name:MPMoviePlayerPlaybackDidFinishNotification object:self.moviePlayer];
}
-(void)mediaPlayerPlaybackStateChange:(NSNotification *)notification{
   
    if ([self.moviePlayer loadState]!=MPMovieLoadStateUnknown)
    {
        
        switch (self.moviePlayer.playbackState) {
            case MPMoviePlaybackStatePlaying:
                
                //  NSLog(@"正在播放...");
                break;
            case MPMoviePlaybackStatePaused:
                // NSLog(@"暂停播放.");
                break;
            case MPMoviePlaybackStateStopped:
                // NSLog(@"停止播放.");
                break;
            default:
                // NSLog(@"播放状态:%li",self.moviePlayer.playbackState);
                break;
        }
    }
}

/**
 *  播放完成
 *
 *  @param notification 通知对象
 */
-(void)mediaPlayerPlayFinished:(NSNotification *)notification
{
    //NSLog(@"播放完成.%li",self.moviePlayer.playbackState);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
