//
//  Line.swift
//  Paint
//
//  Created by Артём Шайтер on 2/20/18.
//  Copyright © 2018 Артём Шайтер. All rights reserved.
//

import AppKit

class Line: Figure {
    
    var startPoint: (x: Int, y: Int)
    var endPoint: (x: Int, y: Int)
    
    
    func draw() {
        let path = NSBezierPath()
        path.move(to: CGPoint(x: self.startPoint.x, y: self.startPoint.y))
        path.line(to: CGPoint(x: self.endPoint.x, y: self.endPoint.y))
        path.lineWidth = 5
        NSColor.black.setStroke()
        path.stroke()
    }
    
    init(startPoint: (x: Int, y: Int), endPoint: (x: Int, y: Int)) {
        self.startPoint.x = startPoint.x
        self.startPoint.y = startPoint.y
        self.endPoint.x = endPoint.x
        self.endPoint.y = endPoint.y
    }
    
}
