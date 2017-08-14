//
//  MBCircularProgressBarView.m
//  MBCircularProgressBar
//
//  Created by Mati Bot on 7/2/15.
//  Copyright (c) 2015 Mati Bot All rights reserved.
//

#import "MBCircularProgressBarView.h"
#import "MBCircularProgressBarLayer.h"

@implementation MBCircularProgressBarView

-(instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self) {
        [self initView:[self frame]];
    }
    return self;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self initView:CGRectNull];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView:frame];
    }
    return self;
}

-(void)initView:(CGRect)frame{
    //Without setting the content scale factor the layer would be pixelated
    [self setContentScaleFactor:[[UIScreen mainScreen] scale]];
    
    //This mode forces redrawing when bounds change (e.g. bounds change in animation)
    [self setContentMode:UIViewContentModeRedraw];
    
    [self setUnitString:@"%"];
    [self setValue:0.f];
    [self setMaxValue:100.f];
    [self setBorderPadding:1.f];
    [self setProgressAppearanceType:0];
    [self setProgressRotationAngle:0.f];
    [self setProgressStrokeColor:[UIColor orangeColor]];
    [self setProgressColor:[UIColor orangeColor]];
    [self setProgressCapType:kCGLineCapRound];
    [self setEmptyLineColor:[UIColor lightGrayColor]];
    [self setEmptyLineStrokeColor:[UIColor lightGrayColor]];
    [self setFontColor:[UIColor blackColor]];
    [self setEmptyLineWidth:1.f];
    [self setProgressLineWidth:14.f];
    [self setProgressAngle:80.f];
    [self setUnitFontSize:-1];
    [self setValueFontSize:-1];
    [self setValueDecimalFontSize:-1];
    [self setDecimalPlaces:0];
    [self setShowUnitString:YES];
    [self setShowValueString:YES];
    [self setValueFontName:@"HelveticaNeue-Thin"];
    [self setTextOffset:CGPointMake(0, 0)];
    [self setUnitFontName:@"HelveticaNeue-Thin"];
    [self setCountdown:NO];
}

#pragma mark - Getters and Setters for layer properties

-(void)setShowValueString:(BOOL)showValueString{
  self.progressLayer.showValueString = showValueString;
  [self.layer setNeedsDisplay];
}

-(BOOL)showValueString{
  return self.progressLayer.showValueString;
}

-(void)setValue:(CGFloat)value{
    self.progressLayer.value = value;
    
    //CALayer autogenerated setter using @dynamic doesn't refresh the layer when the value is 0
    if(value == 0){
        [self.layer setNeedsDisplay];
    }
}

-(CGFloat)value{
    return self.progressLayer.value;
}

-(void)setMaxValue:(CGFloat)maxValue{
    self.progressLayer.maxValue = maxValue;
    
    //CALayer autogenerated setter using @dynamic doesn't refresh the layer when the value is 0
    if(maxValue == 0){
        [self.layer setNeedsDisplay];
    }
}

-(CGFloat)maxValue{
    return self.progressLayer.maxValue;
}

-(void)setBorderPadding:(CGFloat)borderPadding{
    self.progressLayer.borderPadding = borderPadding;
}

-(CGFloat)borderPadding{
    return self.progressLayer.borderPadding;
}

-(void)setProgressLineWidth:(CGFloat)width{
    self.progressLayer.progressLineWidth = width;
}

-(CGFloat)progressLineWidth{
    return self.progressLayer.progressLineWidth;
}

-(void)setEmptyLineWidth:(CGFloat)width{
    self.progressLayer.emptyLineWidth = width;
}

-(CGFloat)emptyLineWidth{
    return self.progressLayer.emptyLineWidth;
}

-(void)setProgressColor:(UIColor*)color{
    self.progressLayer.progressColor = color;
}

-(UIColor*)progressColor{
    return self.progressLayer.progressColor;
}

-(void)setUnitFontSize:(CGFloat)unitFontSize{
    self.progressLayer.unitFontSize = unitFontSize;
}

-(CGFloat)unitFontSize{
    return self.progressLayer.unitFontSize;
}

-(void)setValueFontSize:(CGFloat)valueFontSize{
    self.progressLayer.valueFontSize = valueFontSize;
}

-(CGFloat)valueFontSize{
    return self.progressLayer.valueFontSize;
}

-(void)setUnitString:(NSString *)unitString{
    self.progressLayer.unitString = unitString;
}

-(NSString*)unitString{
    return self.progressLayer.unitString;
}

-(void)setFontColor:(UIColor*)color{
    self.progressLayer.fontColor = color;
}

-(UIColor*)fontColor{
    return self.progressLayer.fontColor;
}

