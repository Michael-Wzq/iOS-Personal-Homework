//
//  ViewController.m
//  ScrollerPageView
//
//  Created by 吴泽钦 on 3/11/16.
//  Copyright © 2016 MichaelW. All rights reserved.
//

#import "PageViewController.h"
#import "ViewController.h"

static int numberOfPages = 3;
@interface ViewController ()

@property (strong,nonatomic) NSTimer *timer;
@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.50f target:self selector:@selector(runTimePage) userInfo:nil repeats:YES ];
    
    NSMutableArray *controllers = [[ NSMutableArray alloc] init];
    for (unsigned i = 0 ; i < numberOfPages; i++) {
        [controllers    addObject:[NSNull null]];
    }
    self.imageViews = controllers;
    
    //scrollView
    
    
    
    self.scrollView.bounces = YES;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.delegate = self;
    
    //pagecontrol
    self.pageControl.numberOfPages =[self.imageViews count];
    self.pageControl.currentPage = 0;
    
    
    // loadScrollViewWithPage
    for (int i = 0 ; i < [self.imageViews count]; i++) {
        PageViewController *controller = [self.imageViews objectAtIndex:i];
        
        if ((NSNull *) controller == [NSNull null]) {
            controller = [[PageViewController alloc] initWithPageNumber:i];
            [self.imageViews replaceObjectAtIndex:i withObject:controller];
        }
        
        if (!controller.view.superview) {
            controller.view.frame = CGRectMake(320*i+320, 0, 320, 190);
            [self.scrollView addSubview:controller.view];
        }
        
        
    }
    PageViewController *controller = [[PageViewController alloc] initWithPageNumber:0];
    controller.view.frame = CGRectMake(0, 0, 320, 190);
    [self.scrollView addSubview:controller.view];
    PageViewController *controller1 = [[PageViewController alloc] initWithPageNumber:((int)[self.imageViews count]-1)];
    
    controller.view.frame = CGRectMake(320*([self.imageViews count]+1), 0, 320, 190);
    [self.scrollView addSubview:controller1.view];
    
    [self.scrollView setContentSize:CGSizeMake(320 * ([self.imageViews count] + 2), 190)];
    [self.scrollView setContentOffset:CGPointMake(0, 0)];
    [self.scrollView scrollRectToVisible:CGRectMake(320,0,320,190) animated:NO];
    
    
    
}
















- (void)scrollViewDidScroll:(UIScrollView *)sender{
    
    CGFloat pagewidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pagewidth/([self.imageViews count]+2))/pagewidth)+1;
    page --;  // 默认从第二页开始
    self.pageControl.currentPage = page;
    
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pagewidth = self.scrollView.frame.size.width;
    int currentPage = floor((self.scrollView.contentOffset.x - pagewidth/ ([self.imageViews count]+2)) / pagewidth) + 1;
    
    if (currentPage==0)
    {
        [self.scrollView scrollRectToVisible:CGRectMake(320 * [self.imageViews count],0,320,190) animated:NO]; // 序号0 最后1页
    }
    else if (currentPage==([self.imageViews count]+1))
    {
        [self.scrollView scrollRectToVisible:CGRectMake(320,0,320,190) animated:NO]; // 最后+1,循环第1页
    }
    [self.timer invalidate];
}
- (IBAction)changePage:(id)sender {
    
    int page = (int)self.pageControl.currentPage;
    //    [self loadScrollViewWithPage:page];
    //    [self loadScrollViewWithPage:page+1];
    CGRect frame = self.scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [self.scrollView scrollRectToVisible:frame animated:YES];
    
}

// pagecontrol 选择器的方法
- (void)turnPage
{
    int page = (int)self.pageControl.currentPage; // 获取当前的page
    [self.scrollView scrollRectToVisible:CGRectMake(320*(page+1),0,320,190) animated:NO]; // 触摸pagecontroller那个点点 往后翻一页 +1
}
// 定时器 绑定的方法
- (void)runTimePage
{
    int page = (int)self.pageControl.currentPage; // 获取当前的page
    page++;
    page = page > 2 ? 0 : page ;
    self.pageControl.currentPage = page;
    [self turnPage];
}






@end
