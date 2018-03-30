//
//  EllipseCreator.swift
//  Paint
//
//  Created by Артём Шайтер on 3/30/18.
//  Copyright © 2018 Артём Шайтер. All rights reserved.
//

import Foundation
import Figures

class EllipseCreater: FigureCreator {
    override func create() -> Figure? {
        return Ellipse(startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 0, y: 0))
    }
}
