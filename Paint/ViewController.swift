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
    
    @IBOutlet weak var color: NSColorWell!
    @IBOutlet weak var drawPanel: DrawPanelView!
    
    @IBAction private func setLine(_ sender: NSButton) {
        creator = LineCreater()
    }
    
    @IBAction private func setSquare(_ sender: NSButton) {
        creator = SquareCreater()
    }
    
    @IBAction private func setRectangle(_ sender: NSButton) {
        creator = RectangleCreater()
    }
    
    @IBAction private func setCircle(_ sender: NSButton) {
        creator = CircleCreater()
    }
    
    @IBAction private func setEllipse(_ sender: NSButton) {
        creator = EllipseCreater()
    }
    @IBAction func save(_ sender: NSButton) {
        let data = try? JSONEncoder().encode(list)
        let savePanel = NSSavePanel()
        savePanel.runModal()
        if var fileURL = savePanel.url {
            fileURL.appendPathExtension("pnt")
            do {
                try data!.write(to: fileURL)
            }
            catch (let err) {
                print(err)
            }
        }
        
    }
    
    @IBAction func load(_ sender: NSButton) {
        let openPanel = NSOpenPanel()
        openPanel.runModal()
        
        if let fileURL = openPanel.url {
            do {
                let data = try Data(contentsOf: fileURL)
                if let figures = try JSONDecoder().decode([CodingKeys]?.self, from: data) {
                    list = []
                    for figure in figures {
                        switch figure.type {
                        case "Line": list.append(Line(startPoint: figure.points[0], endPoint: figure.points[1]))
                        case "Rectangle": list.append(Rectangle(startPoint: figure.points[0], endPoint: figure.points[1]))
                        case "Square": list.append(Square(startPoint: figure.points[0], endPoint: figure.points[1]))
                        case "Polygon": list.append(Polygon(startPoint: figure.points[0], endPoint: figure.points[1]))
                        case "Ellipse": list.append(Ellipse(startPoint: figure.points[0], endPoint: figure.points[1]))
                        case "Circle": list.append(Circle(startPoint: figure.points[0], endPoint: figure.points[1]))
                        default:
                            print("err")
                        }
                    }
                    drawPanel.display()
                }
            }
            catch {/* error handling here */}
        }
        
        
        
        print(list)
        
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

