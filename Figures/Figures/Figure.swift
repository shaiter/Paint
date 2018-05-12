//
//  Figure.swift
//  Paint
//
//  Created by Артём Шайтер on 2/20/18.
//  Copyright © 2018 Артём Шайтер. All rights reserved.
//

import AppKit

open class Figure: Codable {
    
    private var _strokeColor: [CGFloat]
    
    public var strokeColor: NSColor {
        get {
            return NSColor(red: _strokeColor[0], green: _strokeColor[1], blue: _strokeColor[2], alpha: 1)
        }
        set {
            _strokeColor = [newValue.redComponent, newValue.greenComponent, newValue.blueComponent, newValue.alphaComponent]
        }
    }
    
    
    public var lineWidth: CGFloat
    
    private var _points = [CGPoint]()
    public var points: [CGPoint] {
        get {
            return _points
        }
        set {
            _points = newValue
        }
    }
    
    public func draw() {
        self.path!.lineWidth = self.lineWidth
        self.strokeColor.setStroke()
        self.path!.stroke()
    }
    
    internal var path: NSBezierPath?
    
    public let type: String
    
    init(points: [CGPoint], type: String, strokeColor: NSColor = NSColor(red: 0, green: 0, blue: 0, alpha: 1), lineWidth: CGFloat = 2) {
        self._strokeColor = [strokeColor.redComponent, strokeColor.greenComponent, strokeColor.blueComponent, strokeColor.alphaComponent]
        self.lineWidth = lineWidth
        self._points = points
        self.type = type
    }
    
    enum CodingKeys: String, CodingKey {
        case strokeColor
        case lineWidth
        case points
        case type
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        let components = [strokeColor.redComponent, strokeColor.greenComponent, strokeColor.blueComponent, strokeColor.alphaComponent]
        try container.encode(components, forKey: .strokeColor)
        try container.encode(lineWidth, forKey: .lineWidth)
        try container.encode(_points, forKey: .points)
        try container.encode(type, forKey: .type)
    }

    public required convenience init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let components = try values.decode([CGFloat].self, forKey: .strokeColor)
        let strokeColor = NSColor(calibratedRed: components[0], green: components[1], blue: components[2], alpha: components[3])
        let lineWidth = try values.decode(CGFloat.self, forKey: .lineWidth)
        let points = try values.decode([CGPoint].self, forKey: .points)
        let type = try values.decode(String.self, forKey: .type)
        self.init(points: points, type: type, strokeColor: strokeColor, lineWidth: lineWidth)
    }
    
}

public struct CodingKeys: Codable {
    public var strokeColor: [CGFloat]
    public var lineWidth: CGFloat
    public var points: [CGPoint]
    public var type: String
}



