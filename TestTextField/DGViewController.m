//
//  DGViewController.m
//  TestTextField
//
//  Created by Dmytro Golub on 26/02/2013.
//  Copyright (c) 2013 Dmytro Golub. All rights reserved.
//

#import "DGViewController.h"

@interface DGViewController ()

@end

@implementation DGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //UITextField* textField = [[UITextField alloc] initWithFrame:CGRectMake(20,100, 40, 150)];
    //[self.view addSubview:textField];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField        // return NO to disallow editing.
{
    NSLog(@"%s",__func__);
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"%s",__func__);
    [textField resignFirstResponder];
    return YES;
}

@end
