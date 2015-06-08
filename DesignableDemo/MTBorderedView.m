//The MIT License (MIT)
//
//Copyright (c) 2015 Cemal YILMAZ
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.

#import "MTBorderedView.h"

@interface MTBorderedView ()

@property (nonatomic, assign) IBInspectable BOOL       topBorder;
@property (nonatomic, assign) IBInspectable NSUInteger topBorderWidth;
@property (nonatomic, strong) IBInspectable UIColor    *topBorderColor;

@property (nonatomic, assign) IBInspectable BOOL       bottomBorder;
@property (nonatomic, assign) IBInspectable NSUInteger bottomBorderWidth;
@property (nonatomic, strong) IBInspectable UIColor    *bottomBorderColor;

@property (nonatomic, assign) IBInspectable BOOL       leftBorder;
@property (nonatomic, assign) IBInspectable NSUInteger leftBorderWidth;
@property (nonatomic, strong) IBInspectable UIColor    *leftBorderColor;

@property (nonatomic, assign) IBInspectable BOOL       rightBorder;
@property (nonatomic, assign) IBInspectable NSUInteger rightBorderWidth;
@property (nonatomic, strong) IBInspectable UIColor    *rightBorderColor;
@end

@implementation MTBorderedView

- (void) prepareForInterfaceBuilder {
//
}

- (void) drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    if(self.topBorder) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSaveGState(context);
        [self.topBorderColor setStroke];

        CGContextSetLineWidth(context, self.topBorderWidth);
        CGContextMoveToPoint(context, self.bounds.origin.x, self.bounds.origin.y + ceil(self.topBorderWidth / 2));
        CGContextAddLineToPoint(context, self.bounds.origin.x + self.bounds.size.width, self.bounds.origin.y + self.topBorderWidth / 2);
        CGContextStrokePath(context);
        
        CGContextRestoreGState(context);
    }
    
    if(self.bottomBorder) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSaveGState(context);
        [self.bottomBorderColor setStroke];
        
        CGContextSetLineWidth(context, self.bottomBorderWidth);
        CGContextMoveToPoint(context, self.bounds.origin.x, self.bounds.origin.y +self.bounds.size.height - ceil(self.bottomBorderWidth / 2));
        CGContextAddLineToPoint(context, self.bounds.origin.x + self.bounds.size.width, self.bounds.origin.y +self.bounds.size.height - ceil(self.bottomBorderWidth / 2));
        CGContextStrokePath(context);
        
        CGContextRestoreGState(context);
    }
    
    if(self.leftBorder) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSaveGState(context);
        [self.leftBorderColor setStroke];
        
        CGContextSetLineWidth(context, self.leftBorderWidth);
        CGContextMoveToPoint(context, self.bounds.origin.x + ceil(self.leftBorderWidth/2), self.bounds.origin.y);
        CGContextAddLineToPoint(context, self.bounds.origin.x + ceil(self.leftBorderWidth/2), self.bounds.origin.y + self.bounds.size.height);
        CGContextStrokePath(context);
        CGContextRestoreGState(context);
    }
    
    if(self.rightBorder) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSaveGState(context);
        [self.rightBorderColor setStroke];
        
        CGContextSetLineWidth(context, self.rightBorderWidth);
        CGContextMoveToPoint(context, self.bounds.origin.x +self.bounds.size.width - ceil(self.rightBorderWidth/2), self.bounds.origin.y);
        CGContextAddLineToPoint(context, self.bounds.origin.x +self.bounds.size.width - ceil(self.rightBorderWidth/2), self.bounds.origin.y + self.bounds.size.height);
        CGContextStrokePath(context);
        CGContextRestoreGState(context);
    }
}

@end
