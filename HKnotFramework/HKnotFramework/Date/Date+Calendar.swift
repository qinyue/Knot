//
//  Date+Calendar.swift
//  Drop
//
//  Created by hushaohua on 2018/2/13.
//  Copyright © 2018年 init. All rights reserved.
//

import Foundation

public extension Date{
    
    func startDate() -> Date{
        return Calendar.current.startOfDay(for: self);
    }
    
    static func weekBeginToEndDates(_ weekOfYear:Int, yearForWeek:Int) -> (begin:Date, end:Date){
        let calendar = Calendar.current;
        var dateComponents = DateComponents();
        dateComponents.yearForWeekOfYear = yearForWeek;
        dateComponents.weekOfYear = weekOfYear;
        dateComponents.weekday = 2;
        let begin = calendar.date(from: dateComponents);
        let nextWeek = calendar.date(byAdding: .day, value: 7, to: begin!);
        let end = Date(timeInterval: -1, since: nextWeek!);
        return (begin!, end);
    }
    
    static func dayBeginToEndDates(_ year:Int, month:Int, day:Int) -> (begin:Date, end:Date){
        let calendar = Calendar.current;
        var dateComponents = DateComponents();
        dateComponents.year = year;
        dateComponents.month = month;
        dateComponents.day = day;
        let begin = calendar.date(from: dateComponents);
        let nextDay = calendar.date(byAdding: .day, value: 1, to: begin!);
        let end = Date(timeInterval: -1, since: nextDay!);
        return (begin!, end);
    }
    
    static func monthBeginToEndDates(_ year:Int, month:Int) -> (begin:Date, end:Date){
        let calendar = Calendar.current;
        var dateComponents = DateComponents();
        dateComponents.year = year;
        dateComponents.month = month;
        let begin = calendar.date(from: dateComponents);
        let nextMonth = calendar.date(byAdding: .month, value: 1, to: begin!);
        let end = Date(timeInterval: -1, since: nextMonth!);
        return (begin!, end);
    }
    
    func startDayDate(after days:Int) -> Date?{
        let calendar = Calendar.current;
        let date = calendar.startOfDay(for: self);
        return calendar.date(byAdding: .day, value: days, to: date);
    }
    
    func firstWeekDay(after weeks:Int) -> Date?{
        var calendar = Calendar.current;
        calendar.firstWeekday = 2;
        var firstDate:Date? = nil;
        if (calendar.dateComponents([.weekday], from: self).weekday! != 2){//不是周一
            let weekDayComponent = DateComponents(weekday:calendar.firstWeekday)
            firstDate = calendar.nextDate(after: self, matching: weekDayComponent, matchingPolicy: .nextTime, repeatedTimePolicy: Calendar.RepeatedTimePolicy.first, direction: (weeks > 0 ? .forward : .backward));
        }else{
            firstDate = calendar.startOfDay(for: self);
        }
        return calendar.date(byAdding: .weekOfYear, value: weeks, to: firstDate!);
    }
    
    func firstMonthDay(after months:Int) -> Date?{
        let calendar = Calendar.current;
        var firstDate:Date? = nil;
        if (calendar.dateComponents([.day], from: self).day! != 1){
            let monthComponent = DateComponents(day:1)
            firstDate = calendar.nextDate(after: self, matching: monthComponent, matchingPolicy: .nextTime, repeatedTimePolicy: Calendar.RepeatedTimePolicy.first, direction: (months > 0 ? .forward : .backward))!;
        }else{
            firstDate = calendar.startOfDay(for: self);
        }
        return calendar.date(byAdding: .month, value: months, to: firstDate!);
    }
    
}
