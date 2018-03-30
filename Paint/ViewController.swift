//
//  ViewController.swift
//  Paint
//
//  Created by Артём Шайтер on 2/20/18.
//  Copyright © 2018 Артём Шайтер. All rights reserved.
//

import Cocoa
import AppKit
import Figures

var list = [Figure]()

var creator: FigureCreator = LineCreater()

class ViewController: NSViewController {
    
    @IBAction func setLine(_ sender: NSButton) {
        creator = LineCreater()
    }
    
    @IBAction func setSquare(_ sender: NSButton) {
        creator = SquareCreater()
    }
    
    @IBAction func setRectangle(_ sender: NSButton) {
        creator = RectangleCreater()
    }
    
    @IBAction func setCircle(_ sender: NSButton) {
        creator = CircleCreater()
    }
    
    @IBAction func setEllipse(_ sender: NSButton) {
        creator = EllipseCreater()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

}

