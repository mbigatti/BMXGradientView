//
//  BMXGradientView.swift
//  BMXGradientView
//
//  Created by Massimiliano Bigatti on 21/07/14.
//  Copyright (c) 2014 Massimiliano Bigatti. All rights reserved.
//

import UIKit

@IBDesignable public class GradientView : UIView {

    @IBInspectable public var gradientBreakpoint = 0.85
    @IBInspectable public var gradientPercentage = 0.05
    
    public init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public override func drawRect(rect: CGRect)
    {
        let context = UIGraphicsGetCurrentContext();
        
        let colorspace = CGColorSpaceCreateDeviceRGB();
        let color = self.backgroundColor.darkerColor(gradientPercentage).CGColor
        let colors = [self.backgroundColor.CGColor, self.backgroundColor.CGColor, color] as CFArrayRef
        let locations = [ 0.0, gradientBreakpoint, 1.0 ] as [CGFloat]

        let gradient = CGGradientCreateWithColors(colorspace, colors, locations);

        let startPoint = CGPoint(x: 0, y: 0)
        let endPoint = CGPoint(x: 0, y: self.bounds.height)

        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    }
}
