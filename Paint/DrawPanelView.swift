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
        newFigure.points[0] = mouseCoord
        newFigure.points[1] = mouseCoord
        //newFigure.strokeColor = color ?? NSColor.black
        list.append(newFigure)
        
        super.mouseDown(with: event)
        
    }
    
    override func mouseDragged(with event: NSEvent) {
        let mouseCoord = event.locationInWindow
        list[list.count - 1].points[1] = mouseCoord
        display()
    }
    
    override func mouseUp(with event: NSEvent) {
        super.mouseUp(with: event)
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        for figure in list {
            figure.draw()
        }
        
    }
    
}
