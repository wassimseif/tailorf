//
//  File.swift
//  tailorf
//
//  Created by Wassim on 9/30/16.
//
//

import Foundation
import Mustache

class File  {
    var path : String!
    var parsed : Bool!
    var violations : [Violation]? = nil
    
    init(atPath path : String , didParse parsed : Bool , havingViolations violations : [Violation]?){
        self.path = path
        self.parsed = parsed
        self.violations = violations
    }
    class func initFrom(Object object : AnyObject) -> File? {
        guard let path = object["path"] as? String else {
            return nil
        }
        guard let parsed = object["parsed"] as? Bool else {
            return nil
        }
        
        guard let violationsAsArrayOfAnyObjects = object["violations"] as? [AnyObject] else {
            return nil
        }
        
        if !parsed{
            return File(atPath: path, didParse: parsed, havingViolations: nil)
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
extension File : MustacheBoxable{
    var mustacheBox: MustacheBox {
        return Box([
            "path": path,
            "parsed": parsed,
            "violations": violations ?? nil,
            ])
    }
    
}
