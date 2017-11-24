//
//  ViewController.m
//  CDZCollectionInTableViewDemo
//
//  Created by Nemocdz on 2017/1/21.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "ViewController.h"
#import "CDZTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,CDZTableViewCellDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.estimatedRowHeight = 40.f;
    self.tableview.rowHeight = UITableViewAutomaticDimension;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (void)didChangeCell:(UITableViewCell *)cell{
    [self.tableview reloadData];
    NSIndexPath *indexPath = [self.tableview indexPathForCell:cell];
    [self.tableview scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:NO];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int columnCount = 3;
    int i = 10;
    if (indexPath.row == 2) {
        //计算列号和行号
        int colX=i%columnCount;
        int rowY=i/columnCount;
        return 4 * 100;
    }else{
        
        return UITableViewAutomaticDimension;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifer = [NSString stringWithFormat:@"CDZTableViewCell%ld",indexPath.row];//唯一标识，相当于不复用
    CDZTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (!cell) {
        cell  = [CDZTableViewCell.alloc initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        if (indexPath.row == 0) {
            [cell.contentView setBackgroundColor:[UIColor redColor]];
        }
        if (indexPath.row == 1) {
            [cell.contentView setBackgroundColor:[UIColor blueColor]];
        }
        if (indexPath.row == 2) {
            [cell.contentView setBackgroundColor:[UIColor greenColor]];
        }
    }
    cell.delegate = self;
    return cell;
}



@end