-(void)setProgressStrokeColor:(UIColor*)color{
    self.progressLayer.progressStrokeColor = color;
}

-(UIColor*)progressStrokeColor{
    return self.progressLayer.progressStrokeColor;
}

-(void)setEmptyLineColor:(UIColor *)emptyLineColor{
    self.progressLayer.emptyLineColor = emptyLineColor;
}

-(UIColor*)emptyLineColor{
    return self.progressLayer.emptyLineColor;
}

-(void)setEmptyLineStrokeColor:(UIColor *)emptyLineStrokeColor{
    self.progressLayer.emptyLineStrokeColor = emptyLineStrokeColor;
}

-(UIColor*)emptyLineStrokeColor{
    return self.progressLayer.emptyLineStrokeColor;
}

-(void)setProgressAngle:(CGFloat)progressAngle{
    self.progressLayer.progressAngle = progressAngle;
}

-(CGFloat)progressAngle{
    return self.progressLayer.progressAngle;
}

-(void)setProgressAppearanceType:(NSInteger)progressAppearanceType{
    self.progressLayer.progressAppearanceType = [self safeProgressAppearanceType:progressAppearanceType];
}

-(NSInteger)progressAppearanceType{
    return self.progressLayer.progressAppearanceType;
}

-(MBCircularProgressBarAppearanceType)safeProgressAppearanceType:(NSInteger)progressAppearanceType{
    if(MBCircularProgressBarAppearanceTypeOverlaysEmptyLine <= progressAppearanceType  && progressAppearanceType <= MBCircularProgressBarAppearanceTypeUnderEmptyLine){
        return (MBCircularProgressBarAppearanceType)progressAppearanceType;
    }
    
    return MBCircularProgressBarAppearanceTypeOverlaysEmptyLine;
}

-(void)setProgressRotationAngle:(CGFloat)progressRootationAngle{
    self.progressLayer.progressRotationAngle = progressRootationAngle;
}

-(CGFloat)progressRotationAngle{
    return self.progressLayer.progressRotationAngle;
}

-(void)setProgressCapType:(NSInteger)progressCapType{
    self.progressLayer.progressCapType = [self safeCapType:progressCapType];
}

-(NSInteger)progressCapType{
    return self.progressLayer.progressCapType;
}

-(void)setEmptyCapType:(NSInteger)emptyCapType{
    self.progressLayer.emptyCapType = [self safeCapType:emptyCapType];
}

-(NSInteger)emptyCapType{
    return self.progressLayer.emptyCapType;
}

-(CGLineCap)safeCapType:(NSInteger)type{
    if(kCGLineCapButt <= type && type <= kCGLineCapSquare){
        return (CGLineCap)type;
    }
    
    return kCGLineCapRound;
}

-(void)setDecimalPlaces:(NSInteger)decimalPlaces{
  self.progressLayer.decimalPlaces = decimalPlaces;
}
-(NSInteger)decimalPlaces{
  return self.progressLayer.decimalPlaces;
}

-(void)setValueDecimalFontSize:(CGFloat)valueDecimalFontSize{
  self.progressLayer.valueDecimalFontSize = valueDecimalFontSize;
}

-(CGFloat)valueDecimalFontSize{
  return self.progressLayer.valueDecimalFontSize;
}

-(void)setUnitFontName:(NSString *)unitFontName{
  self.progressLayer.unitFontName = unitFontName;
}

-(NSString *)unitFontName{
  return self.progressLayer.unitFontName;
}

-(void)setValueFontName:(NSString *)valueFontName{
  self.progressLayer.valueFontName = valueFontName;
}

-(NSString *)valueFontName{
  return self.progressLayer.valueFontName;
}

-(void)setShowUnitString:(BOOL)showUnitString{
  self.progressLayer.showUnitString = showUnitString;
}

-(BOOL)showUnitString{
  return self.progressLayer.showUnitString;
}

-(void)setTextOffset:(CGPoint)textOffset{
  self.progressLayer.textOffset = textOffset;
}

-(CGPoint)textOffset{
  return self.progressLayer.textOffset;
}

-(void)setCountdown:(BOOL)countdown {
  self.progressLayer.countdown = countdown;
}

-(BOOL)countdown {
  return self.progressLayer.countdown;
}

-(void)setIsPersian:(BOOL)persian
{
    self.progressLayer.isPersian = persian;
}

-(BOOL)isPersian
{
    return self.progressLayer.isPersian;
}

#pragma mark - CALayer

-(MBCircularProgressBarLayer*)progressLayer{
    MBCircularProgressBarLayer* layer = (MBCircularProgressBarLayer*) self.layer;
    return layer;
}

+ (Class) layerClass {
    return [MBCircularProgressBarLayer class];
}

@end
