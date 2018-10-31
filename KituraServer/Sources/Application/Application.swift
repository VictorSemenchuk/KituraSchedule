import Foundation
import Kitura
import LoggerAPI
import Configuration
import CloudEnvironment
import KituraContracts
import Health
import SwiftKuery
import SwiftKueryORM
import SwiftKueryPostgreSQL
import CredentialsHTTP
import Credentials
import KituraSession

public let projectPath = ConfigurationManager.BasePath.project.path
public let health = Health()

public class App {
    let router = Router()
    let cloudEnv = CloudEnv()
    
    let mySSLConfig =  SSLConfig(withChainFilePath: "/tmp/Creds/cert.pfx",
                                 withPassword: "serverVITK1",
                                 usingSelfSignedCerts: true)
    
    public init() throws {
        // Run the metrics initializer
        initializeMetrics(router: router)
    }
    
    func postInit() throws {
        // Endpoints
        initializeHealthRoutes(app: self)
        
        setupDB()
        registerHandlers()
    }
    
    private func registerHandlers() {
        let recordHandler = RecordHandler()
        recordHandler.registerRoutes(for: router)
        
        let userHandler = UserHandler()
        userHandler.registerRoutes(for: router)
        
        let reasonHandler = ReasonHandler()
        reasonHandler.registerRoutes(for: router)
    }
    
    private func setupDB() {
        let pool = PostgreSQLConnection.createPool(host: "localhost",
                                                   port: 5432,
                                                   options: [.databaseName("KituraTeamDB")],
                                                   poolOptions: ConnectionPoolOptions(initialCapacity: 1, maxCapacity: 5, timeout: 10000))
        Database.default = Database(pool)
        
        //table for colors
        do {
            try Color.createTableSync()
            try User.createTableSync()
        } catch _ {
            // Error
        }
    }
    
    public func run() throws {
        try postInit()
        Kitura.addHTTPServer(onPort: cloudEnv.port, with: router)
        Kitura.run()
    }

}
