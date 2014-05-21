//
//  DetailViewController.m
//  MCMS
//
//  Created by teacher on 5/20/14.
//  Copyright (c) 2014 Mathien. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@end

@implementation DetailViewController


- (IBAction)onEditButtonPressed:(id)sender
{
    {
        self.editing = ! self.editing;

        if(self.editing)
        {
            [sender setTitle:@"Done" forState:UIControlStateNormal];

        }

        else
        {
            [sender setTitle:@"Edit" forState:UIControlStateNormal];
        }
    }
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = self.magicalCreature.name;
    self.descriptionLabel.text = self.magicalCreature.description;
    self.titleLabel.text = self.magicalCreature.name;
    [self.descriptionLabel sizeToFit];
}



@end
