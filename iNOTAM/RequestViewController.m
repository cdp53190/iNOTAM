//
//  RequestViewController.m
//  iNOTAM
//
//  Created by 林 英市 on 2014/12/24.
//  Copyright (c) 2014年 skyElements. All rights reserved.
//

#import "RequestViewController.h"

@interface RequestViewController ()

@end

@implementation RequestViewController
{
    UILabel *flightNumberLabel;
    NSMutableString *flightNumber;
    UIButton *sendButton;
    
    NSMutableData *mutableData;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.frame = CGRectMake(0, 0, self.preferredContentSize.width, self.preferredContentSize.height);
    
    UILabel *jlLabel = [[UILabel alloc] init];
    jlLabel.frame = CGRectMake(56, 0, 44, 66);
    jlLabel.textAlignment = NSTextAlignmentCenter;
    //jlLabel.font = [UIFont systemFontOfSize:25];
    jlLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:25];
    jlLabel.text = @"JL";
    [self.view addSubview:jlLabel];
    
    flightNumberLabel = [[UILabel alloc] init];
    flightNumberLabel.frame = CGRectMake(100, 0, 100, 66);
    //flightNumberLabel.font = [UIFont systemFontOfSize:25];
    flightNumberLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:25];
    flightNumberLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:flightNumberLabel];
    
    UIView *numberPadView = [[UIView alloc] init];
    numberPadView.frame = CGRectMake(15, 66, 300, 260);
    [self.view addSubview:numberPadView];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.frame = CGRectMake(0, 0, 90, 65);
    [button1.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:20]];
    [button1 setTitle:@"1" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(number:) forControlEvents:UIControlEventTouchDown];
    [button1 addTarget:self action:@selector(normal:) forControlEvents:UIControlEventTouchUpInside];
    [button1 addTarget:self action:@selector(normal:) forControlEvents:UIControlEventTouchUpOutside];
    [numberPadView addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    button2.frame = CGRectMake(90, 0, 90, 65);
    [button2.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:20]];
    [button2 setTitle:@"2" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(number:) forControlEvents:UIControlEventTouchDown];
    [button2 addTarget:self action:@selector(normal:) forControlEvents:UIControlEventTouchUpInside];
    [button2 addTarget:self action:@selector(normal:) forControlEvents:UIControlEventTouchUpOutside];
    [numberPadView addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeSystem];
    button3.frame = CGRectMake(180, 0, 90, 65);
    [button3.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:20]];
    [button3 setTitle:@"3" forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(number:) forControlEvents:UIControlEventTouchDown];
    [button3 addTarget:self action:@selector(normal:) forControlEvents:UIControlEventTouchUpInside];
    [button3 addTarget:self action:@selector(normal:) forControlEvents:UIControlEventTouchUpOutside];
    [numberPadView addSubview:button3];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeSystem];
    button4.frame = CGRectMake(0, 65, 90, 65);
    [button4.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:20]];
    [button4 setTitle:@"4" forState:UIControlStateNormal];
    [button4 addTarget:self action:@selector(number:) forControlEvents:UIControlEventTouchDown];
    [button4 addTarget:self action:@selector(normal:) forControlEvents:UIControlEventTouchUpInside];
    [button4 addTarget:self action:@selector(normal:) forControlEvents:UIControlEventTouchUpOutside];
    [numberPadView addSubview:button4];
    
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeSystem];
    button5.frame = CGRectMake(90, 65, 90, 65);
    [button5.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:20]];
    [button5 setTitle:@"5" forState:UIControlStateNormal];
    [button5 addTarget:self action:@selector(number:) forControlEvents:UIControlEventTouchDown];
    [button5 addTarget:self action:@selector(normal:) forControlEvents:UIControlEventTouchUpInside];
    [button5 addTarget:self action:@selector(normal:) forControlEvents:UIControlEventTouchUpOutside];
    [numberPadView addSubview:button5];
    
    UIButton *button6 = [UIButton buttonWithType:UIButtonTypeSystem];
    button6.frame = CGRectMake(180, 65, 90, 65);
    [button6.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:20]];
    [button6 setTitle:@"6" forState:UIControlStateNormal];
    [button6 addTarget:self action:@selector(number:) forControlEvents:UIControlEventTouchDown];
    [button6 addTarget:self action:@selector(normal:) forControlEvents:UIControlEventTouchUpInside];
    [button6 addTarget:self action:@selector(normal:) forControlEvents:UIControlEventTouchUpOutside];
    [numberPadView addSubview:button6];
    
    UIButton *button7 = [UIButton buttonWithType:UIButtonTypeSystem];
    button7.frame = CGRectMake(0, 130, 90, 65);
    [button7.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:20]];
    [button7 setTitle:@"7" forState:UIControlStateNormal];
    [button7 addTarget:self action:@selector(number:) forControlEvents:UIControlEventTouchDown];
    [button7 addTarget:self action:@selector(normal:) forControlEvents:UIControlEventTouchUpInside];
    [button7 addTarget:self action:@selector(normal:) forControlEvents:UIControlEventTouchUpOutside];
    [numberPadView addSubview:button7];
    
    UIButton *button8 = [UIButton buttonWithType:UIButtonTypeSystem];
    button8.frame = CGRectMake(90, 130, 90, 65);
    [button8.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:20]];
    [button8 setTitle:@"8" forState:UIControlStateNormal];
    [button8 addTarget:self action:@selector(number:) forControlEvents:UIControlEventTouchDown];
    [button8 addTarget:self action:@selector(normal:) forControlEvents:UIControlEventTouchUpInside];
    [button8 addTarget:self action:@selector(normal:) forControlEvents:UIControlEventTouchUpOutside];
    [numberPadView addSubview:button8];
    
    UIButton *button9 = [UIButton buttonWithType:UIButtonTypeSystem];
    button9.frame = CGRectMake(180, 130, 90, 65);
    [button9.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:20]];
    [button9 setTitle:@"9" forState:UIControlStateNormal];
    [button9 addTarget:self action:@selector(number:) forControlEvents:UIControlEventTouchDown];
    [button9 addTarget:self action:@selector(normal:) forControlEvents:UIControlEventTouchUpInside];
    [button9 addTarget:self action:@selector(normal:) forControlEvents:UIControlEventTouchUpOutside];
    [numberPadView addSubview:button9];
    
    UIButton *button0 = [UIButton buttonWithType:UIButtonTypeSystem];
    button0.frame = CGRectMake(90, 195, 90, 65);
    [button0.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:20]];
    [button0 setTitle:@"0" forState:UIControlStateNormal];
    [button0 addTarget:self action:@selector(number:) forControlEvents:UIControlEventTouchDown];
    [button0 addTarget:self action:@selector(normal:) forControlEvents:UIControlEventTouchUpInside];
    [button0 addTarget:self action:@selector(normal:) forControlEvents:UIControlEventTouchUpOutside];
    [numberPadView addSubview:button0];
    
    UIButton *buttonBS = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonBS.frame = CGRectMake(180, 195, 90, 65);
    [buttonBS.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:20]];
    [buttonBS setTitle:@"BS" forState:UIControlStateNormal];
    [buttonBS addTarget:self action:@selector(number:) forControlEvents:UIControlEventTouchDown];
    [buttonBS addTarget:self action:@selector(normal:) forControlEvents:UIControlEventTouchUpInside];
    [buttonBS addTarget:self action:@selector(normal:) forControlEvents:UIControlEventTouchUpOutside];
    [numberPadView addSubview:buttonBS];
    
    sendButton = [UIButton buttonWithType:UIButtonTypeSystem];
    sendButton.frame = CGRectMake(0, self.view.frame.size.height - 66, 300, 66);
    [sendButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:25]];
    [sendButton setTitle:@"SEND" forState:UIControlStateNormal];
    [sendButton addTarget:self action:@selector(send:) forControlEvents:UIControlEventTouchDown];
    [sendButton addTarget:self action:@selector(normal:) forControlEvents:UIControlEventTouchUpInside];
    [sendButton addTarget:self action:@selector(normal:) forControlEvents:UIControlEventTouchUpOutside];
    [self.view addSubview:sendButton];
}

