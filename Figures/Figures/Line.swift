//
//  Line.swift
//  Paint
//
//  Created by Артём Шайтер on 2/20/18.
//  Copyright © 2018 Артём Шайтер. All rights reserved.
//

import AppKit

open class Line: Figure {
    
    override public func draw() {
        self.path = NSBezierPath()
        path!.move(to: CGPoint(x: self.points[0].x, y: self.points[0].y))
        path!.line(to: CGPoint(x: self.points[1].x, y: self.points[1].y))
        super.draw()
    }
    
    public init(startPoint: CGPoint, endPoint: CGPoint, strokeColor: NSColor, lineWidth: CGFloat) {
        let points = [startPoint, endPoint]
        super.init(points: points, type: "Line", strokeColor: strokeColor, lineWidth: lineWidth)
    }
    
    public init(startPoint: CGPoint, endPoint: CGPoint) {
        let points = [startPoint, endPoint]
        super.init(points: points, type: "Line")
    }
    
    public required convenience init(from decoder: Decoder) throws {
        try self.init(from: decoder)
    }
    
}
