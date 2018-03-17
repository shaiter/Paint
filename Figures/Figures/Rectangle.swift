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
    
    public init(startPointX: Double, startPointY: Double, endPointX: Double, endPointY: Double, strokeColor: NSColor, lineWidth: CGFloat) {
        let points = [Point(x: startPointX, y: startPointY), Point(x: endPointX, y: endPointY)]
        super.init(points: points, strokeColor: strokeColor, lineWidth: lineWidth)
    }
    
    public init(startPointX: Double, startPointY: Double, endPointX: Double, endPointY: Double) {
        let points = [Point(x: startPointX, y: startPointY), Point(x: endPointX, y: endPointY)]
        super.init(points: points)
    }
    
}

