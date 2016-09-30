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
    
    func parseSummary() -> Summary?{
        guard (json != nil) && (json!["summary"] != nil) else {
            return nil
        }
         return Summary.initFrom(Object: json!["summary"]!)
        
    }
}
