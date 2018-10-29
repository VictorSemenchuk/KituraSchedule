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
    
    
    ////records
    
    static func addRecord(record: Record) {
        guard let client = KituraKit(baseURL: "http://EPBYMINW4879:8080") else {
            print("Error creating KituraKit client")
            return
        }
        client.post("/addrecord", data: record) { (insertedRecord: Record?, error: RequestError?) in
            print("Inserted")
        }
    }
    
    static func updateRecord(record: Record) {
        guard let client = KituraKit(baseURL: "http://EPBYMINW4879:8080") else {
            print("Error creating KituraKit client")
            return
        }
        client.post("/updaterecord", data: record) { (updatedRecord: Record?, error: RequestError?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Updated")
            }
        }
    }
    
    static func removeRecord(record: Record) {
        guard let client = KituraKit(baseURL: "http://EPBYMINW4879:8080") else {
            print("Error creating KituraKit client")
            return
        }
        client.post("/removerecord", data: record) { (updatedRecord: Record?, error: RequestError?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Removed")
            }
        }
    }
    
    
    
}
