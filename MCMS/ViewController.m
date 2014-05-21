//
//  ViewController.m
//  MCMS
//
//  Created by teacher on 5/20/14.
//  Copyright (c) 2014 Mathien. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "DetailViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *creaturesTableView;
@property NSString *addRowString;
@property (strong, nonatomic) IBOutlet UITextField *myTextField;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    MagicalCreature *creature1 = [[MagicalCreature alloc]initWithFullName:@"Swamp Thing" description:@"Mossy"];
    MagicalCreature *creature2 = [[MagicalCreature alloc]initWithFullName:@"Bigfoot" description:@"King of the Forest"];
    MagicalCreature *creature3 = [[MagicalCreature alloc]initWithFullName:@"Loch Ness Monster" description:@"Water Myth"];

    self.creatures = [NSMutableArray arrayWithObjects:creature1, creature2, creature3, nil];

    for (MagicalCreature *creature in self.creatures)
    {
        NSLog(@"creature: %@", creature);
    }
}

- (void) viewDidAppear:(BOOL)animated
{
    [self.creaturesTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.creatures.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCellID"];
    cell.textLabel.text = creature.name;
    cell.detailTextLabel.text = creature.description;
    return cell;
}



- (IBAction)myCreatureAddButton:(id)sender
{
        NSString *nospaces = [self.myTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

        if ([nospaces  isEqual: @""])
        {
            nil;
        }

        else
        {
            MagicalCreature *newCreature = [[MagicalCreature alloc]init];
            newCreature.name = self.myTextField.text;
            [self.creatures addObject:newCreature];
            [self.creaturesTableView reloadData];

            [self.myTextField resignFirstResponder];
            self.myTextField.text = nil;
            [self.creaturesTableView reloadData];
        }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *selectedIndexPath = self.creaturesTableView.indexPathForSelectedRow;
    MagicalCreature *selectedCreature = [self.creatures objectAtIndex:selectedIndexPath.row];
    DetailViewController *detailViewController = segue.destinationViewController;
    detailViewController.magicalCreature = selectedCreature;
}

@end
