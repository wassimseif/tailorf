//
//  JSOFormatter.swift
//  tailorf
//
//  Created by Wassim on 9/30/16.
//
//

import Foundation


class JSONFormatter {
    var data : Data
    var json : [String : AnyObject]? = [String : AnyObject]()
    init?(withData data : Data? ) {
        guard data != nil else {
            return nil
        }
        self.data = data!
        parseJSON()
        
    }
    
    func parseJSON(){
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:AnyObject]
            self.json = json
        }catch{
            print("Error")
            self.json = nil
        }
    }
    
    /// Parse the summary of the linting
    ///
    /// - returns: Summary object or nil if an error occured
    func parseSummary() -> Summary?{
        guard (json != nil) && (json!["summary"] != nil) else {
            return nil
        }
         return Summary.initFrom(Object: json!["summary"]!)
    }
    
    /// Parse the files from the JSON object.
    ///
    /// - returns: Array of parsed files or nil if error
    func parseFiles() -> [File]?{
        guard (json != nil) && (json!["files"] != nil) else {
            return nil
        }
        guard let filesAsArrayOfAnyObject = json!["files"] as? [AnyObject] else {
            return nil
        }
        var files = [File]()
        for file in filesAsArrayOfAnyObject {
            let newFile = File.initFrom(Object: file)
            if newFile != nil  && newFile?.violations != nil {
                files.append(newFile!)
            }
        }
        return files
    }
}
