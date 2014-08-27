//
//  DSLViewController.m
//  Tip Calculator
//
//  Created by shengliang dai on 8/26/14.
//  Copyright (c) 2014 shengliang dai. All rights reserved.
//

#import "DSLViewController.h"

@interface DSLViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *checkTotal;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property NSInteger percentTip;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;

@property (weak, nonatomic) IBOutlet UILabel *totalCheck;
@property (weak, nonatomic) IBOutlet UIStepper *stepperOutlet;

@property (weak, nonatomic) IBOutlet UILabel *stepperValue;
@property (weak, nonatomic) IBOutlet UILabel *split;
@property float total;
@end

@implementation DSLViewController
- (IBAction)textFieldChanged:(id)sender {
    float check = [self.checkTotal.text floatValue];
    float tip = check*((float)self.percentTip/100.0);
    self.total = check*(1+(float)self.percentTip/100.0);
    self.tipLabel.text = [NSString stringWithFormat:@"%.2f", tip];
    self.totalCheck.text = [NSString stringWithFormat:@"%.2f", self.total];
    
    
    
}
- (IBAction)stepperAction:(id)sender {
    self.stepperValue.text = [NSString stringWithFormat:@"%.f",self.stepperOutlet.value];
    float split = self.total/self.stepperOutlet.value;
    self.split.text =[NSString stringWithFormat:@"%.2f",split];

}


- (IBAction)indexChanged:(UISegmentedControl *)sender {
    [self stepperAction:NO];
    switch (self.segmentControl.selectedSegmentIndex) {
        case 0:
            self.percentTip = 10;
            break;
        case 1:
            self.percentTip = 15;
            break;
        case 2:
            self.percentTip = 20;
            break;
            
        
    }
    float check = [self.checkTotal.text floatValue];
    float tip = check*((float)self.percentTip/100.0);
    self.total = check*(1+(float)self.percentTip/100.0);
    self.tipLabel.text = [NSString stringWithFormat:@"%.2f", tip];
    self.totalCheck.text =[NSString stringWithFormat:@"%.2f", self.total];
    float split = self.total/self.stepperOutlet.value;
    self.split.text =[NSString stringWithFormat:@"%.2f",split];
 
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self indexChanged:self.segmentControl];
    [self stepperAction:NO];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
