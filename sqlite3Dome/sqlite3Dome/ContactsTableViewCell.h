//
//  ContactsTableViewCell.h
//  sqlite3Dome
//
//  Created by 吴泽钦 on 3/31/16.
//  Copyright © 2016 MichaelW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *age;
@property (weak, nonatomic) IBOutlet UILabel *phone;

@end
