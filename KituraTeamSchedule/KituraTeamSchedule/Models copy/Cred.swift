//
//  Cred.swift
//  Application
//
//  Created by serverVITK on 10/25/18.
//

import Foundation
import SwiftKueryORM

struct Cred: Codable {
    var userUid: Int
    var email: String
    var password: String
}
