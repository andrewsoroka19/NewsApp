//
//  ASSourceViewController.m
//  NewsApp
//
//  Created by Andrew Soroka on 10/25/16.
//  Copyright © 2016 Andrew Soroka. All rights reserved.
//

#import "ASSourceViewController.h"
#import "ASCategorySearchController.h"
#import "ASArticlesViewController.h"
#import "ASDownloadManager.h"
#import "ASSource.h"
#import "ASArticle.h"
#import "ASSourceTableViewCell.h"

@interface ASSourceViewController ()

@property (strong, nonatomic) NSArray<ASSource *> *sources;
@property (strong, nonatomic) UIActivityIndicatorView *activity;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *searchButton;

@end

@implementation ASSourceViewController

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self prepareTableView];
    [self loadSources];
}

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    self.searchButton.enabled = YES;
//}
//
//- (void)viewDidDisappear:(BOOL)animated {
//    [super viewDidDisappear:animated];
//    self.searchButton.enabled = NO;
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)prepareTableView
{
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 76.0;
}

#pragma mark - Actions

- (IBAction)searchButtonTapped:(UIBarButtonItem *)sender
{
    [self showSearchViewController];
}

#pragma mark - Networking

- (void)loadSources
{
    [self.activity startAnimating];
    __weak typeof(self) weakSelf = self;
    [ASDownloadManager fetchAllSources:^(NSArray<ASSource *> *sourses) {
        weakSelf.sources = sourses;
        [weakSelf.activity stopAnimating];
        weakSelf.activity.hidden = YES;
        [weakSelf.tableView reloadData];
    }];
}

- (void)loadSourcesWithCategory:(NSString *)category
{
    self.sources = [NSArray array];
    [self.tableView reloadData];
    
    [self.activity startAnimating];
    __weak typeof(self) weakSelf = self;
    [ASDownloadManager fetchSourcesForCategory:category withHandler:^(NSArray<ASSource *> *sourses) {
        weakSelf.sources = sourses;
        [weakSelf.activity stopAnimating];
        weakSelf.activity.hidden = YES;
        [weakSelf.tableView reloadData];
    }];
}

- (void)loadArticlesForSource:(ASSource *)source {
    __weak typeof(self) weakSelf = self;
    [ASDownloadManager fetchArticlesForSourse:(ASSource *)source withHandler:^(NSArray<ASArticle *> *articles) {
        [weakSelf.activity stopAnimating];
        weakSelf.activity.hidden = YES;
        [weakSelf showArticlesViewControllerWithArticles:articles];
    }];
}

#pragma mark - Navigation

- (void)showSearchViewController
{
    UINavigationController *searchNavigation = [self.storyboard instantiateViewControllerWithIdentifier:@"ASSearcNavigationViewController"];
    ASCategorySearchController *search = searchNavigation.viewControllers[0];
    
    __weak typeof(self) weakSelf = self;
    __weak typeof(ASCategorySearchController *) weakSearch = search;
    search.selectCategoryCompletion = ^(NSString *category){
        if (category) {
            [weakSelf loadSourcesWithCategory:category];
        }
        [weakSearch dismissViewControllerAnimated:YES completion:nil];
    };
    
    [self presentViewController:searchNavigation animated:YES completion:nil];
}

- (void)showArticlesViewControllerWithArticles:(NSArray<ASArticle *> *)articles
{
    ASArticlesViewController *articlesController = [self.storyboard instantiateViewControllerWithIdentifier:@"ASArticlesViewController"];
    articlesController.articles = articles;
    [self.navigationController showViewController:articlesController sender:nil];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sources.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ASSourceTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:[ASSourceTableViewCell reuseIdentifier]];
    cell.source = self.sources[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ASSource *selectedSource = self.sources[indexPath.row];
    [self loadArticlesForSource:selectedSource];
}

#pragma mark - Getters

- (UIActivityIndicatorView *)activity {
    if (!_activity) {
        _activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleGray];
        CGSize tableSize = self.tableView.bounds.size;
        _activity.center = CGPointMake(tableSize.width / 2, 25);
        [self.tableView addSubview:_activity];
    }
    return _activity;
}

@end
