//
//  FigureCreatorsList.swift
//  Paint
//
//  Created by Артём Шайтер on 3/30/18.
//  Copyright © 2018 Артём Шайтер. All rights reserved.
//

import Foundation
import Figures

class CreatorsList: Sequence, IteratorProtocol {
    
    var count = 0
    
    func next() -> Int? {
        if count == 0 {
            return nil
        } else {
            defer { count -= 1 }
            return count
        }
    }
    
    private var creatorsList = [LineCreater(), RectangleCreater(), SquareCreater(), EllipseCreater(), CircleCreater()]
    
    subscript(index: Int) -> Figure{
        get{
            return list[index]
        }
    }
}
