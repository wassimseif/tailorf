//
//  ReportHandler.swift
//  tailorf
//
//  Created by Wassim Seifeddine on 10/2/16.
//
//

import Foundation
import Mustache
import SwiftyBeaver
class ReportHandler {
    var path : String!
    var files : [File]!
    var summary : Summary!
    var reportName : String!
    init(withFiles files : [File],andReportSummary summary : Summary) {
        self.files = files
        self.summary = summary
        self.reportName = getReportName()
        var template : Template? = nil 
        do {
             template = try Template(named: "main")

        }catch let error as MustacheError {
            
            print("Error Loading Template \(error.kind)")
            return
        }catch {
            print("Error Loading Template")
            return
        }
        let summaryData: [String: Any] = [
            "analyzedCount": "\(summary.analyzedCount!)",
            "errorsCount" : "\(summary.errorsCount!)",
            "skippedCount" : "\(summary.skippedCount!)",
            "violationsCount" : "\(summary.violationsCount!)",
            "warningsCount" : "\(summary.warningsCount!)",
            "date" : Date(),
            "files" : files,

        ]
        var rendered : String? = ""
        do {
              rendered = try template?.render(summaryData)
        }catch {
            print("Error")
        }
        print(rendered!)
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
