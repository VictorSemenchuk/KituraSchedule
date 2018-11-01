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
    static func addRecord(record: Record, completion: @escaping () -> Void) {
        guard let client = KituraKit(baseURL: kKituraClientURL) else {
            print("Error creating KituraKit client")
            DispatchQueue.main.async {
                completion()
            }
            return
        }
        client.post(RecordAcions.Add.rawValue, data: record) { (insertedRecord: Record?, error: RequestError?) in
            print("Inserted")
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    //UODATE A RECORD
    static func updateRecord(record: Record, completion: @escaping () -> Void) {
        guard let client = KituraKit(baseURL: kKituraClientURL) else {
            print("Error creating KituraKit client")
            DispatchQueue.main.async {
                completion()
            }
            return
        }
        client.post(RecordAcions.Update.rawValue, data: record) { (updatedRecord: Record?, error: RequestError?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Updated")
            }
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    //REMOVE A RECORD
    static func removeRecord(record: Record, completion: @escaping () -> Void) {
        guard let client = KituraKit(baseURL: kKituraClientURL) else {
            print("Error creating KituraKit client")
            DispatchQueue.main.async {
                completion()
            }
            return
        }
        client.post(RecordAcions.Remove.rawValue, data: record) { (updatedRecord: Record?, error: RequestError?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Removed")
            }
            DispatchQueue.main.async {
                completion()
            }
        }
    }
}
