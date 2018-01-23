//
//  NSString+BoundingRect.h
//  Noob2017
//
//  Created by lhq on 2018/1/19.
//  Copyright © 2018年 lihuaqi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (BoundingRect)


/**
 根据 字体 计算Label的Size
 避免一些计算上面的坑：
 UILabel包含中文且只有一行，但是底部却多算出来了一行高;
 NSDictionary<NSAttributedStringKey, id> *)attributes 为空异常
 boundingRect向上取整;

 @param size Example CGSizeMake(MAXFLOAT,height) or CGSizeMake(width,MAXFLOAT)
 @param font 字体和字号
 @return Label Size
 */
- (CGSize)sq_boundingRectWithSize:(CGSize)size font:(UIFont *)font;


/**
 根据 字体和行距 计算Label的Size

 @param size Example CGSizeMake(MAXFLOAT,height) or CGSizeMake(width,MAXFLOAT)
 @param font 字体和字号
 @param lineSpacing 行距
 @return Label Size
 */
- (CGSize)sq_boundingRectWithSize:(CGSize)size font:(UIFont *)font lineSpacing:(CGFloat)lineSpacing;


/**
 返回最大设置行数的高度

 @param size Example CGSizeMake(MAXFLOAT,height) or CGSizeMake(width,MAXFLOAT)
 @param font 字体和字号
 @param lineSpacing 行距
 @param maxLines 设置最大行数
 @return 最大设置行数的高度
 */
- (CGFloat)sq_boundingHeightWithSize:(CGSize)size font:(UIFont*)font lineSpacing:(CGFloat)lineSpacing maxLines:(NSInteger)maxLines;


/**
 是否超过一行 用于给Label 加富文本的时候 只有一行不要设置lineSpace，配合上面两个带行距的API使用

 @param size Example CGSizeMake(MAXFLOAT,height) or CGSizeMake(width,MAXFLOAT)
 @param font 字体和字号
 @param lineSpacing 行距
 @return 是否只有一行
 */
- (BOOL)sq_isMultiRowWithSize:(CGSize)size font:(UIFont *)font lineSpaceing:(CGFloat)lineSpacing;
@end
