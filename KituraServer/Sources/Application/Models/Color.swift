//
//  Color.swift
//  Application
//
//  Created by serverVITK on 10/25/18.
//

import Foundation
import SwiftKuery
import SwiftKueryORM

class ColorsTable: Table {
    let tableName = "Colors"
    
    let id = Column("colorid")
    let red = Column("red")
    let green = Column("green")
    let blue = Column("blue")
    let alpha = Column("alpha")
}

struct Color: Model {
    var colorId: Int
    var red: Double
    var green: Double
    var blue: Double
    var alpha: Double
    
    init?(row: [String: Any?]) {
        guard let id = row["colorid"] as? NSNumber,
            let red = row["red"] as? NSNumber,
            let green = row["green"] as? NSNumber,
            let blue = row["blue"] as? NSNumber,
            let alpha = row["alpha"] as? NSNumber else {
                return nil
        }
        self.colorId = id.intValue
        self.red = red.doubleValue
        self.green = green.doubleValue
        self.blue = blue.doubleValue
        self.alpha = alpha.doubleValue
    }
}
