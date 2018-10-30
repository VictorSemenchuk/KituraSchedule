//
//  Service.swift
//  KituraTeamSchedule
//
//  Created by Dmitriy Tarelkin on 30/10/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import Foundation

let kKituraClientURL = "http://EPBYMINW4879:8080"


class Service {
    
    enum DataType:String {
        case Users   = "/users"
        case Records = "/records"
        case Colors  = "/colors"
        case Reasons = "/reasons"
    }
    
}
