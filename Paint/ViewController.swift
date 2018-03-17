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

let list = FigureList()

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createAListOfFigures()
    }

    func createAListOfFigures() {
        list.append(Line(startPointX: 10, startPointY: 10, endPointX: 200, endPointY: 200, strokeColor: NSColor.green, lineWidth: 5.0))
        list.append(Rectangle(startPointX: 45, startPointY: 50, endPointX: 200, endPointY: 90, strokeColor: NSColor.red, lineWidth: 10.0))
        list.append(Square(startPointX: 100, startPointY: 100, endPointX: 200, endPointY: 200))
        list.append(Ellipse(startPointX: 45, startPointY: 50, endPointX: 200, endPointY: 90))
        list.append(Circle(startPointX: 100, startPointY: 100, endPointX: 200, endPointY: 200))
        
        list.append(Polygon(points: [Point(x: 10, y: 10), Point(x: 200, y: 10), Point(x: 250, y: 250), Point(x: 10, y: 200), Point(x: 20, y: 100)]))
        
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

