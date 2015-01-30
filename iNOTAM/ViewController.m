//
//  ViewController.m
//  iNOTAM
//
//  Created by 林 英市 on 2014/12/24.
//  Copyright (c) 2014年 skyElements. All rights reserved.
//

#import "ViewController.h"

#import "RequestViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UIWebView *webView;
    UINavigationBar *navigationBar;
    UILabel *flightLabel;
    
    UIButton *requestButton;
    RequestViewController *requestViewController;
    UIPopoverController *requestPopoverController;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    webView = [[UIWebView alloc] init];
    webView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    webView.scalesPageToFit = YES;
    [self.view addSubview:webView];
    
    navigationBar = [[UINavigationBar alloc] init];
    navigationBar.frame = CGRectMake(0, 0, self.view.frame.size.width, 64);
    navigationBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:navigationBar];
    
    flightLabel = [[UILabel alloc] init];
    flightLabel.frame = CGRectMake(0, 0, 100, 44);
    flightLabel.center = CGPointMake(navigationBar.frame.size.width / 2, 42);
    flightLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    flightLabel.textAlignment = NSTextAlignmentCenter;
    flightLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:25];
    [navigationBar addSubview:flightLabel];
    
    requestButton = [UIButton buttonWithType:UIButtonTypeSystem];
    requestButton.frame = CGRectMake(navigationBar.frame.size.width - 88, 20, 88, 44);
    requestButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    [requestButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:20]];
    [requestButton setTitle:@"NEW" forState:UIControlStateNormal];
    [requestButton addTarget:self action:@selector(openRequestView) forControlEvents:UIControlEventTouchDown];
    [navigationBar addSubview:requestButton];
    
    requestViewController = [[RequestViewController alloc] init];
    requestViewController.preferredContentSize = CGSizeMake(300, 382);
    requestPopoverController = [[UIPopoverController alloc] initWithContentViewController:requestViewController];
    requestPopoverController.delegate = self;
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(expirationDateCheck) name:@"expirationDateCheck" object:nil];
    [notificationCenter addObserver:self selector:@selector(didFinishLoading) name:@"didFinishLoading" object:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self didFinishLoading];
}

- (void)openRequestView
{
    [requestPopoverController presentPopoverFromRect:requestButton.bounds
                                              inView:requestButton
                            permittedArrowDirections:UIPopoverArrowDirectionUp
                                            animated:YES];
}

- (void)expirationDateCheck
{
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"date"])
    {
        float tmp = [[NSDate date] timeIntervalSinceDate:[[NSUserDefaults standardUserDefaults] objectForKey:@"date"]];
        int hour = (int)(tmp / 3600);
        //int minute = (int)((tmp - hour) / 60);
        //float second = tmp - (float)(hour * 3600 + minute * 60);
        
        if (hour > 24)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"データ削除完了"
                                                            message:@"前回のダウンロードから24時間以上が経過したため、保存されていたデータを削除しました。"
                                                           delegate:self cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil, nil];
            [alert show];
            
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"pdfData"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"flightNumber"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"date"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            [self didFinishLoading];
        }
    }
}

- (void)didFinishLoading
{
    [requestPopoverController dismissPopoverAnimated:YES];
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"flightNumber"])
    {
        flightLabel.text = [NSString stringWithFormat:@"JL%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"flightNumber"]];
    }else
    {
        flightLabel.text = @"No Flight";
        
        [requestPopoverController presentPopoverFromRect:requestButton.bounds
                                                  inView:requestButton
                                permittedArrowDirections:UIPopoverArrowDirectionUp
                                                animated:YES];
    }
    
    NSData *pdfData = [[NSUserDefaults standardUserDefaults] objectForKey:@"pdfData"];
    [webView loadData:pdfData MIMEType:@"application/pdf" textEncodingName:@"utf-8" baseURL:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