- (void)viewWillAppear:(BOOL)animated
{
    flightNumberLabel.text = @"";
    sendButton.enabled = NO;
    flightNumber = [NSMutableString stringWithString:@""];
}

- (void)number:(UIButton *)button
{
    button.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.03];
    
    if ([button.titleLabel.text isEqualToString:@"BS"])
    {
        if (flightNumberLabel.text.length)
        {
            [flightNumber deleteCharactersInRange:NSMakeRange(flightNumberLabel.text.length - 1, 1)];
        }
    }else
    {
        if (flightNumberLabel.text.length < 4)
        {
            [flightNumber appendString:button.titleLabel.text];
        }
    }
    
    flightNumberLabel.text = flightNumber;
    
    if (flightNumberLabel.text.length)
    {
        sendButton.enabled = YES;
    }else
    {
        sendButton.enabled = NO;
    }
}

- (void)send:(UIButton *)button
{
    //button.backgroundColor = [UIColor blueColor];
    
    if ([flightNumberLabel.text isEqualToString:@""] ||
        [flightNumber isEqualToString:@""])
    {
        return;
    }
    
    if ([flightNumber isEqualToString:@"0000"] ||
        [flightNumber isEqualToString:@"000"] ||
        [flightNumber isEqualToString:@"00"] ||
        [flightNumber isEqualToString:@"0"])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"便名が不正です"
                                                        message:@"正しい便名を入力してください。"
                                                       delegate:self cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
        
        [self viewWillAppear:NO];
        
        return;
    }
    
    sendButton.enabled = NO;
    
    while ([[flightNumber substringToIndex:1] isEqualToString:@"0"])
    {
        [flightNumber deleteCharactersInRange:NSMakeRange(0, 1)];
    }
    
    flightNumberLabel.text = flightNumber;
    
    NSString *urlString = [NSString stringWithFormat:@"http://www.eflight.jalnet:8090/oez/kusutest/JAL%@.pdf", flightNumberLabel.text];
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestReloadIgnoringCacheData
                                         timeoutInterval:60.0];
    [NSURLConnection connectionWithRequest:request delegate:self];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)normal:(UIButton *)button
{
    button.backgroundColor = [UIColor clearColor];
}

// Errorになると呼び出される
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    sendButton.enabled = YES;
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"通信エラー"
                                                    message:@"VPN接続を確認してください。"
                                                   delegate:self cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil, nil];
    [alert show];
}

// レスポンスを受け取ると呼び出される
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    mutableData = [[NSMutableData alloc] init];
}

// データを受け取る度に呼び出される
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [mutableData appendData:data];
}

// データを全て受け取ると呼び出される
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    sendButton.enabled = YES;
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    NSString *string = [[NSString alloc] initWithData:mutableData encoding:NSShiftJISStringEncoding];
    if (string)
    {
        NSRange range = [string rangeOfString:@"ページが見つかりません"];
        if (range.location != NSNotFound)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"JL%@が見つかりません。", flightNumber]
                                                            message:@"便名を確認してください。"
                                                           delegate:self cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil, nil];
            [alert show];
            
            return;
        }
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:mutableData forKey:@"pdfData"];
    [[NSUserDefaults standardUserDefaults] setObject:flightNumberLabel.text forKey:@"flightNumber"];
    [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:@"date"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSNotification *notification = [NSNotification notificationWithName:@"didFinishLoading" object:self userInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
