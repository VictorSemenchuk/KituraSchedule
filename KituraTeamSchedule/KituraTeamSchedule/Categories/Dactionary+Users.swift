//
//  Dactionary+Users.swift
//  KituraTeamSchedule
//
//  Created by Dzmitry Tarelkin on 10/31/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import Foundation

extension Dictionary {
    
    static func makeDictionaryFrom(users:[User]) -> (dict:[String: [User]],sortedKeys:[String]) {
        var dictionary = [String: [User]]()
        var sortedKeys = [String]()
        
        for contact in users {
            guard let key = contact.lastName.capitalized.first else {continue}
            let stringKey = String(key)
            if !dictionary.keys.contains(stringKey) {
                dictionary[stringKey] = [contact]
            } else {
                dictionary[stringKey]?.append(contact)
            }
        }
        print(dictionary)
        sortedKeys = dictionary.keys.sorted()
        return (dictionary,sortedKeys)
    }
}


