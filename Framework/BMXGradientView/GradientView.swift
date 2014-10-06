//
//  BMXGradientView.swift
//  BMXGradientView
//  https://github.com/mbigatti/BMXGradientView
//
//  Copyright (c) 2014 Massimiliano Bigatti. All rights reserved.
//

import UIKit

/**
    A simple UIView with configurable gradient background.
 */
@IBDesignable public class GradientView : UIView {

    /// gradient breakpoint percentage, defaults to 85%
    @IBInspectable public var gradientBreakpoint = 0.85
    
    /// gradient color darkening percentage, defaults to 5%
    @IBInspectable public var gradientDarkeningPercentage = 0.05
    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    /**
        Construct a gradient view using a custom breakpoint and color darkening percentage.
    
        :param: breakpoint          gradient breakpoint, defaults to 85%
        :param: darkeningPercentage color darkening percentage, defaults to 5%
     */
    public init(breakpoint : Double = 0.85, darkeningPercentage : Double = 0.05) {
        super.init()
        
        self.gradientBreakpoint = breakpoint
        self.gradientDarkeningPercentage = darkeningPercentage
    }
    
    public override func drawRect(rect: CGRect)
    {
        let context = UIGraphicsGetCurrentContext();
        
        let colorspace = CGColorSpaceCreateDeviceRGB();
        let color = self.backgroundColor!.darkerColor(gradientDarkeningPercentage).CGColor
        let colors = [self.backgroundColor!.CGColor, self.backgroundColor!.CGColor, color] as CFArrayRef
        let locations = [ CGFloat(0.0), CGFloat(gradientBreakpoint), CGFloat(1.0) ]

        let gradient = CGGradientCreateWithColors(colorspace, colors, locations);

        let startPoint = CGPoint(x: 0, y: 0)
        let endPoint = CGPoint(x: 0, y: self.bounds.height)

        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    }
}
