//
//  Summary.swift
//  tailorf
//
//  Created by Wassim on 9/30/16.
//
//

import Foundation

class Summary {
    var violationsCount : Double!
    var warningsCount : Double!
    var analyzedCount : Double!
    var errorsCount : Double!
    var skippedCount : Double!
    
    init(violationsCount : Double, warningsCount : Double, analyzedCount : Double , errorsCount : Double, skippedCount : Double) {
        self.violationsCount = violationsCount
        self.warningsCount = warningsCount
        self.analyzedCount = analyzedCount
        self.errorsCount = errorsCount
        self.skippedCount = skippedCount
        
    }
    class func initFrom(Object object : AnyObject ) -> Summary?{
        guard let violationsCount = object["violations"] as? Double else {
            return nil
        }
        guard let warningsCount = object["warnings"] as? Double else {
            return nil
        }
        guard let analyzedCount = object["analyzed"] as? Double else {
            return nil
        }
        guard let errorsCount = object["errors"] as? Double else {
            return nil
        }
        guard let skippedCount = object["skipped"] as? Double else {
                return nil
        }
        return Summary(violationsCount: violationsCount, warningsCount: warningsCount, analyzedCount: analyzedCount, errorsCount: errorsCount, skippedCount: skippedCount)
        
    }
}
