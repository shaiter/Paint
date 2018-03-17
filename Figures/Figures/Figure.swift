//
//  Figure.swift
//  Paint
//
//  Created by Артём Шайтер on 2/20/18.
//  Copyright © 2018 Артём Шайтер. All rights reserved.
//

import AppKit

open class Figure {
    
    private(set) var strokeColor: NSColor
    private(set) var lineWidth: CGFloat
    
    private(set) var points = [Point]()
    
    init(points: [Point], strokeColor: NSColor = NSColor.black, lineWidth: CGFloat = 2) {
        self.strokeColor = strokeColor
        self.lineWidth = lineWidth
        self.points = points
    }
    
    internal var path = NSBezierPath()
    
    public func draw() {
        self.path.lineWidth = self.lineWidth
        self.strokeColor.setStroke()
        self.path.stroke()
    }
    
}

public struct Point {
    var x: Double
    var y: Double
    
    public init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}
