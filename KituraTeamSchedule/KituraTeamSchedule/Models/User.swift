//
//  User.swift
//  Application
//
//  Created by serverVITK on 10/25/18.
//

import Foundation
import KituraKit
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
struct User: Codable {
    
    func getHeaders() -> [String : String] {
        return ["":""]
    }
    
    var id: Int
    var firstName: String
    var lastName: String
    
    var records: [Record]?
    var cred: Cred?
}
