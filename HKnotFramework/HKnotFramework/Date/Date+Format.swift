//
//  Date+Format.swift
//  Drop
//
//  Created by hushaohua on 2018/2/12.
//  Copyright © 2018年 init. All rights reserved.
//

import Foundation

public extension Date{
    //if same year then MM-dd
    //else yyyy-MM-dd
    func defaultDateString() -> String {
        let dateFormatter = DateFormatter();
        if (Calendar.current.isDate(self, equalTo: Date(), toGranularity: .year)){
            dateFormatter.dateFormat = "MM-dd";
        }else{
            dateFormatter.dateFormat = "yyyy-MM-dd";
        }
        return dateFormatter.string(from: self);
    }
    
    func minuteTimeString() -> String{
        let dayFormatter:DateFormatter = DateFormatter();
        dayFormatter.dateFormat = "HH:mm";
        return dayFormatter.string(from: self);
    }
    
    func timeString() -> String{
        let dayFormatter:DateFormatter = DateFormatter();
        dayFormatter.dateFormat = "HH:mm:ss";
        return dayFormatter.string(from: self);
    }
    
    func fullDateString() -> String{
        let dateFormatter = DateFormatter();
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss";
        return dateFormatter.string(from: self);
    }
    
    func shortDate() -> Date{
        return Calendar.current.startOfDay(for: self);
    }
}

extension NSDate{
    func shortDate() -> NSDate{
        return NSCalendar.current.startOfDay(for: self as Date) as NSDate;
//        return Calendar.current.startOfDay(for: self as Date);
    }
}
