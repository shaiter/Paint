//
//  Ellipse.swift
//  Paint
//
//  Created by Артём Шайтер on 2/20/18.
//  Copyright © 2018 Артём Шайтер. All rights reserved.
//

import AppKit

class Ellipse: Figure{
    
    override func draw() {
        let path = NSBezierPath(ovalIn: NSRect(x: self.points[0].x, y: self.points[0].y, width: (self.points[1].x - self.points[0].x), height: (self.points[1].y - self.points[0].y)))
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
