//
//  SecondViewController.m
//  StoryboardSegue
//
//  Created by 吴泽钦 on 2/18/16.
//  Copyright © 2016 MichaelW. All rights reserved.
//

#import "SecondViewController.h"
@interface SecondViewController()
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *fullName;
@property (strong,nonatomic) NSUserDefaults *userData;

@end
@implementation SecondViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    self.userData = [NSUserDefaults standardUserDefaults];
    self.userName.text = [NSString stringWithFormat:@"%@",[self.userData objectForKey:@"username"]];
    if ([self.userData objectForKey:@"email"]) {
       self.email.text = [NSString stringWithFormat:@"%@",[self.userData objectForKey:@"email"]];
    }
    if ([self.userData objectForKey:@"fullname"]) {
        self.fullName.text = [NSString stringWithFormat:@"%@",[self.userData objectForKey:@"fullname"]];
    }
    
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.email resignFirstResponder];
    [self.fullName resignFirstResponder];
}
- (IBAction)unwindToSec:(UIStoryboardSegue *)unwindSegue towardsViewController:(UIViewController *)subsequentVC{
    
}
- (IBAction)nextStep:(id)sender {
    if (([self.email.text isEqualToString:@""] || [self.fullName.text  isEqualToString: @""])) {
        
    }else {
    [self.userData setObject:[NSString stringWithFormat:@"%@",self.email.text]  forKey:@"email"];
    [self.userData setObject:[NSString stringWithFormat:@"%@",self.fullName.text]  forKey:@"fullname"];
    [self performSegueWithIdentifier:@"secToThird" sender:self];
       }
}

- (IBAction)backBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
