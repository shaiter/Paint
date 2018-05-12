//
//  Rectangle.swift
//  Paint
//
//  Created by Артём Шайтер on 2/20/18.
//  Copyright © 2018 Артём Шайтер. All rights reserved.
//

import AppKit


open class Rectangle: Figure {
    
    override public func draw() {
        self.path = NSBezierPath(rect: NSRect(x: self.points[0].x, y: self.points[0].y, width: (self.points[1].x - self.points[0].x), height: (self.points[1].y - self.points[0].y)))
        super.draw()
    }
    
    public init(startPoint: CGPoint, endPoint: CGPoint, strokeColor: NSColor, lineWidth: CGFloat) {        let points = [startPoint, endPoint]
        super.init(points: points, type: "Rectangle", strokeColor: strokeColor, lineWidth: lineWidth)
    }
    
    public init(startPoint: CGPoint, endPoint: CGPoint) {
        let points = [startPoint, endPoint]
        super.init(points: points, type: "Rectangle")
    }
    
    public required convenience init(from decoder: Decoder) throws {
       try self.init(from: decoder)
    }
    
}

