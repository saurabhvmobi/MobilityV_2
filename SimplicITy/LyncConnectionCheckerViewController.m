//
//  LyncConnectionCheckerViewController.m
//  SimplicITy
//
//  Created by Varghese Simon on 12/20/14.
//  Copyright (c) 2014 Vmoksha. All rights reserved.
//

#import "LyncConnectionCheckerViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "UserInfo.h"
#import "MBProgressHUD.h"
#import "Postman.h"
#import "LyncConfigModel.h"
#import "DBManager.h"

#define NULL_CHECKER(X) ([X isKindOfClass:[NSNull class]] ? nil : X)

@interface LyncConnectionCheckerViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *LyncChakerWebView;

@end




@implementation LyncConnectionCheckerViewController
{
    NSString *targetURL;
    BOOL showAlready;

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    [self localize];

    self.LyncChakerWebView.delegate = self;

   // targetURL = @"http://lyncchecker.ucb.com";
    
    
    targetURL = @"http://prithiviraj.vmokshagroup.com:2020";
    
    [self refreshBrowser];

    
}


-(void)localize
{
    self.title = STRING_FOR_LANGUAGE(@"Ping.Linc");
    
    
}


- (void)refreshBrowser
{
    //Verify if targetURL was set by MDM
    
    NSURL *url = [NSURL URLWithString:targetURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    [self.LyncChakerWebView loadRequest:requestObj];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    if (!showAlready)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:ERROR_FOR_ALERT
                                                      message:STRING_FOR_LANGUAGE(@"Contact.Administrator")
                                                     delegate:self
                                            cancelButtonTitle:OK_FOR_ALERT
                                            otherButtonTitles:nil];
        
        [alert show];
        
        showAlready = YES;
    }
    
    
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
