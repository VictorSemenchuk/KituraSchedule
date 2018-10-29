//
//  Reason.swift
//  Application
//
//  Created by serverVITK on 10/25/18.
//

import Foundation

struct Reason: Codable {
    var id: Int
    var title: String
    var colorId: Int
    
    var color: Color?
}
