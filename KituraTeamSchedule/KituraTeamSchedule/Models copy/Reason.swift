//
//  Reason.swift
//  Application
//
//  Created by serverVITK on 10/25/18.
//

import Foundation
import SwiftKueryORM

struct Reason: Codable {
    var id: Int
    var title: Int
    var colorId: Int
    
    var color: Color?
}
