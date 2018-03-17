//
//  FigureList.swift
//  Paint
//
//  Created by Артём Шайтер on 3/2/18.
//  Copyright © 2018 Артём Шайтер. All rights reserved.
//

import Foundation

class FigureList: Sequence, IteratorProtocol {
    
    var count = 0
    
    func next() -> Int? {
        if count == 0 {
            return nil
        } else {
            defer { count -= 1 }
            return count
        }
    }
    
    
    var list = [Figure]()
    
    subscript(index: Int) -> Figure{
        get{
            return list[index]
        }
        set{
            list[index] = newValue
        }
    }
    
    func append(_ figure: Figure) {
        list.append(figure)
        count += 1
    }
    
}





