//
//  Square.swift
//  Paint
//
//  Created by Артём Шайтер on 2/28/18.
//  Copyright © 2018 Артём Шайтер. All rights reserved.
//

import AppKit


open class Square: Figure {
    
    override public func draw() {
        self.path = NSBezierPath(rect: NSRect(x: self.points[0].x, y: self.points[0].y, width: (self.points[1].x - self.points[0].x), height: (self.points[1].y - self.points[0].y)))
        super.draw()
    }
    
    public init(startPoint: CGPoint, endPoint: CGPoint, strokeColor: NSColor, lineWidth: CGFloat) {
        if abs(endPoint.x - startPoint.x) < abs(endPoint.y - startPoint.y) {
            let points = [startPoint, endPoint]
            super.init(points: points, strokeColor: strokeColor, lineWidth: lineWidth)
        } else {
            let points = [startPoint, endPoint]
            super.init(points: points, strokeColor: strokeColor, lineWidth: lineWidth)
        }
    }
    
    public init(startPoint: CGPoint, endPoint: CGPoint) {
        if abs(endPoint.x - startPoint.x) < abs(endPoint.y - startPoint.y) {
            let points = [startPoint, endPoint]
            super.init(points: points)
        } else {
            let points = [startPoint, endPoint]
            super.init(points: points)
        }
    }
    
}

