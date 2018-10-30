//
//  Service+Authentication.swift
//  KituraTeamSchedule
//
//  Created by Dmitriy Tarelkin on 30/10/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import Foundation
import KituraKit

extension Service {
    
    /**
     A protocol that credentials must implement to be used in KituraKit routes.
     
     Classes or structs that conform to `ClientCredentials` must contain a `getHeaders()` function
     that will return the HTTP headers required to authenticate using the provided credentials.
     ### Usage Example: ###
     ```swift
     public struct MyToken: ClientCredentials {
     public let token: String
     
     public func getHeaders() -> [String : String] {
     return ["X-token-type": "MyToken", "access_token": self.token]
     }
     }
     
     client.get("/protected", credentials: MyToken(token: "12345")) { (user: User?, error: RequestError?) -> Void in
     guard let user = user else {
     print("failed request")
     }
     print(user)
     }
     ```
     */
    
    
    func authenticate(email: String, password:String) ->Bool {
        guard let client = KituraKit(baseURL: kKituraClientURL) else {
            print("Error creating KituraKit client")
            return false
        }
        return true
    }
    
    func logout() {
        guard let client = KituraKit(baseURL: kKituraClientURL) else {
            print("Error creating KituraKit client")
            return
        }
    }
}
