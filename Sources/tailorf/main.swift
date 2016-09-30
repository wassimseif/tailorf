 import Foundation
 import SwiftyBeaver
 let log = SwiftyBeaver.self
 func setupSwiftyBeaver(){
    
    let console = ConsoleDestination()  // log to Xcode Console
    let file = FileDestination()
    file.logFileURL =  URL(string:"file:///Users/wassim/Desktop/Personal/tailorf/logs/tailof.log" )
    let cloud = SBPlatformDestination(appID: "foo", appSecret: "bar", encryptionKey: "123") // to cloud
    
    // use custom format and set console output to short time, log level & message
    console.format = "$DHH:mm:ss$d $L $M"
    
    // add the destinations to SwiftyBeaver
    log.addDestination(console)
    log.addDestination(file)
    log.addDestination(cloud)
 }
 

 setupSwiftyBeaver()
 log.verbose("testing verbose")
 /// Gets a hand of the standard input
 let stdin = FileHandle.standardInput
 /// This will hault the program until it gets it's input
 let data  = stdin.readDataToEndOfFile()
 
 let jsonFormatter = JSONFormatter(withData: data)

 log.verbose("Started parsing summary")
 let summary = jsonFormatter?.parseSummary()
 if summary == nil {
    log.error("Summary is nil")
    fatalError()
 }
 print("*****************************")
 print("Summary :")
 print("Number of file scanned : \(summary!.analyzedCount!)")
 print("Number of violations : \(summary!.violationsCount!)")
 print("Number of warnings : \(summary!.warningsCount!)")
 print("Number of errors : \(summary!.errorsCount!)")
 print("Number of file skipped : \(summary!.skippedCount!)")
 print("End of summary")
 print("*************************")
