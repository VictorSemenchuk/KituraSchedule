//
//  Service+POST.swift
//  KituraTeamSchedule
//
//  Created by Dmitriy Tarelkin on 29/10/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import Foundation
import KituraKit


extension Service {
    
    enum RecordAcions: String {
        case Add    = "/addrecord"
        case Update = "/updaterecord"
        case Remove = "/removerecord"
    }
    
    //ADD A RECORD
    static func addRecord(record: Record) {
        guard let client = KituraKit(baseURL: kKituraClientURL) else {
            print("Error creating KituraKit client")
            return
        }
        client.post(RecordAcions.Add.rawValue, data: record) { (insertedRecord: Record?, error: RequestError?) in
            print("Inserted")
        }
    }
    
    //UODATE A RECORD
    static func updateRecord(record: Record) {
        guard let client = KituraKit(baseURL: kKituraClientURL) else {
            print("Error creating KituraKit client")
            return
        }
        client.post(RecordAcions.Update.rawValue, data: record) { (updatedRecord: Record?, error: RequestError?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Updated")
            }
        }
    }
    
    //REMOVE A RECORD
    static func removeRecord(record: Record) {
        guard let client = KituraKit(baseURL: kKituraClientURL) else {
            print("Error creating KituraKit client")
            return
        }
        client.post(RecordAcions.Remove.rawValue, data: record) { (updatedRecord: Record?, error: RequestError?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Removed")
            }
        }
    }
}
