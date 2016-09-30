import PackageDescription

let package = Package(
    name: "tailorf",
    targets: [],
    dependencies: [
          .Package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver.git", majorVersion: 1)
        ]
)
