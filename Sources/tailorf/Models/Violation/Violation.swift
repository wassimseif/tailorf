//
//  Violation.swift
//  tailorf
//
//  Created by Wassim on 9/30/16.
//
//

import Foundation

class Violation {
    var severity : String!
    var rule : String!
    var location : Location!
    var message : String!
    
    init(havingSeverity severity : String , withRule rule : String , atLocation location : Location , withMessage message : String){
        self.severity = severity
        self.rule = rule
        self.location = location
        self.message = message
    }
    class func initFrom(Object object : AnyObject) -> Violation?{
        guard let severity = object["severity"] as? String else {
            return nil
        }
        guard let rule = object["rule"] as? String else {
            return nil
        }
        guard let message = object["message"] as? String else {
            return nil
        }
        let locationAsAnyObject = object["location"]!! as AnyObject
        
        
        
         let location = Location(atLine: locationAsAnyObject["line"]!! as! Double , atColumn: locationAsAnyObject["column"]!! as? Double)
        
        return Violation(havingSeverity: severity, withRule: rule, atLocation: location, withMessage: message)
    }
}
