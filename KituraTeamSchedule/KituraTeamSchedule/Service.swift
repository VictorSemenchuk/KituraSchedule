//
//  Service.swift
//  KituraTeamSchedule
//
//  Created by serverVITK on 10/25/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import Foundation
import KituraKit

class Service {
    
    static func getColors() {
        guard let client = KituraKit(baseURL: "http://EPBYMINW4879:8080") else {
            print("Error creating KituraKit client")
            return
        }
        client.get("/colors") { (colors: [Color]?, error: Error?) in
            guard let colors = colors else {
                print(error?.localizedDescription)
                return
            }
            colors.forEach({ (color) in
                print(color)
            })
        }
    }
    
    static func getUsers() {
        guard let client = KituraKit(baseURL: "http://EPBYMINW4879:8080") else {
            print("Error creating KituraKit client")
            return
        }
        client.get("/users") { (users: [User]?, error: Error?) in
            guard let users = users else {
                print(error?.localizedDescription)
                return
            }
            users.forEach({ (user) in
                print(user)
            })
        }
    }
    
    static func getReasons() {
        guard let client = KituraKit(baseURL: "http://EPBYMINW4879:8080") else {
            print("Error creating KituraKit client")
            return
        }
        client.get("/reasons") { (reasons: [Reason]?, error: Error?) in
            guard let reasons = reasons else {
                print(error?.localizedDescription)
                return
            }
            reasons.forEach({ (reason) in
                print(reason)
            })
        }
    }
    
    
    
}
