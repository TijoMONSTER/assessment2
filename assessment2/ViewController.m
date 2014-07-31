//
//  ViewController.m
//  assessment2
//
//  Created by Iván Mervich on 7/31/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "ViewController.h"
#import "City.h"
#import "CityDetailViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *cities;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	City *mexicoCity = [[City alloc] initWithName:@"Mexico" stateOrProvince:@"Distrito Federal"];
	City *guadalajara = [[City alloc] initWithName:@"Guadalajara" stateOrProvince:@"Jalisco"];
	City *monterrey = [[City alloc] initWithName:@"Monterrey" stateOrProvince:@"Nuevo León"];
	City *veracruz = [[City alloc] initWithName:@"Veracruz" stateOrProvince:@"Veracruz"];

	self.cities = [NSMutableArray arrayWithObjects:
				   mexicoCity,
				   guadalajara,
				   monterrey,
				   veracruz,
				   nil];


}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];

	[self.tableView reloadData];
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.cities count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];

	City *city = [self.cities objectAtIndex:indexPath.row];

	cell.textLabel.text = [NSString stringWithFormat:@"Name: %@", city.name];
	cell.detailTextLabel.text = [NSString stringWithFormat:@"State or Province: %@", city.stateOrProvince];

	return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	[self.cities removeObjectAtIndex:indexPath.row];
	[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"EditCityDetailSegue"]) {
		CityDetailViewController *vc = (CityDetailViewController *)segue.destinationViewController;

		NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
		City *city = [self.cities objectAtIndex:indexPath.row];

		vc.city = city;
	}
}

#pragma mark IBActions

- (IBAction)onEditButtonPressed:(UIBarButtonItem *)sender
{
	if ([sender.title isEqualToString:@"Edit"]) {
		sender.title = @"Done";
		[self.tableView setEditing:YES animated:YES];
	}else {
		sender.title = @"Edit";
		[self.tableView setEditing:NO animated:YES];
	}
}


@end
