//
//  Printer.swift
//  tailorf
//
//  Created by Wassim Seifeddine on 10/2/16.
//
//

import Foundation

class Printer {
    
    
    class func exists(fileAtPath path: String) -> Bool {
        return FileManager().fileExists(atPath: path)
    }
    
    //MARK:- WRITING
    @discardableResult class func write (toFileWithName name : String, content: String, encoding: String.Encoding = String.Encoding.utf8) -> Bool  {
        
       
        let os = OutputStream(toFileAtPath: name, append: true )
        
        os?.open()
        
        
        if os?.write(content, maxLength: content.lengthOfBytes(using: String.Encoding.utf8)) == -1 {
            return false
        }
        
        os?.close()
        return true 
        
    }
}
