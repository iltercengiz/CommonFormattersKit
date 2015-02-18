//
//  CFKDateFormatterViewController.m
//  CommonFormattersKit
//
//  Created by Ilter Cengiz on 18/02/15.
//  Copyright (c) 2015 Ilter Cengiz. All rights reserved.
//

#import "CFKDateFormatterViewController.h"

#import <CommonFormattersKit/CFKDateFormatter.h>
#import <RMDateSelectionViewController/RMDateSelectionViewController.h>

@interface CFKDateFormatterViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (nonatomic) NSDate *selectedDate;

@end

@implementation CFKDateFormatterViewController

#pragma mark - View life cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@"Date Formatter"];
    
    // Set initial date
    self.selectedDate = [NSDate date];
    
    self.textField.text = [CFKDateFormatter stringFromDate:self.selectedDate withFormat:CFKDateFormatDefault];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Text field delegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    RMDateSelectionViewController *dsvc = [RMDateSelectionViewController dateSelectionController];
    
    dsvc.disableBouncingWhenShowing = YES;
    dsvc.disableMotionEffects = NO;
    dsvc.disableBlurEffects = YES;
    
    dsvc.datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    
    [dsvc showWithSelectionHandler:^(RMDateSelectionViewController *vc, NSDate *aDate) {
        self.selectedDate = aDate;
        self.textField.text = [CFKDateFormatter stringFromDate:self.selectedDate withFormat:CFKDateFormatDefault];
        [self.tableView reloadData];
    } andCancelHandler:^(RMDateSelectionViewController *vc) {
        [dsvc dismiss];
    }];
    
    return NO;
    
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DateCell" forIndexPath:indexPath];
    cell.textLabel.text = [CFKDateFormatter stringFromDate:self.selectedDate withFormat:indexPath.section + 1]; // `indexPath.section + 1` will cast to `CFKDateFormat`
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 13; // Every possible date format (at least currently)
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section + 1) {
        case CFKDateFormatyyyy: return @"CFKDateFormatyyyy";
        case CFKDateFormatyyyyMMdd: return @"CFKDateFormatyyyyMMdd";
        case CFKDateFormatyyyyMMddHHmm: return @"CFKDateFormatyyyyMMddHHmm";
        case CFKDateFormatyyyyMMddHHmmss: return @"CFKDateFormatyyyyMMddHHmmss";
            
        case CFKDateFormatMMMM: return @"CFKDateFormatMMMM";
        case CFKDateFormatMMMMyyyy: return @"CFKDateFormatMMMMyyyy";
            
        case CFKDateFormatd: return @"CFKDateFormatd";
        case CFKDateFormatddMM: return @"CFKDateFormatddMM";
        case CFKDateFormatdEEEEE: return @"CFKDateFormatdEEEEE";
            
        case CFKDateFormatEEEE: return @"ECFKDateFormatEEEEEEE";
        case CFKDateFormatEdd: return @"CFKDateFormatEdd";
        case CFKDateFormatEEEEddMMM: return @"CFKDateFormatEEEEddMMM";
            
        case CFKDateFormatHHmm: return @"CFKDateFormatHHmm";
        default: return nil;
    }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    UITableViewHeaderFooterView *headerView = (UITableViewHeaderFooterView *)view;
    headerView.textLabel.textColor = [UIColor whiteColor];
}

@end
