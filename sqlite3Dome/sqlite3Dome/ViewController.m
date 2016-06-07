//
//  ViewController.m
//  sqlite3Dome
//
//  Created by 吴泽钦 on 3/31/16.
//  Copyright © 2016 MichaelW. All rights reserved.
//

#import "ViewController.h"
#import "ContactsTableViewCell.h"
#define DBNAME @"contactsinfo.sqlite"
#define TABLENAME @"CONTACTSINFO"
#define NAME @"name"
#define AGE  @"age"
#define PHONE @"phone"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic) NSMutableArray<NSDictionary*> *contactsArray;
@property (weak, nonatomic) IBOutlet UITableView *ContactsTable;
@property (weak, nonatomic) IBOutlet UIView *InsertView;
@property (weak, nonatomic) IBOutlet UITextField *NameText;
@property (weak, nonatomic) IBOutlet UITextField *AgeText;
@property (weak, nonatomic) IBOutlet UITextField *PhoneText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINib *nib = [UINib nibWithNibName:@"ContactsTableViewCell" bundle:nil];
    [self.ContactsTable registerNib:nib forCellReuseIdentifier:@"contactscell"];
    self.ContactsTable.delegate=self;
    self.ContactsTable.dataSource=self;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    NSString *documents =[paths objectAtIndex:0];
    NSString *database_path = [documents stringByAppendingPathComponent:DBNAME];
    if (sqlite3_open([database_path UTF8String], &db) != SQLITE_OK) {
        sqlite3_close(db);
        NSLog(@"数据库打开失败");
    }else {
        NSLog(@"成功");
    }
 
//            我找不到模拟器的位置 stackoverflow下在library application iPhone simulator但是我找不到所以打印出来看看
         NSString *appFolderPath = [[NSBundle mainBundle] resourcePath];
         NSLog(@"%@",appFolderPath);
//            然后我找到了在Finder找到这个程序的沙盒 documents里面确实创建了一个contactsinfo.sqlite
//            模拟器重新运行这个文件夹位置都会变化
    
    // 创建通讯录表
    NSString *sqlCreateTable = @"CREATE TABLE IF NOT EXISTS CONTACTSINFO (ID INTEGER PRIMARY KEY AUTOINCREMENT, name TEXt ,age INTEGER,phone TEXT)";
    [self execSql:sqlCreateTable];
    
    
    //查询数据放入数组
    if (!self.contactsArray) {
       self.contactsArray = [[NSMutableArray alloc]init];
       [self checkSqlite];
    }
    

    
    
  
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section    {
    NSLog(@"%lu",(unsigned long)self.contactsArray.count);
    return self.contactsArray.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    NSInteger row = indexPath.row;
    ContactsTableViewCell *cell = [self.ContactsTable dequeueReusableCellWithIdentifier:@"contactscell"];
    if (! cell) {
       cell = [[ContactsTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"contactscell" ];
    }
    
    cell.name.text =
    [[NSString alloc] initWithFormat:@"%@" ,[[self.contactsArray objectAtIndex:row] objectForKey:@"name"]];
    cell.age.text = [[NSString alloc] initWithFormat:@"%@" ,[[self.contactsArray objectAtIndex:row] objectForKey:@"age"]];
    cell.phone.text = [[NSString alloc] initWithFormat:@"%@" ,[[self.contactsArray objectAtIndex:row] objectForKey:@"phone"]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    
    return cell.frame.size.height;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath  {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self.contactsArray removeObjectAtIndex:[indexPath row]];

       
        [self deleteSqlite:indexPath.row];
            [tableView reloadData];
            
       
    }
}
- (IBAction)showAddView:(id)sender {
    self.InsertView.hidden=NO;
    self.NameText.text = @"";
    self.AgeText.text =@"";
    self.PhoneText.text =@"";
}

- (IBAction)addButton:(id)sender {
  
   
    [UIView animateWithDuration:1.0f animations:^{
          [self insertSqlite:self.NameText.text :[NSNumber numberWithInteger:[self.AgeText.text integerValue] ]:self.PhoneText.text];
         self.InsertView.hidden=YES;
    }];
}

- (void)insertSqlite:(NSString *)name :(NSNumber*)age :(NSString*)phone{
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO '%@' ('%@','%@','%@') VALUES ('%@','%@','%@')",TABLENAME,NAME,AGE,PHONE,name,age,phone];
    [self execSql:sql];
    NSDictionary *dic = [NSDictionary dictionaryWithObjects:@[name,age,phone]forKeys: @[@"name",@"age",@"phone"]];
    [self.contactsArray addObject:(NSDictionary*)dic];
    [self.ContactsTable reloadData];
    NSLog(@"%lu",self.contactsArray.count);
}
- (void)deleteSqlite:(NSInteger)row{
    NSString *sqlStr = [NSString stringWithFormat:@"delete from CONTACTSINFO where id = %ld",(long)row];
    [self execSql:sqlStr];
   
}
- (void)checkSqlite{

    NSString *sqlQuery = @"SELECT * FROM CONTACTSINFO";
    sqlite3_stmt * statement;
    if (sqlite3_prepare_v2(db, [sqlQuery UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            char *name =(char *)sqlite3_column_text(statement, 1);
            NSString *nameStr = [[NSString alloc] initWithUTF8String:name];
            int age = sqlite3_column_int(statement, 2);
            NSNumber *ageNum = [NSNumber numberWithInt:age];
            char *phone = (char *)sqlite3_column_text(statement, 3);
            NSString *phoneStr = [[NSString alloc]initWithUTF8String:phone];
           
            NSDictionary *dic = [NSDictionary dictionaryWithObjects:@[nameStr,ageNum,phoneStr]forKeys: @[@"name",@"age",@"phone"]];
            NSLog(@"name = %@ , age = %@ , phone = %@ ",nameStr,ageNum,phoneStr);
            [self.contactsArray addObject:(NSDictionary*)dic];
           
        }
    }
    
}
- (void)execSql:(NSString *)sql{
    char *err;
    if (sqlite3_exec(db, [sql UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSLog(@"数据库操作失败");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
