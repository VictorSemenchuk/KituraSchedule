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
    
    
    
    
    
    //RECORDS
    static func getRecordsByUserID(userId:Int, completion: @escaping((_ records:[Record]?,_ error: RequestError?)->())) {
        guard let client  = KituraKit(baseURL: kKituraClientURL) else {
            print("Error creating KituraKit client")
            return
        }
        
        let userIdParam = RecordParams.init(userId: userId)
        
        client.get(DataType.Records.rawValue, query: userIdParam) { (records: [Record]?, error) in
            guard let records = records else {
                completion(nil, error)
                return
            }
            
            completion(records, nil)
        }
    }

    
    static func getElementByID(dataType: DataType, id: Int, completion: @escaping(()->())) {
        guard let client  = KituraKit(baseURL: kKituraClientURL) else {
            print("Error creating KituraKit client")
            return
        }
        
        let query = "\(dataType.rawValue)?id=\(id)"
        
        client.get(query) { (obj:User? ,error : RequestError?) in
            print(obj)
        }
    }

}
