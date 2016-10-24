import PackageDescription

let package = Package(
    name: "tailorf",
    targets: [],
    dependencies: [
          .Package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver.git", majorVersion: 1),
          .Package(url: "https://github.com/groue/GRMustache.swift", majorVersion: 2, minor: 0),
        ]
)
