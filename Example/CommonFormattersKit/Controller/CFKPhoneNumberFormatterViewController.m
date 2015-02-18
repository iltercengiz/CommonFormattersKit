//
//  CFKPhoneNumberFormatterViewController.m
//  CommonFormattersKit
//
//  Created by Ilter Cengiz on 18/02/15.
//  Copyright (c) 2015 Ilter Cengiz. All rights reserved.
//

#import "CFKPhoneNumberFormatterViewController.h"

#import <CommonFormattersKit/CFKPhoneNumberFormatter.h>

@interface CFKPhoneNumberFormatterViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UILabel *InternationalPhoneNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *E164PhoneNumberLabel;

@property (nonatomic) NBAsYouTypeFormatter *asYouTypeFormatter;

@end

@implementation CFKPhoneNumberFormatterViewController

#pragma mark - View life cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@"Phone Number Formatter"];
    
    self.textField.placeholder = [CFKPhoneNumberFormatter examplePhoneNumber];
    
    self.asYouTypeFormatter = [CFKPhoneNumberFormatter asYouTypeFormatter];
    
    self.InternationalPhoneNumberLabel.text = @"NaN";
    self.E164PhoneNumberLabel.text = @"NaN";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Text field delegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (string.length) { // A new digit is entered
        textField.text = [self.asYouTypeFormatter inputDigit:string];
    } else { // User removed the last digit
        textField.text = [self.asYouTypeFormatter removeLastDigit];
    }
    
    if ([CFKPhoneNumberFormatter isValidPhoneNumber:textField.text]) {
        self.InternationalPhoneNumberLabel.text = [CFKPhoneNumberFormatter formattedNumberInInternationalFormatFromNumber:textField.text];
        self.E164PhoneNumberLabel.text = [CFKPhoneNumberFormatter formattedNumberInE164FormatFromNumber:textField.text];
    } else {
        self.InternationalPhoneNumberLabel.text = @"NaN";
        self.E164PhoneNumberLabel.text = @"NaN";
    }

    return NO;
    
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    UITableViewHeaderFooterView *headerView = (UITableViewHeaderFooterView *)view;
    headerView.textLabel.textColor = [UIColor whiteColor];
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section {
    UITableViewHeaderFooterView *footerView = (UITableViewHeaderFooterView *)view;
    footerView.textLabel.textColor = [UIColor whiteColor];
}

@end
