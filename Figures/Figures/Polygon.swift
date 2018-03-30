//
//  Polygon.swift
//  Paint
//
//  Created by Артём Шайтер on 3/16/18.
//  Copyright © 2018 Артём Шайтер. All rights reserved.
//

import AppKit

open class Polygon: Figure {
    
    override public func draw() {
        path.move(to: CGPoint(x: self.points[0].x, y: self.points[0].y))
        for index in 1..<self.points.count {
            path.line(to: CGPoint(x: self.points[index].x, y: self.points[index].y))
        }
        path.line(to: CGPoint(x: self.points[0].x, y: self.points[0].y))
        super.draw()
    }
    
    public override init(points: [CGPoint], strokeColor: NSColor, lineWidth: CGFloat) {
        super.init(points: points, strokeColor: strokeColor, lineWidth: lineWidth)
    }
    
    public init(points:[CGPoint]) {
        super.init(points: points)
    }
}
