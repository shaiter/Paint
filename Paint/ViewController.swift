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

var newFigure: Figure = Line(startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 0, y: 0))

class ViewController: NSViewController {
    
    @IBAction func setLine(_ sender: NSButton) {
        newFigure = Line(startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 0, y: 0))
    }
    
    @IBAction func setSquare(_ sender: NSButton) {
        newFigure = Square(startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 0, y: 0))
    }
    
    @IBAction func setRectangle(_ sender: NSButton) {
        newFigure = Rectangle(startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 0, y: 0))
    }
    
    @IBAction func setCircle(_ sender: NSButton) {
        newFigure = Circle(startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 0, y: 0))
    }
    
    @IBAction func setEllipse(_ sender: NSButton) {
        newFigure = Ellipse(startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 0, y: 0))
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        createAListOfFigures()
        //newFigure = Line
    }

    func createAListOfFigures() {
        list.append(Line(startPoint: CGPoint(x: 10.0,y: 10.0), endPoint: CGPoint(x: 100.0, y: 100.0)))
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

}

