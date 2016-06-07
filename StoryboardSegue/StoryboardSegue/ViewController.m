//
//  ViewController.m
//  StoryboardSegue
//
//  Created by 吴泽钦 on 2/18/16.
//  Copyright © 2016 MichaelW. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userNameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (strong,nonatomic) NSUserDefaults *userData;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userData = [NSUserDefaults standardUserDefaults];
   
}





- (IBAction)nextStep:(UIButton*)sender {
    if (([self.passwordTF.text isEqualToString:@""] || [self.userNameTF.text  isEqualToString: @""])) {
        
    }else {
        [self.userData setObject:[NSString stringWithFormat:@"%@",self.passwordTF.text]  forKey:@"password"];
        [self.userData setObject:[NSString stringWithFormat:@"%@",self.userNameTF.text]  forKey:@"username"];
        
        [self performSegueWithIdentifier:@"firToSec" sender:self];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.userNameTF resignFirstResponder];
    [self.passwordTF resignFirstResponder];
}
- (IBAction)unwindToFir:(UIStoryboardSegue *)unwindSegue towardsViewController:(UIViewController *)subsequentVC{
    
}
- (IBAction)unwindToHome:(UIStoryboardSegue *)unwindSegue towardsViewController:(UIViewController *)subsequentVC{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
