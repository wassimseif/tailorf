 import Foundation
 
 
 func parseJSON (withData data: Data ) -> [String : AnyObject]?{
    do {
        let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:AnyObject]
        return json
    }catch{
        print("Error")
        return nil
    }
    
 }
 
 
 
 /// Gets a hand of the standard input
 let stdin = FileHandle.standardInput
 /// This will hault the program until it gets it's input
 let data  = stdin.readDataToEndOfFile()
 let json = parseJSON(withData: data)
 
 
 let summary = Summary.initFrom(Object: json!["summary"]!)
 
 print(summary!.analyzedCount)
 
