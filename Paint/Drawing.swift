//
//  Drawing.swift
//  Paint
//
//  Created by Артём Шайтер on 3/18/18.
//  Copyright © 2018 Артём Шайтер. All rights reserved.
//

import AppKit
import Figures

class Drawing {
    
    static func draw(line: Line) {
        let path = NSBezierPath()
        path.move(to: CGPoint(x: line.points[0].x, y: line.points[0].y))
        path.line(to: CGPoint(x: line.points[1].x, y: line.points[1].y))
        stroke(path: path, figure: line)
    }
    
    static func draw(rect: Rectangle) {
        let path = NSBezierPath(rect: NSRect(x: rect.points[0].x, y: rect.points[0].y, width: (rect.points[1].x - rect.points[0].x), height: (rect.points[1].y - rect.points[0].y)))
        stroke(path: path, figure: rect)
    }
    
    static func draw(square: Square) {
        let path = NSBezierPath(rect: NSRect(x: square.points[0].x, y: square.points[0].y, width: (square.points[1].x - square.points[0].x), height: (square.points[1].y - square.points[0].y)))
        stroke(path: path, figure: square)
    }
    
    static func draw(ellipse: Ellipse) {
        let path = NSBezierPath(ovalIn: NSRect(x: ellipse.points[0].x, y: ellipse.points[0].y, width: (ellipse.points[1].x - ellipse.points[0].x), height: (ellipse.points[1].y - ellipse.points[0].y)))
        stroke(path: path, figure: ellipse)
    }
    
    static func draw(circle: Circle) {
        let path = NSBezierPath(ovalIn: NSRect(x: circle.points[0].x, y: circle.points[0].y, width: (circle.points[1].x - circle.points[0].x), height: (circle.points[1].y - circle.points[0].y)))
        stroke(path: path, figure: circle)
    }
    
    static private func stroke(path: NSBezierPath, figure: Figure) {
        path.lineWidth = figure.lineWidth
        figure.strokeColor.setStroke()
        path.stroke()
    }
    
    private init() {}
}
