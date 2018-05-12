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
        path!.move(to: CGPoint(x: self.points[0].x, y: self.points[0].y))
        for index in 1..<self.points.count {
            path!.line(to: CGPoint(x: self.points[index].x, y: self.points[index].y))
        }
        path!.line(to: CGPoint(x: self.points[0].x, y: self.points[0].y))
        super.draw()
    }
    
    public init(points: [CGPoint], strokeColor: NSColor, lineWidth: CGFloat) {
        super.init(points: points, type: "Polygon", strokeColor: strokeColor, lineWidth: lineWidth)
    }
    
    public init(startPoint: CGPoint, endPoint: CGPoint) {
        let points = [startPoint, endPoint]
        super.init(points: points, type: "Polygon")
    }
    
    public required convenience init(from decoder: Decoder) throws {
        try self.init(from: decoder)
    }
    
}
