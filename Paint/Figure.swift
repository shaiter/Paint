//
//  Figure.swift
//  Paint
//
//  Created by Артём Шайтер on 2/20/18.
//  Copyright © 2018 Артём Шайтер. All rights reserved.
//

import AppKit

class Figure {
    
    var strokeColor: NSColor
    var lineWidth: CGFloat
    
    var points = [Point]()
    
    
    init(points: [Point], strokeColor: NSColor = NSColor.black, lineWidth: CGFloat = 2) {
        self.strokeColor = strokeColor
        self.lineWidth = lineWidth
        self.points = points
    }
    
    func draw() {}
    
}

struct Point {
    var x: Double
    var y: Double
}
