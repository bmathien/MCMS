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
//custom initializer for mutable array
    MagicalCreature *creature1 = [[MagicalCreature alloc]initWithFullName:@"Swamp Thing" description:@"Mossy"];
    MagicalCreature *creature2 = [[MagicalCreature alloc]initWithFullName:@"Bigfoot" description:@"King of the Forest"];
    MagicalCreature *creature3 = [[MagicalCreature alloc]initWithFullName:@"Loch Ness Monster" description:@"Water Myth"];
    MagicalCreature *creature4 = [[MagicalCreature alloc]initWithFullName:@"Chupacabre" description:@"Blood Sucker"];

    creature1.creatureImage = [UIImage imageNamed:@"creature1"];
    creature2.creatureImage = [UIImage imageNamed:@"creature2"];
    creature3.creatureImage = [UIImage imageNamed:@"creature3"];
    creature4.creatureImage = [UIImage imageNamed:@"creature4"];

    self.creatures = [NSMutableArray arrayWithObjects:creature1, creature2, creature3, creature4, nil];

    for (MagicalCreature *creature in self.creatures)
    {
        NSLog(@"creature: %@", creature);
    }
}

//reloads the page once edit has been done no need for unwind
- (void) viewWillAppear:(BOOL)animated
{
    [self.creaturesTableView reloadData];
}



// returns the number of rows in the array
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.creatures.count;
}



//puts the text in the cell
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCellID"];
    cell.textLabel.text = creature.name;
    cell.detailTextLabel.text = creature.description;
    return cell;
}



//adding ceratures to the array if does not allow blanks
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

            self.myTextField.text = nil;
            [self.creaturesTableView reloadData];
            [self.myTextField resignFirstResponder];
        }
}


//transfers creature data to the next page
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *selectedIndexPath = self.creaturesTableView.indexPathForSelectedRow;
    MagicalCreature *selectedCreature = [self.creatures objectAtIndex:selectedIndexPath.row];
    DetailViewController *detailViewController = segue.destinationViewController;

    detailViewController.magicalCreature = selectedCreature;
}

@end
