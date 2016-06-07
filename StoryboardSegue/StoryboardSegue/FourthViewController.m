
//
//  FourthViewController.m
//  StoryboardSegue
//
//  Created by 吴泽钦 on 2/18/16.
//  Copyright © 2016 MichaelW. All rights reserved.
//

#import "FourthViewController.h"
#import "ViewController.h"
@interface FourthViewController()
@property (weak, nonatomic) IBOutlet UILabel *succeedMes;
@property (strong,nonatomic) NSUserDefaults *userData;
@end
@implementation FourthViewController
-(void) viewDidLoad{
    self.userData = [NSUserDefaults standardUserDefaults];
    self.succeedMes.text = [NSString  stringWithFormat:@"恭喜,%@注册成功",[self.userData objectForKey:@"username"]];
}


- (IBAction)resigned:(id)sender {
    
    
    [self.userData removeObjectForKey:@"username"];
      [self.userData removeObjectForKey:@"password"];
      [self.userData removeObjectForKey:@"email"];
      [self.userData removeObjectForKey:@"fullname"];
    [self performSegueWithIdentifier:@"backToFir" sender:self];
  
}
- (IBAction)exit:(id)sender {
    exit(0);
}

@end
