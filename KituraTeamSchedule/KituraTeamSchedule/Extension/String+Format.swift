//
//  String+Format.swift
//  HouseKeeper
//
//  Created by Viktar Semianchuk on 9/20/18.
//  Copyright © 2018 Nataliya Murauyova. All rights reserved.
//

import Foundation

extension String {
    
    /**
     Get string with format from date
     
     - returns:
     String representaion of date
     
     - parameters:
        - format: Necessary format of date
        - string: Start date
     */
    
    static func string(with format: String, from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format;
        return dateFormatter.string(from: date);
    }
    
    /**
     Configuring string representation of start and end date.
     
     - returns:
    Event date string representation.
     
     - parameters:
        - startDate: Start Date
        - endDate: End Date
    */
    
    static func configureEventDateDescription(startDate: Date, endDate: Date) -> String {
        let startStringDate = "\(String.string(with: "EEEE, MMM d", from: startDate))"
        let endStringDate = "\(String.string(with: "EEEE, MMM d", from: endDate))"
        let startStringTime = "\(String.string(with: "HH:mm", from: startDate))"
        let endStringTime = "\(String.string(with: "HH:mm", from: endDate))"
        
        var dateString = ""
        if startStringDate != endStringDate {
            dateString = "From " + startStringDate + " " + startStringTime + " to " + endStringDate + " " + endStringTime
        } else {
            dateString = startStringDate + " from " + startStringTime + " to " + endStringTime
        }
        return dateString
    }
    
}
