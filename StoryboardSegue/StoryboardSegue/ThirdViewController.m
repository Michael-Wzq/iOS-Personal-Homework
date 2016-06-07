//
//  ThirdViewController.m
//  StoryboardSegue
//
//  Created by 吴泽钦 on 2/18/16.
//  Copyright © 2016 MichaelW. All rights reserved.
//

#import "ThirdViewController.h"
@interface ThirdViewController()

@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *password;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UILabel *fullname;
@property (strong,nonatomic) NSUserDefaults *userData;
@end
@implementation ThirdViewController

- (void)viewDidLoad{
    self.userData = [NSUserDefaults standardUserDefaults];
    self.userName.text = [NSString stringWithFormat:@"%@",[self.userData objectForKey:@"username"]];
    self.password.text = @"******";
    
     self.fullname.text = [NSString stringWithFormat:@"%@",[self.userData objectForKey:@"fullname"]];
     self.email.text = [NSString stringWithFormat:@"%@",[self.userData objectForKey:@"email"]];
}
- (IBAction)unwindForSegue:(UIStoryboardSegue *)unwindSegue towardsViewController:(UIViewController *)subsequentVC  {
    
}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)confirm:(id)sender {
    [self performSegueWithIdentifier:@"thiToFour" sender:self];
}


@end
