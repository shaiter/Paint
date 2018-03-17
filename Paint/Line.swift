//
//  Line.swift
//  Paint
//
//  Created by Артём Шайтер on 2/20/18.
//  Copyright © 2018 Артём Шайтер. All rights reserved.
//

import AppKit

class Line: Figure {
    
    override func draw() {
        let path = NSBezierPath()
        path.move(to: CGPoint(x: self.points[0].x, y: self.points[0].y))
        path.line(to: CGPoint(x: self.points[1].x, y: self.points[1].y))
        path.lineWidth = self.lineWidth
        self.strokeColor.setStroke()
        path.stroke()
    }
    
    init(startPointX: Double, startPointY: Double, endPointX: Double, endPointY: Double, strokeColor: NSColor, lineWidth: CGFloat) {
        let points = [Point(x: startPointX, y: startPointY), Point(x: endPointX, y: endPointY)]
        super.init(points: points, strokeColor: strokeColor, lineWidth: lineWidth)
    }
    
    init(startPointX: Double, startPointY: Double, endPointX: Double, endPointY: Double) {
        let points = [Point(x: startPointX, y: startPointY), Point(x: endPointX, y: endPointY)]
        super.init(points: points)
    }
    
}
