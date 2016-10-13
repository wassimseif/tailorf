//
//  ReportHandler.swift
//  tailorf
//
//  Created by Wassim Seifeddine on 10/2/16.
//
//

import Foundation
import MuttonChop

class ReportHandler {
    var path : String!
    var files : [File]!
    var summary : Summary!
    var reportName : String!
    init(withFiles files : [File],andReportSummary summary : Summary) {
        self.files = files
        self.summary = summary
        self.reportName = getReportName()
        
        t()
        
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

    func t(){
        
        
        guard let handle = FileHandle(forReadingAtPath: "/Users/wassimseifeddine/Desktop/Projects/Swift/trailorf/Templates/main.mustache") else {
            fatalError("no file at path")
        }
        let contents = handle.readDataToEndOfFile()
        let string = String(data: contents, encoding: String.Encoding.utf8)
        
        
        let template = try? Template(string!)
        
        let summaryContext: Context = [
            "analyzedCount": "\(summary.analyzedCount!)",
            "errorsCount" : "\(summary.errorsCount!)",
            "skippedCount"  : "\(summary.skippedCount!)",
            "violationsCount" : "\(summary.violationsCount!)",
            "warningsCount" : "\(summary.warningsCount!)"
        ]
        let rendered = template?.render(with: summaryContext)
        print(rendered) // -> Hello, Dan!

    }
}
