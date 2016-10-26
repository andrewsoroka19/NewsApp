//
//  ASCategorySearchController.m
//  NewsApp
//
//  Created by Andrew Soroka on 10/26/16.
//  Copyright © 2016 Andrew Soroka. All rights reserved.
//

#import "ASCategorySearchController.h"
#import "ASArticle.h"

@interface ASCategorySearchController ()

@property (strong, nonatomic) NSArray<NSString *> *categories;

@end

@implementation ASCategorySearchController

#pragma mark - IBActions

- (IBAction)cancelButtonTapped:(UIBarButtonItem *)sender {
    if (self.selectCategoryCompletion) {
        self.selectCategoryCompletion(nil);
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.categories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"UICategoryTableViewCell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
    NSString *title = self.categories[indexPath.row];
    cell.textLabel.text = [self prepareTitle:title];
    return cell;
}

- (NSString *)prepareTitle:(NSString *)title {
    title = [title uppercaseString];
    title = [title stringByReplacingOccurrencesOfString:@"-" withString:@" "];
    return title;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *selectedCategory = self.categories[indexPath.row];
    if (self.selectCategoryCompletion) {
        self.selectCategoryCompletion(selectedCategory);
    }
}

#pragma mark - Getters

- (NSArray<NSString *> *)categories {
    if (!_categories) {
        return @[@"business", @"entertainment", @"gaming", @"general", @"music", @"science-and-nature", @"sport", @"technology"];
    }
    return _categories;
}

@end
