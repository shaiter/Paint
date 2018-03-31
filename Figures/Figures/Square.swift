//
//  Square.swift
//  Paint
//
//  Created by Артём Шайтер on 2/28/18.
//  Copyright © 2018 Артём Шайтер. All rights reserved.
//

import AppKit


open class Square: Figure {
    
    override public var points: [CGPoint] {
        set {
            if super.points.count > 1{
                super.points[0] = newValue[0]
                if abs(super.points[0].x - newValue[1].x) < abs(super.points[0].y - newValue[1].y){
                    super.points[1].x = newValue[1].x
                    if super.points[0].y < newValue[1].y {
                        super.points[1].y = super.points[0].y + abs(newValue[1].x - super.points[0].x)
                    } else {
                        super.points[1].y = super.points[0].y - abs(newValue[1].x - super.points[0].x)
                    }
                    
                } else {
                    super.points[1].y = newValue[1].y
                    if super.points[0].x < newValue[1].x {
                        super.points[1].x = super.points[0].x + abs(newValue[1].y - super.points[0].y)
                    } else {
                        super.points[1].x = super.points[0].x - abs(newValue[1].y - super.points[0].y)
                    }
                }
            } else {
                super.points = newValue
            }
        }
        get {
            return super.points
        }
    }
    
    override public func draw() {
        self.path = NSBezierPath(rect: NSRect(x: self.points[0].x, y: self.points[0].y, width: (self.points[1].x - self.points[0].x), height: (self.points[1].y - self.points[0].y)))
        super.draw()
    }
    
    public init(startPoint: CGPoint, endPoint: CGPoint, strokeColor: NSColor, lineWidth: CGFloat) {
        let points = [startPoint, endPoint]
        super.init(points: points, strokeColor: strokeColor, lineWidth: lineWidth)
    }
    
    public init(startPoint: CGPoint, endPoint: CGPoint) {
        let points = [startPoint, endPoint]
        super.init(points: points)
    }
    
}

