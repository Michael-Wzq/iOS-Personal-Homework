//
//  ViewController.m
//  SaySomething
//
//  Created by 吴泽钦 on 2/11/16.
//  Copyright © 2016 MichaelW. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (strong,nonatomic) NSString *textStr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [[NSBundle mainBundle]URLForResource:@"word" withExtension:@"txt" ];
    self.textStr = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
   
    
}
- (IBAction)saySomething:(id)sender {
     [self.nameField resignFirstResponder];
      self.messageLabel.text = [NSString stringWithFormat:@"%@ : %@",self.nameField.text,self.textStr ];
    UIButton *clearBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    CGRect btnRect = CGRectMake(130, 221, 45, 30);
    [clearBtn setFrame:btnRect];
    [clearBtn setTitle:@"清除" forState:UIControlStateNormal];
    [clearBtn addTarget:self action:@selector(clearLabel:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clearBtn];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.nameField resignFirstResponder];
}

- (IBAction)clearLabel:(id)sender{
    self.messageLabel.text = @"";
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
