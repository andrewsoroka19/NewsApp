//
//  ASArticlesViewController.m
//  NewsApp
//
//  Created by Andrew Soroka on 10/26/16.
//  Copyright © 2016 Andrew Soroka. All rights reserved.
//

#import "ASArticlesViewController.h"
#import "ASArticleTableViewCell.h"
#import "ASArticle.h"
#import "ASArticlePageViewController.h"


@implementation ASArticlesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self prepareTableView];
//    self.navigationController.navigationItem.rightBarButtonItem.enabled = NO;
}

- (void)prepareTableView
{
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 76.0;
}

- (IBAction)searchButtonTapped:(UIBarButtonItem *)sender{
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.articles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ASArticleTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:[ASArticleTableViewCell reuseIdentifier]];
    cell.article = self.articles[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ASArticle *article = self.articles[indexPath.row];
    ASArticlePageViewController *articlesController = [self.storyboard instantiateViewControllerWithIdentifier:@"ASArticlePageViewController"];
    articlesController.articleURL = article.articleURL;
    [self.navigationController showViewController:articlesController sender:nil];
}


@end
