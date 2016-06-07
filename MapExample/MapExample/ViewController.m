//
//  ViewController.m
//  MapExample
//
//  Created by 吴泽钦 on 3/17/16.
//  Copyright © 2016 MichaelW. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *longitudeTF;
@property (weak, nonatomic) IBOutlet UITextField *latitudeTF;
@property (weak, nonatomic) IBOutlet UITextView *resultTV;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.activityIndicator.hidden=YES;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)jsonRequest:(id)sender {
    self.activityIndicator.hidden=NO;
    [self.activityIndicator startAnimating];
    NSString *str =@"http://lbs.juhe.cn/api/getaddressbylngb";
    NSDictionary *params = @{@"lngy":self.latitudeTF.text,@"lngx":self.longitudeTF.text
    };
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [sessionManager GET:str parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"%lld", downloadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
        self.resultTV.text = [[[responseObject objectForKey:@"row"] objectForKey:@"result"]objectForKey:@"formatted_address"];
        [self.activityIndicator stopAnimating];
        self.activityIndicator.hidden=YES;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        [self.activityIndicator stopAnimating];
        self.activityIndicator.hidden=YES;
    }];

}

@end
