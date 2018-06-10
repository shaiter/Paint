//
//  UIConfigurations.swift
//  Paint
//
//  Created by Артём Шайтер on 6/10/18.
//  Copyright © 2018 Артём Шайтер. All rights reserved.
//

import AppKit

class UIConfigurations:NSObject, NSCoding {
    
    
    var background: NSColor = NSColor.white
    
    var fontColor: NSColor = NSColor.black
    
    var language: String = "Russian"
    
    struct Language {
        var saveButton: String
        var loadButton: String
        var addButton: String
        var changeButton: String
        var deleteButton: String
        var backgroundLabel: String
        var fontLabel: String
    }
    
    static var languages = ["Russian" : Language(saveButton: "Сохрфнить", loadButton: "Загрузить", addButton: "Добавить", changeButton: "Изменить", deleteButton: "Удалить", backgroundLabel: "Фон", fontLabel: "Шрифт"), "English" : Language(saveButton: "Save", loadButton: "Load", addButton: "Add", changeButton: "Change", deleteButton: "Delete", backgroundLabel: "Background", fontLabel: "Font")]
    
    init(background: NSColor = .white, fontColor: NSColor = .black, language: String = "Russian") {
        self.background = background
        self.fontColor = fontColor
        self.language = language
    }
    
    private static let fileURL = URL(fileURLWithPath: "/Users/artemsajter/Downloads/configs.xml")
    
    static func saveConfigurations(configs: UIConfigurations) {
        let coder = NSKeyedArchiver()
        coder.outputFormat = .xml
        coder.encode(configs)
        do {
            try coder.encodedData.write(to: fileURL)
        }
        catch (let err) {
            print(err)
        }
    }

    static func loadConfigurations() -> UIConfigurations? {
        guard let data = try? Data(contentsOf: fileURL) else {
            return nil
        }
        let decoder = NSKeyedUnarchiver(forReadingWith: data)
        if let configs = decoder.decodeObject() as? UIConfigurations {
            return configs
        }
        return nil
    }

    private enum CodingKeys: String, CodingKey {
        case background
        case fontColor
        case language
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(background, forKey: CodingKeys.background.rawValue)
        aCoder.encode(fontColor, forKey: CodingKeys.fontColor.rawValue)
        aCoder.encode(language, forKey: CodingKeys.language.rawValue)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let background = aDecoder.decodeObject(forKey: CodingKeys.background.rawValue) as? NSColor
            else { return nil }
        guard let fontColor = aDecoder.decodeObject(forKey: CodingKeys.fontColor.rawValue) as? NSColor
            else { return nil }
        guard let language = aDecoder.decodeObject(forKey: CodingKeys.language.rawValue) as? String
            else { return nil }
        self.init(background: background, fontColor: fontColor, language: language)
    }
    
}
