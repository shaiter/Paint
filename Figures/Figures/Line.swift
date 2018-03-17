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
        path.move(to: CGPoint(x: self.points[0].x, y: self.points[0].y))
        path.line(to: CGPoint(x: self.points[1].x, y: self.points[1].y))
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
