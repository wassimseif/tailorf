//
//  ReportHandler.swift
//  tailorf
//
//  Created by Wassim Seifeddine on 10/2/16.
//
//

import Foundation


class ReportHandler {
    var path : String!
    var files : [File]!
    var summary : Summary!
    var reportName : String!
    init(withFiles files : [File],andReportSummary summary : Summary) {
        self.files = files
        self.summary = summary
        self.reportName = getReportName()
        
    
        
    }
    /// Generates a new report name based on the current date with a special format
    ///
    /// - returns: String that represents the name of the report to be generated.
    private func getReportName() -> String {
        let todaysDate : Date = Date()
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.dateFormat
        let todayString:String = dateFormatter.string(from: todaysDate)
        return todayString + ".html"
    }
    
}
