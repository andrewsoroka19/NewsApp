//
//  ASArticlePageViewController.m
//  NewsApp
//
//  Created by Andrew Soroka on 10/26/16.
//  Copyright © 2016 Andrew Soroka. All rights reserved.
//

#import "ASArticlePageViewController.h"


@interface ASArticlePageViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;


@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation ASArticlePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURLRequest *request = [NSURLRequest requestWithURL:self.articleURL];
    [self.webView loadRequest:request];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [_activityIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [_activityIndicator stopAnimating];
}


@end
