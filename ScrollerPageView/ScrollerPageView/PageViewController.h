//
//  PageViewController.h
//  ScrollerPageView
//
//  Created by 吴泽钦 on 3/11/16.
//  Copyright © 2016 MichaelW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageViewController : UIViewController
{
    int pageNumber;
}
@property (weak, nonatomic) IBOutlet UILabel *PageLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;


@property (weak, nonatomic) IBOutlet UIImageView *ImageView;
- (id)initWithPageNumber:(int )page;
@end
