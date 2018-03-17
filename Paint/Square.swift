//
//  Square.swift
//  Paint
//
//  Created by Артём Шайтер on 2/28/18.
//  Copyright © 2018 Артём Шайтер. All rights reserved.
//

import AppKit


class Square: Figure {
    
    override func draw() {
        let path = NSBezierPath(rect: NSRect(x: self.points[0].x, y: self.points[0].y, width: (self.points[1].x - self.points[0].x), height: (self.points[1].y - self.points[0].y)))
        path.lineWidth = self.lineWidth
        self.strokeColor.setStroke()
        path.stroke()
    }
    
    init(startPointX: Double, startPointY: Double, endPointX: Double, endPointY: Double, strokeColor: NSColor, lineWidth: CGFloat) {
        if abs(endPointX - startPointX) < abs(endPointY - startPointY) {
            let points = [Point(x: startPointX, y: startPointY), Point(x: endPointX, y: endPointX)]
            super.init(points: points, strokeColor: strokeColor, lineWidth: lineWidth)
        } else {
            let points = [Point(x: startPointX, y: startPointY), Point(x: endPointY, y: endPointY)]
            super.init(points: points, strokeColor: strokeColor, lineWidth: lineWidth)
        }
    }
    
    init(startPointX: Double, startPointY: Double, endPointX: Double, endPointY: Double) {
        if abs(endPointX - startPointX) < abs(endPointY - startPointY) {
            let points = [Point(x: startPointX, y: startPointY), Point(x: endPointX, y: endPointX)]
            super.init(points: points)
        } else {
            let points = [Point(x: startPointX, y: startPointY), Point(x: endPointY, y: endPointY)]
            super.init(points: points)
        }
    }
    
}

