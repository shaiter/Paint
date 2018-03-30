//
//  Figure.swift
//  Paint
//
//  Created by Артём Шайтер on 2/20/18.
//  Copyright © 2018 Артём Шайтер. All rights reserved.
//

import AppKit

open class Figure {
    
    public var strokeColor: NSColor
    public var lineWidth: CGFloat
    
    public var points = [CGPoint]()
    
    init(points: [CGPoint], strokeColor: NSColor = NSColor.black, lineWidth: CGFloat = 2) {
        self.strokeColor = strokeColor
        self.lineWidth = lineWidth
        self.points = points
    }
    
    internal var path = NSBezierPath()
    
    public func draw() {
        self.path.lineWidth = self.lineWidth
        self.strokeColor.setStroke()
        self.path.stroke()
    }
    
}
