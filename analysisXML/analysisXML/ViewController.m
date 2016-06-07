//
//  ViewController.m
//  analysisXML
//
//  Created by 吴泽钦 on 3/21/16.
//  Copyright © 2016 MichaelW. All rights reserved.
//

#import "ViewController.h"
static NSString *xmlURLString = @"rss.sina.com.cn/news/allnews/tech.xml";
@interface ViewController ()<NSXMLParserDelegate>
@property (nonatomic,strong)NSMutableArray *newsTitles;
@property (nonatomic,strong)NSMutableArray *newsDescription;
@property (nonatomic,strong)NSMutableArray *newsPublicDates;
@property (nonatomic,strong)NSMutableString *tempString;
@property (nonatomic,strong)NSXMLParser *xmlParser;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.showxml_textView.text=@"asdfa";
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)parseXML:(id)sender {
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:xmlURLString]];
    
    self.xmlParser = [[NSXMLParser alloc] initWithData:data];
    self.xmlParser.delegate=self;
    [self.xmlParser setShouldResolveExternalEntities:NO];
    BOOL flag;
    flag = [self.xmlParser parse];
    NSLog(@"%d",flag);
    if (flag) {
        NSLog(@"获取指定路径xml成功");
    }else{
        NSLog(@"失败");
    }
}

#pragma mark-
#pragma mark NSXMLParserDelegate 
//开始解析xml文件时候，通过该方法可以做一些准备工作
- (void)parserDidStartDocument:(NSXMLParser *)parser{
    [self.spinner_view startAnimating];
    self.newsTitles=nil;
    self.newsDescription=nil;
    self.newsPublicDates=nil;
    self.tempString=nil;
    self.showxml_textView.text = @"";
    NSLog(@"开始解析");
}
//当解析器对象遇到xml的开始标记时，调用这个方法开始解析该节点
- (void)parser:(NSXMLParser*)parser didStartElement:(nonnull NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName attributes:(nonnull NSDictionary<NSString *,NSString *> *)attributeDict {
    NSLog(@"发现节点");
    if ([elementName isEqualToString:@"title"]) {
        if (self.newsTitles == nil ) {
            self.newsTitles = [[NSMutableArray alloc]init];
        }
    }else if ([elementName isEqualToString:@"description"]){
        if (self.newsDescription == nil) {
            self.newsDescription = [[NSMutableArray alloc] init];
        }
        
    }else if ([elementName isEqualToString:@"pubDate"]){
        if (self.newsPublicDates == nil) {
            self.newsPublicDates = [[NSMutableArray alloc]init];
        }
    }else{
            
        }
}
//当解析器找到开始标记和结束标记之间的字符时，调用这方法解析当前节点的所有字符
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    NSLog(@"正在解析当前字符");
    if (self.tempString == nil) {
        self.tempString = [[NSMutableString alloc]init ];
        [self.tempString appendString:string];
    }
}
- (void)parser:(NSXMLParser *)parser didEndElement:(nonnull NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName  {
    NSLog(@"解析节点结束");
    if ([elementName isEqualToString:@"title"]) {
        [self.newsTitles addObject:self.tempString];
    }else if ([elementName isEqualToString:@"description"]){
        [self.newsDescription addObject:self.tempString];
    }else if ([elementName isEqualToString:@"pubDate"]){
        [self.newsDescription addObject:self.tempString];
    }else{
        
    }
    self.tempString = nil;
}
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(nonnull NSError *)parseError  {
    NSLog(@"解析xml出错:%@",parseError);
}
- (void)parserDidEndDocument:(NSXMLParser *)parser{
    if (!self.tempString) {
        self.tempString = [[NSMutableString alloc]init];
    }
    for (int i = 2 ; i < 10 ; i++) {
        [self.tempString appendString:self.newsTitles[i + 1]];
        [self.tempString appendString:self.newsDescription[i]];
        [self.tempString appendString:self.newsPublicDates[i]];
        [self.tempString appendString:@"\n---------------------------"];
    }
    self.showxml_textView.text =  self.tempString;
    NSLog(@"解析结束");
    [self.spinner_view stopAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
