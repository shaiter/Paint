//
//  DrawPanelView.swift
//  Paint
//
//  Created by Артём Шайтер on 2/21/18.
//  Copyright © 2018 Артём Шайтер. All rights reserved.
//

import Cocoa

class DrawPanelView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        /*
        let path = NSBezierPath()
        path.appendArc(withCenter: CGPoint(x: bounds.midX, y: bounds.midY), radius: 100, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        path.lineWidth = 10
        NSColor.black.setStroke()
        path.stroke()
        */
        
        let line = Line(startPoint: (Int(bounds.minX), Int(bounds.midY)), endPoint: (Int(bounds.maxX), Int(bounds.midY)))
        line.draw()
        
        let x = bounds.maxX - 30
        let y = bounds.maxY - 50
        let rect = Rectangle(startPoint: (10, 10), size: (Int(x), Int(y)))
        rect.draw()
        
        let ellipse = Ellipse(startPoint: (10, 10), size: (Int(x), Int(y)))
        ellipse.draw()
        
        
        
    }
    
}
