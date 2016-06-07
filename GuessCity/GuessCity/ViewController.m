//
//  ViewController.m
//  GuessCity
//
//  Created by 吴泽钦 on 2/11/16.
//  Copyright © 2016 MichaelW. All rights reserved.
//
#import "City.h"
#import "Game.h"
#import "ViewController.h"

@interface ViewController() {
    Game *_game;
    NSArray *pickerArray;
}
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UIPickerView *cityPicker;
@property (weak, nonatomic) IBOutlet UIButton *guessCityBtn;
@property (weak, nonatomic) IBOutlet UIImageView *currentCityImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    pickerArray = [NSArray arrayWithObjects:@"纽约",@"东京",@"伦敦",@"巴黎",@"香港",@"洛杉矶",@"芝加哥",@"新加坡",@"悉尼",@"首尔", nil];
    _game = [Game game];
    [self showCity];
    
  
}
- (void) showCity {
    self.currentCityImage.image = _game.imageOfCurrentCity;
}

- (void) showScore {
    self.scoreLabel.text = _game.currentScore;
}
- (void) guessWithName:(NSInteger) cityID {
    if([_game guessCity:cityID])
    {
        
        [self showScore];
        if ([_game.currentScore isEqualToString:@"100"]) {
            [self showAlertView:@"竟然全都对,猴赛雷,新年快乐!"];
        }else{
            [self   showAlertView:@"回答正确,加10分"];
            [self showCity];
        }
        
    }else{
        [self showAlertView:@"回答错误,仔细看图加油!"];
    }
}
- (IBAction)guessCity:(id)sender {
   [self guessWithName:[self.cityPicker selectedRowInComponent:0]];
}
#pragma 弹框
- (void)showAlertView:(NSString *)str{
    NSString *title = NSLocalizedString(@"Guess City", nil);
    NSString *otherButtonTitle = NSLocalizedString(@"OK", nil);
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:str preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}];
     [alertController addAction:otherAction];
    [self presentViewController:alertController animated:YES completion:nil];
}
#pragma 选择器
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [pickerArray count];
}
-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [pickerArray objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    [self.guessCityBtn setTitle:[pickerArray objectAtIndex:row] forState:UIControlStateNormal];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
