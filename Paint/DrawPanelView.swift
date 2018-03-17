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

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        for index in 0..<list.count {
            list[index].draw()
        }
    }
    
}
