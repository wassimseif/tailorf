//
//  File.swift
//  tailorf
//
//  Created by Wassim on 9/30/16.
//
//

import Foundation

class File {
    var path : String!
    var parsed : Bool!
    var violations : [Violation]!
    
    init(atPath path : String , didParse parsed : Bool , havingViolations violations : [Violation]){
        self.path = path
        self.parsed = parsed
        self.violations = violations
    }
    class func initFrom(Object object : AnyObject) -> File? {
        guard let path = object["path"] as? String ,
              let parsed = object["parsed"] as? Bool,
            let violationsAsArrayOfAnyObjects = object["violations"] as? [AnyObject] else {
                return nil
        }
        var violations = [Violation]()
        for violation in violationsAsArrayOfAnyObjects{
            let newViolation = Violation.initFrom(Object: violation)
            if newViolation != nil {
                violations.append(newViolation!)
            }
        }
        return File(atPath: path, didParse: parsed, havingViolations: violations)
    }
}
