//
//  MainViewController.m
//  WaterFlowDemo
//
//  Created by 萨斯辈的呼唤 on 14-6-23.
//  Copyright (c) 2014年 萨斯辈的呼唤. All rights reserved.
//

#import "MainViewController.h"
#import "photoViewCell.h"
#import "TMQuiltView.h"


@interface MainViewController () <TMQuiltViewDataSource, TMQuiltViewDelegate>

@property (nonatomic, retain) TMQuiltView *tableView;
@property (nonatomic, retain) NSMutableArray *images;

@end


@implementation MainViewController

-(void)dealloc
{
    [_tableView release];
    [_images release];
    [super dealloc];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    
    self.tableView = [[TMQuiltView alloc] init];
    _tableView.frame = CGRectMake(0, 0, 320, [[UIScreen mainScreen] bounds].size.height);
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    [_tableView release];
    
    self.images = [NSMutableArray array];
    for (int i = 0; i <= 29; i ++) {
        [_images addObject:[NSString stringWithFormat:@"%d.jpg", i]];
    }
    [_tableView reloadData];
}

#pragma mark - about tableView

-(NSInteger)quiltViewNumberOfCells:(TMQuiltView *)TMQuiltView
{
    return [_images count];
}
//列
- (NSInteger)quiltViewNumberOfColumns:(TMQuiltView *)quiltView
{
    return 5;
}

- (TMQuiltViewCell *)quiltView:(TMQuiltView *)quiltView cellAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str = @"photoIdentifier";
    photoViewCell *cell = (photoViewCell *)[quiltView dequeueReusableCellWithReuseIdentifier:str];
    if (nil == cell) {
        cell = [[[photoViewCell alloc] initWithReuseIdentifier:str] autorelease];
    }
    cell.photoView.image = [UIImage imageNamed:[self.images objectAtIndex:indexPath.row]];
    cell.titleLabel.text = [NSString stringWithFormat:@"第%ld张", (indexPath.row + 1)];
    return cell;
}

- (CGFloat)quiltView:(TMQuiltView *)quiltView heightForCellAtIndexPath:(NSIndexPath *)indexPath
{
    float height = [UIImage imageNamed:[self.images objectAtIndex:indexPath.row]].size.height /2 ;
    return height;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
