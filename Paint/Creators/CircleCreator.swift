//
//  CircleCreator.swift
//  Paint
//
//  Created by Артём Шайтер on 3/30/18.
//  Copyright © 2018 Артём Шайтер. All rights reserved.
//

import Foundation
import Figures

class CircleCreater: FigureCreator {
    override func create() -> Figure? {
        return Circle(startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 0, y: 0))
    }
}
