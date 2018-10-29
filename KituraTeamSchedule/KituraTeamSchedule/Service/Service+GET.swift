//
//  Service+GET.swift
//  KituraTeamSchedule
//
//  Created by Dmitriy Tarelkin on 29/10/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import Foundation
import KituraKit

extension Service {
    
    //USERS
    static func getUsers(completion: @escaping((_ users:[User]?,_ error: RequestError?)->())) {
        guard let client = KituraKit(baseURL: kKituraClientURL) else {
            print("Error creating KituraKit client")
            return
        }
        
        client.get(DataType.Users.rawValue) { (users: [User]?, error: RequestError?) in
            guard let users = users else {
                completion(nil, error)
                return
            }
            completion(users, nil)
        }
    }
    
    
    //REASONS
    static func getReasons(completion: @escaping((_ reasons:[Reason]?,_ error: RequestError?)->())) {
        guard let client  = KituraKit(baseURL: kKituraClientURL) else {
            print("Error creating KituraKit client")
            return
        }
        
        client.get(DataType.Reasons.rawValue) { (reasons: [Reason]?, error: RequestError?) in
            guard let reasons = reasons else {
                completion(nil, error)
                return
            }
            completion(reasons, nil)
        }
    }
    
    
    
    //RECORDS
    static func getRecordsByUserID(userID:String, completion: @escaping((_ records:[Record]?,_ error: RequestError?)->())) {
        guard let client  = KituraKit(baseURL: kKituraClientURL) else {
            print("Error creating KituraKit client")
            return
        }
        
        client.get(DataType.Records.rawValue) { (records: [Record]?, error: RequestError?) in
            guard let records = records else {
                completion(nil, error)
                return
            }
            completion(records, nil)
        }
    }
    
    //CREDS
    static func getCreds(completion: @escaping((_ creds:[Cred]?,_ error: RequestError?)->())) {
        guard let client  = KituraKit(baseURL: kKituraClientURL) else {
            print("Error creating KituraKit client")
            return
        }
        
        client.get(DataType.Colors.rawValue) { (creds: [Cred]?, error: RequestError?) in
            guard let creds = creds else {
                completion(nil, error)
                return
            }
            completion(creds, nil)
        }
    }

    
    static func getElementByID(dataType: DataType, id: String, completion: @escaping(()->())) {
        guard let client  = KituraKit(baseURL: kKituraClientURL) else {
            print("Error creating KituraKit client")
            return
        }
        
        let query = "\(dataType.rawValue)?id=\(id)"
        
        client.get(query) { (obj:User? ,error : RequestError?) in
            print(obj)
        }
    }
    
    
    
    
    
    
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
