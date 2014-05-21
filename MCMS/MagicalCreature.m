//
//  MagicalCreature.m
//  MCMS
//
//  Created by teacher on 5/20/14.
//  Copyright (c) 2014 Mathien. All rights reserved.
//

#import "MagicalCreature.h"

@implementation MagicalCreature
-(MagicalCreature *) initWithFullName:(NSString *)name description:(NSString *)description
{
    self.name = name;
    self.description = description;
    return self;
}

@end
