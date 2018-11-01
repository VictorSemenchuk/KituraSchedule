//
//  Date+Format.swift
//  HouseKeeper
//
//  Created by Dmitriy Tarelkin on 16/9/18.
//  Copyright © 2018 Nataliya Murauyova. All rights reserved.
//

import Foundation

extension Date {
    
    /**
     Return day, month, year, weekday in specified formatted string
    */
    
    public func dateComponents() -> (day: String, month: String, year: String, weekDay: String, longStyleDate: String, shortStyleTime: String) {
        var dayMonthYear:(day:String, month:String, year: String, weekDay: String, longStyleDate: String, shortStyleTime: String)
        let dateFormatter = DateFormatter()
        //day
        dateFormatter.dateFormat = "d"
        dayMonthYear.day = dateFormatter.string(from: self)
        
        //week day
        dateFormatter.dateFormat = "EEEE"
        dayMonthYear.weekDay = dateFormatter.string(from: self)
        
        //month
        dateFormatter.dateFormat = "MMM"
        dayMonthYear.month = dateFormatter.string(from: self)
        
        //year
        dateFormatter.dateFormat = "YYY"
        dayMonthYear.year = dateFormatter.string(from: self)
        
        dateFormatter.dateStyle = .long
        dateFormatter.dateFormat = "MM.dd.EEEE HH:mm"
        dayMonthYear.longStyleDate = dateFormatter.string(from: self)
        
        dateFormatter.dateStyle = .long
        dateFormatter.dateFormat = "HH:mm"
        dayMonthYear.shortStyleTime = dateFormatter.string(from: self)
        
        return dayMonthYear
    }
    
    /**
     Get date with format from string
     
     - returns:
     Optional result date
     
     - parameters:
        - format: Necessary format of date
        - string: Start string
    */
    
    static func date(with format: String, from string: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format;
        return dateFormatter.date(from: string)
    }
    
}
