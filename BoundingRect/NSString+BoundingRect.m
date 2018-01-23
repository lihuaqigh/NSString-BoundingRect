//
//  NSString+BoundingRect.m
//  Noob2017
//
//  Created by lhq on 2018/1/19.
//  Copyright © 2018年 lihuaqi. All rights reserved.
//

#import "NSString+BoundingRect.h"

@implementation NSString (BoundingRect)

- (CGSize)sq_boundingRectWithSize:(CGSize)size font:(UIFont *)font {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:font forKey:NSFontAttributeName];
    CGSize boundingRect = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading  attributes:dict context:nil].size;
    return CGSizeMake(ceil(boundingRect.width), ceil(boundingRect.height));
}

- (CGSize)sq_boundingRectWithSize:(CGSize)size font:(UIFont *)font lineSpacing:(CGFloat)lineSpacing {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    // 这里如果有需求可以自己实现截断方式，默认以单词为单位断行
    // paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:font forKey:NSFontAttributeName];
    [dict setValue:paragraphStyle forKey:NSParagraphStyleAttributeName];

    CGSize boundingRect = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:dict context:nil].size;
    // 如果只有一行文字且包含中文则去掉行高
    if (boundingRect.height - font.lineHeight <= paragraphStyle.lineSpacing && [self containsChinese]) {
        return CGSizeMake(ceil(boundingRect.width), ceil(boundingRect.height - paragraphStyle.lineSpacing));
    }
    return CGSizeMake(ceil(boundingRect.width), ceil(boundingRect.height));
}

- (CGFloat)sq_boundingHeightWithSize:(CGSize)size font:(UIFont*)font lineSpacing:(CGFloat)lineSpacing maxLines:(NSInteger)maxLines {
    
    if (maxLines <= 0) {
        return 0;
    }
    
    CGFloat maxHeight = ceil(font.lineHeight * maxLines + lineSpacing * (maxLines - 1));
    
    CGSize boundingRect = [self sq_boundingRectWithSize:size font:font lineSpacing:lineSpacing];
    
    if (boundingRect.height >= maxHeight) {
        return maxHeight;
    } else {
        return boundingRect.height;
    }
}

- (BOOL)sq_isMultiRowWithSize:(CGSize)size font:(UIFont *)font lineSpaceing:(CGFloat)lineSpacing {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:font forKey:NSFontAttributeName];
    [dict setValue:paragraphStyle forKey:NSParagraphStyleAttributeName];
    
    CGSize boundingRect = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:dict context:nil].size;
    
    if (boundingRect.height - font.lineHeight <= paragraphStyle.lineSpacing && [self containsChinese]) {
        return NO;
    } else {
        return YES;
    }
}

// 判断是否包含中文字符
- (BOOL)containsChinese {
    for (int i = 0; i < self.length; i++) {
        unichar c = [self characterAtIndex:i];
        if (c >0x4E00 && c <0x9FFF) return YES;
    }
    return NO;
}
@end
