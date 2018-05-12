//
//  DrawPanelView.swift
//  Paint
//
//  Created by Артём Шайтер on 2/21/18.
//  Copyright © 2018 Артём Шайтер. All rights reserved.
//

import Cocoa
import Figures

class DrawPanelView: NSView {
    
    private var newFigure = creator.create()!
    private var color: NSColor?
    
    override func mouseDown(with event: NSEvent) {
        
        let mouseCoord = event.locationInWindow
        newFigure = creator.create()!
        //ViewController.colo
        newFigure.points[0] = mouseCoord
        newFigure.points[1] = mouseCoord
        //newFigure.strokeColor = color ?? NSColor.black
        list.append(newFigure)
    }
    
    override func mouseDragged(with event: NSEvent) {
        let mouseCoord = event.locationInWindow
        list[list.count - 1].points[1] = mouseCoord
        display()
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        for figure in list {
            
            figure.draw()
            
            
//            if list[index] is Line {
//                Drawing.draw(list[index] as! Line)
//            } else if list[index] is Rectangle {
//                    Drawing.draw(list[index] as! Rectangle)
//            } else if list[index] is Square {
//                Drawing.draw(list[index] as! Square)
//            } else if list[index] is Ellipse {
//                Drawing.draw(list[index] as! Ellipse)
//            } else if list[index] is Circle {
//                Drawing.draw(list[index] as! Circle)
//            }
            
        }
        
    }
    
}
