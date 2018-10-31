// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "KituraServer",
    dependencies: [
      .package(url: "https://github.com/IBM-Swift/Kitura.git", .upToNextMinor(from: "2.5.0")),
      .package(url: "https://github.com/IBM-Swift/HeliumLogger.git", .upToNextMinor(from: "1.7.1")),
      .package(url: "https://github.com/IBM-Swift/CloudEnvironment.git", from: "8.0.0"),
      .package(url: "https://github.com/RuntimeTools/SwiftMetrics.git", from: "2.0.0"),
      .package(url: "https://github.com/IBM-Swift/Health.git", from: "1.0.0"),
      .package(url: "https://github.com/IBM-Swift/Swift-Kuery-ORM.git", .upToNextMinor(from: "0.3.1")),
      .package(url: "https://github.com/IBM-Swift/Swift-Kuery-PostgreSQL.git", from: "1.2.0"),
      .package(url: "https://github.com/IBM-Swift/Kitura-CredentialsHTTP.git", from: "2.1.0"),
      .package(url: "https://github.com/IBM-Swift/Kitura-Session.git", from: "3.2.0"),
      .package(url: "https://github.com/IBM-Swift/HeliumLogger.git", from: "1.7.3")
    ],
    targets: [
      .target(name: "KituraServer", dependencies: [ .target(name: "Application"), "Kitura" , "HeliumLogger"]),
      .target(name: "Application", dependencies: [ "Kitura", "CloudEnvironment","SwiftMetrics","Health", "SwiftKueryORM", "SwiftKueryPostgreSQL", "CredentialsHTTP", "KituraSession"]),

      .testTarget(name: "ApplicationTests" , dependencies: [.target(name: "Application"), "Kitura","HeliumLogger" ])
    ]
)
