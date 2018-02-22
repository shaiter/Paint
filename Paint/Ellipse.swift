//
//  Ellipse.swift
//  Paint
//
//  Created by Артём Шайтер on 2/20/18.
//  Copyright © 2018 Артём Шайтер. All rights reserved.
//

import AppKit

class Ellipse: Figure{
    
    var startPoint: (x: Int, y: Int)
    var size: (x: Int, y: Int)
    
    func draw() {
        let path = NSBezierPath(ovalIn: NSRect(x: self.startPoint.x, y: self.startPoint.x, width: self.size.x, height: self.size.y))
        path.lineWidth = 5
        NSColor.black.setStroke()
        path.stroke()
    }
    
    init(startPoint: (x: Int, y: Int), size: (x: Int, y: Int)) {
        self.startPoint.x = startPoint.x
        self.startPoint.y = startPoint.y
        self.size.x = size.x
        self.size.y = size.y
    }
    
}
