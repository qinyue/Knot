//
//  DateComponent+Extend.swift
//  Drop
//
//  Created by hushaohua on 2018/6/29.
//  Copyright © 2018年 init. All rights reserved.
//

import Foundation

public extension DateComponents{
    
    func int64Value() -> Int64{
        var value:Int64 = 0;
        self.second != nil ? (value += Int64(self.second!)) : ();
        self.minute != nil ? (value += Int64(self.minute! * 100)) : ();
        self.hour != nil ? (value += Int64(self.hour! * 10000)) : ();
        self.day != nil ? (value += Int64(self.day! * 1000000)) : ();
        self.month != nil ? (value += Int64(self.month! * 100000000)) : ();
        self.year != nil ? (value += Int64(self.year! * 10000000000)) : ();
        return value;
    }
    
    func compareWith(_ otherComponents:DateComponents) -> ComparisonResult {
        let selfInt64 = self.int64Value();
        let otherInt64 = otherComponents.int64Value();
        return selfInt64 > otherInt64 ? .orderedDescending : (selfInt64 < otherInt64 ? .orderedAscending : .orderedSame);
    }
    
    static func dayDateComponentsArray(from:DateComponents, to:DateComponents, ignoreFrom:Bool = false, ignoreTo:Bool = false) -> [DateComponents]{
        let calendar:Calendar = Calendar.current;
        let fromDate = calendar.date(from: from);
        let diff = calendar.dateComponents([.day], from: from, to: to);
        var comps = [DateComponents]();
        let fromIndex = ignoreFrom ? 1 : 0;
        let endIndex = ignoreTo ? (diff.day! - 1) : (diff.day!)
        for index in fromIndex...endIndex {
            let theDate = calendar.date(byAdding: .day, value: index, to: fromDate!, wrappingComponents: false);
            let comp = calendar.dateComponents([.year, .day, .month], from: theDate!);
            comps.append(comp);
        }
        return comps;
    }
    
    static func monthDateComponentsArray(from:DateComponents, to:DateComponents, ignoreFrom:Bool = false, ignoreTo:Bool = false) -> [DateComponents]{
        let calendar:Calendar = Calendar.current;
        let fromDate = calendar.date(from: from);
        let diff = calendar.dateComponents([.month], from: from, to: to);
        var comps = [DateComponents]();
        let fromIndex = ignoreFrom ? 1 : 0;
        let endIndex = ignoreTo ? (diff.month! - 1) : (diff.month!)
        for index in fromIndex...endIndex {
            let theDate = calendar.date(byAdding: .month, value: index, to: fromDate!, wrappingComponents: false);
            let comp = calendar.dateComponents([.year, .month], from: theDate!);
            comps.append(comp);
        }
        return comps;
    }
}
