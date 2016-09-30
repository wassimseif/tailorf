 import Foundation
 import SwiftyBeaver
  let log = SwiftyBeaver.self
 func setupSwiftyBeaver(){

    let console = ConsoleDestination()  // log to Xcode Console
    let file = FileDestination()  // log to default swiftybeaver.log file
    let cloud = SBPlatformDestination(appID: "foo", appSecret: "bar", encryptionKey: "123") // to cloud
    
    // use custom format and set console output to short time, log level & message
    console.format = "$DHH:mm:ss$d $L $M"
    
    // add the destinations to SwiftyBeaver
    log.addDestination(console)
    log.addDestination(file)
    log.addDestination(cloud)
 }
 
 func parseJSON (withData data: Data ) -> [String : AnyObject]?{
    do {
        let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:AnyObject]
        return json
    }catch{
        print("Error")
        return nil
    }
    
 }
 
 
 setupSwiftyBeaver()
 log.verbose("testing verbose")
 /// Gets a hand of the standard input
 let stdin = FileHandle.standardInput
 /// This will hault the program until it gets it's input
 let data  = stdin.readDataToEndOfFile()
 let json = parseJSON(withData: data)
 
 let summary = Summary.initFrom(Object: json!["summary"]!)
 
 print(summary!.analyzedCount)
 
