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

var selectedFigureIndex: Int?

class ViewController: NSViewController {
    
    var configs = UIConfigurations()
    
    @IBOutlet weak var drawPanel: DrawPanelView!
    @IBOutlet weak var figuresComboBox: NSComboBox!
    @IBOutlet weak var languagesComboBox: NSComboBox!
    
    @IBOutlet weak var x1: NSTextField!
    @IBOutlet weak var y1: NSTextField!
    @IBOutlet weak var x2: NSTextField!
    @IBOutlet weak var y2: NSTextField!
    @IBOutlet weak var x1label: NSTextField!
    @IBOutlet weak var y1label: NSTextField!
    @IBOutlet weak var x2label: NSTextField!
    @IBOutlet weak var y2label: NSTextField!
    @IBOutlet weak var saveButton: NSButton!
    @IBOutlet weak var loadButton: NSButton!
    @IBOutlet weak var addButton: NSButton!
    @IBOutlet weak var changeButton: NSButton!
    @IBOutlet weak var deleteButton: NSButton!
    @IBOutlet weak var backgroundLabel: NSTextField!
    @IBOutlet weak var fontLabel: NSTextField!
    @IBOutlet weak var languageLabel: NSTextField!
    
    override func mouseUp(with event: NSEvent) {
        reloadComboBox()
    }
    
    func reloadComboBox() {
        figuresComboBox.removeAllItems()
        for index in 0..<list.count {
            figuresComboBox.addItem(withObjectValue: "\(index + 1) \(list[index].type)" )
        }
    }
    
    @IBAction func changeFigure(_ sender: NSButton) {
        if let index = selectedFigureIndex, list.count > index {
            
            
            if let value = Float(x1.stringValue) {
                list[index].points[0].x = CGFloat(value)
            } else {
                x1.stringValue = String(Float(list[index].points[0].x))
            }
            if let value = Float(y1.stringValue) {
                list[index].points[0].y = CGFloat(value)
            } else {
                y1.stringValue = String(Float(list[index].points[0].y))
            }
            if let value = Float(x2.stringValue) {
                list[index].points[1].x = CGFloat(value)
            } else {
                x2.stringValue = String(Float(list[index].points[1].x))
            }
            if let value = Float(y2.stringValue) {
                list[index].points[1].y = CGFloat(value)
            } else {
                y2.stringValue = String(Float(list[index].points[1].y))
            }
        }
        drawPanel.display()
    }
    
    @IBAction func deleteFigure(_ sender: NSButton) {
        if let index = selectedFigureIndex, list.count > index {
            list.remove(at: index)
        }
        reloadComboBox()
        drawPanel.display()
    }
    
    
    @IBAction func tapOnComboBox(_ sender: NSComboBox) {
        selectedFigureIndex = sender.indexOfSelectedItem
        if let index = selectedFigureIndex, index >= 0{
            x1.stringValue = String(Float(list[index].points[0].x))
            y1.stringValue = String(Float(list[index].points[0].y))
            x2.stringValue = String(Float(list[index].points[1].x))
            y2.stringValue = String(Float(list[index].points[1].y))
        }
    }
    
    @IBAction func setBackgroundColor(_ sender: NSColorWell) {
        configs.background = sender.color
        setBackground()
        UIConfigurations.saveConfigurations(configs: configs)
    }
    
    @IBAction func setFontColor(_ sender: NSColorWell) {
        configs.fontColor = sender.color
        setFontColor()
        UIConfigurations.saveConfigurations(configs: configs)
    }
    
    @IBAction func setLanguage(_ sender: NSComboBox) {
        if let language = sender.cell?.stringValue {
            configs.language = language
            setLanguage()
            UIConfigurations.saveConfigurations(configs: configs)
        }
    }
    
    @IBAction private func setFigure(_ sender: NSButton) {
        switch sender.identifier?.rawValue {
        case "Line":
            creator = CreatorsList.creators[0]
        case "Rectangle":
            creator = CreatorsList.creators[1]
        case "Square":
            creator = CreatorsList.creators[2]
        case "Ellipse":
            creator = CreatorsList.creators[3]
        case "Circle":
            creator = CreatorsList.creators[4]
        default:
            print("no such figure")
        }
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
        
        openPanel.canChooseDirectories = false
        openPanel.allowsMultipleSelection = false
        openPanel.allowedFileTypes = ["pnt"]
        
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
    
    
    func setBackground() {
        self.view.layer?.backgroundColor = CGColor(red: configs.background.redComponent, green: configs.background.greenComponent, blue: configs.background.blueComponent, alpha: configs.background.alphaComponent)
    }
    
    func setFontColor() {
        x1.textColor = configs.fontColor
        y1.textColor = configs.fontColor
        x2.textColor = configs.fontColor
        y2.textColor = configs.fontColor
        x1label.textColor = configs.fontColor
        y1label.textColor = configs.fontColor
        x2label.textColor = configs.fontColor
        y2label.textColor = configs.fontColor
        backgroundLabel.textColor = configs.fontColor
        fontLabel.textColor = configs.fontColor
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        let attributes = [NSAttributedStringKey.foregroundColor: configs.fontColor, NSAttributedStringKey.paragraphStyle : paragraph]
        if let language = UIConfigurations.languages[configs.language] {
            saveButton.attributedTitle = NSAttributedString(string: language.saveButton, attributes: attributes)
            loadButton.attributedTitle = NSAttributedString(string: language.loadButton, attributes: attributes)
            addButton.attributedTitle = NSAttributedString(string: language.addButton, attributes: attributes)
            changeButton.attributedTitle = NSAttributedString(string: language.changeButton, attributes: attributes)
            deleteButton.attributedTitle = NSAttributedString(string: language.deleteButton, attributes: attributes)
        }
        
        
        
        
    }
    
    func setLanguage() {
        if let language = UIConfigurations.languages[configs.language] {
            backgroundLabel.stringValue = language.backgroundLabel
            fontLabel.stringValue = language.fontLabel
            let paragraph = NSMutableParagraphStyle()
            paragraph.alignment = .center
            let attributes = [NSAttributedStringKey.foregroundColor: configs.fontColor, NSAttributedStringKey.paragraphStyle : paragraph]
            saveButton.attributedTitle = NSAttributedString(string: language.saveButton, attributes: attributes)
            loadButton.attributedTitle = NSAttributedString(string: language.loadButton, attributes: attributes)
            addButton.attributedTitle = NSAttributedString(string: language.addButton, attributes: attributes)
            changeButton.attributedTitle = NSAttributedString(string: language.changeButton, attributes: attributes)
            deleteButton.attributedTitle = NSAttributedString(string: language.deleteButton, attributes: attributes)
        }
    }
    
    func setLenguageComboBoxItems() {
        for language in UIConfigurations.languages.keys {
            languagesComboBox.addItem(withObjectValue: language)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.wantsLayer = true
        drawPanel.wantsLayer = true
        drawPanel.layer?.backgroundColor = CGColor.white
        setLenguageComboBoxItems()
        
        if let configs = UIConfigurations.loadConfigurations() {
            self.configs = configs
            setBackground()
            setFontColor()
            setLanguage()
        }
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

}

