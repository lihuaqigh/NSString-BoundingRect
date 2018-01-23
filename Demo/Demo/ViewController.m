//
//  ViewController.m
//  Demo
//
//  Created by lhq on 2018/1/23.
//  Copyright © 2018年 lhq. All rights reserved.
//

#import "ViewController.h"
#import "NSString+BoundingRect.h"

@interface ViewController ()
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UILabel *label2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /**
     *根据字体计算，不考虑行距
     */
    _label = [[UILabel alloc] initWithFrame:CGRectZero];
    _label.text = @"label:啦啦啦👌🌶啦www123行数01👌";
    _label.numberOfLines = 0;
    _label.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256.0)/256.0 green:arc4random_uniform(256.0)/256.0 blue:arc4random_uniform(256.0)/256.0 alpha:1];
    _label.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:_label];

    CGFloat H = [_label.text sq_boundingRectWithSize:CGSizeMake(100, MAXFLOAT) font:_label.font].height;
    _label.frame = CGRectMake(50, 100, 100, H);
    
    /**
     *根据字体和行距计算
     */
    _label1 = [[UILabel alloc] initWithFrame:CGRectZero];
    _label1.text = @"label1:啦啦啦啦啦啦啦";
    _label1.numberOfLines = 0;
    _label1.textAlignment = NSTextAlignmentCenter;
    _label1.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256.0)/256.0 green:arc4random_uniform(256.0)/256.0 blue:arc4random_uniform(256.0)/256.0 alpha:1];
    _label1.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:_label1];
    
    CGFloat H1 = [_label1.text sq_boundingRectWithSize:CGSizeMake(200, MAXFLOAT) font:_label1.font lineSpacing:5].height;
    _label1.frame = CGRectMake(50, 200, 200, H1);
    
    NSMutableParagraphStyle *paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    // 有行距的时候，这个很重要
    if ([_label1.text sq_isMultiRowWithSize:CGSizeMake(200, MAXFLOAT) font:_label1.font lineSpaceing:5.0]) {
        paragraphStyle1.lineSpacing = 5;
    }
    
    NSDictionary *dict1 = [NSDictionary dictionaryWithObjectsAndKeys:
                          _label1.font,NSFontAttributeName,
                          paragraphStyle1,NSParagraphStyleAttributeName,nil];
    _label1.attributedText = [[NSMutableAttributedString alloc] initWithString:_label1.text attributes:dict1];
    
    /**
     *设置最大行数
     */
    _label2 = [[UILabel alloc] initWithFrame:CGRectZero];
    _label2.text = @"label2:偏啦啦啦😋👀啦啦啦啦啦啦🌶🌶啦哈哈哈哈哈拉啦啦啦闪乱神乐劳斯莱斯护手霜";
    _label2.numberOfLines = 0;
    _label2.textAlignment = NSTextAlignmentCenter;
    _label2.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256.0)/256.0 green:arc4random_uniform(256.0)/256.0 blue:arc4random_uniform(256.0)/256.0 alpha:1];
    _label2.font = [UIFont systemFontOfSize:18];
    CGFloat H2 = [_label2.text sq_boundingHeightWithSize:CGSizeMake(200, MAXFLOAT) font:_label2.font lineSpacing:10.0 maxLines:3];
    _label2.frame = CGRectMake(50, 300, 200, H2);
    [self.view addSubview:_label2];
    
    NSMutableParagraphStyle *paragraphStyle2 = [[NSMutableParagraphStyle alloc] init];
    
    // 有行距的时候，这个很重要
    if ([_label2.text sq_isMultiRowWithSize:CGSizeMake(200, MAXFLOAT) font:_label2.font lineSpaceing:10.0]) {
        paragraphStyle2.lineSpacing = 10;
    }
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          _label2.font,NSFontAttributeName,
                          paragraphStyle2,NSParagraphStyleAttributeName,nil];
    _label2.attributedText = [[NSMutableAttributedString alloc] initWithString:_label2.text attributes:dict];
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
