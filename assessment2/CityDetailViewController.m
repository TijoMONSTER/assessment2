//
//  CityDetailViewController.m
//  assessment2
//
//  Created by Iván Mervich on 7/31/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "CityDetailViewController.h"
#import "WebViewController.h"

@interface CityDetailViewController () <UITextFieldDelegate, CityDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateOrProvinceTextField;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateOrProvinceLabel;

@property (weak, nonatomic) IBOutlet UILabel *wikipediaLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property NSString *url;

@end

@implementation CityDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.nameLabel.text = self.nameTextField.text = self.city.name;
	self.stateOrProvinceLabel.text = self.stateOrProvinceTextField.text = self.city.stateOrProvince;
	self.wikipediaLabel.text = [NSString stringWithFormat:@"http://en.wikipedia.org/wiki/%@", self.city.name];

	self.imageView.image = self.city.image;

	self.city.delegate = self;
}

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[self saveData];
	return YES;
}

#pragma mark CityDelegate

- (void)wikipediaURLForCity:(NSString *)cityName
{
	self.url = [NSString stringWithFormat:@"http://en.wikipedia.org/wiki/%@", self.city.name];

	[self performSegueWithIdentifier:@"WikipediaSegue" sender:self];

}

#pragma mark IBActions

- (IBAction)onEditButtonPressed:(UIBarButtonItem *)sender
{
	if ([sender.title isEqualToString:@"Edit"]) {
		sender.title = @"Done";
		self.nameTextField.hidden = NO;
		self.stateOrProvinceTextField.hidden = NO;
	}else {
		sender.title = @"Edit";
		self.nameTextField.hidden = YES;
		self.stateOrProvinceTextField.hidden = YES;

		[self saveData];
	}
}

- (IBAction)onWikipediaLabelTapped:(UITapGestureRecognizer *)tapGestureRecognizer
{
	[self.city getWikipediaURL];
}

#pragma mark Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"WikipediaSegue"]) {
		WebViewController *vc = (WebViewController *) segue.destinationViewController;
		vc.urlString = self.url;
	}
}

- (IBAction)unwindFromWebView:(UIStoryboardSegue *)sender
{
	
}

#pragma mark Helper methods

- (void)saveData
{
	[self.nameTextField resignFirstResponder];
	[self.stateOrProvinceTextField resignFirstResponder];

	if ([self.nameTextField.text length] > 0 && [self.stateOrProvinceTextField.text length] > 0) {
		self.city.name = self.nameLabel.text = self.nameTextField.text;
		self.city.stateOrProvince = self.stateOrProvinceLabel.text = self.stateOrProvinceTextField.text;
	}
}

@end
