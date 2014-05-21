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
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property BOOL buttonPressed; //used for the edit text field
@property (weak, nonatomic) IBOutlet UIImageView *imageField;


@end

@implementation DetailViewController


- (IBAction)onEditButtonPressed:(id)sender //edit and done
{

        if (!self.editing)
        {
            self.editing = YES;
            [sender setTitle:@"Done" forState:UIControlStateNormal];
            [self.textField setHidden:NO];
            self.buttonPressed = NO;
            self.textField.text = self.magicalCreature.name;

        }

        else
        {
            self.editing = NO;
            [sender setTitle:@"Edit" forState:UIControlStateNormal];
            [self.textField setHidden:YES];
            self.buttonPressed = YES;
            self.magicalCreature.name = self.textField.text;
        }
}



- (void)viewDidLoad
{
    [super viewDidLoad]; //showing the segue
    self.navigationItem.title = self.magicalCreature.name;
    self.descriptionLabel.text = self.magicalCreature.description;
    self.titleLabel.text = self.magicalCreature.name;

    self.imageField.image = self.magicalCreature.creatureImage;

    [self.descriptionLabel sizeToFit];
}



@end
