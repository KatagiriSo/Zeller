//
//  Zeller.swift
//  ZellersCongreunce
//
//  Created by 片桐奏羽 on 2015/05/07.
//  Copyright (c) 2015年 So Katagiri
//  This software is released under the MIT License, see LICENSE.txt.
//

import Foundation

enum DayOfWeek : Int
{
    case Saturday = 0
    case Sunday = 1
    case Monday = 2
    case Tuesday = 3
    case Wednesday = 4
    case Thursday = 5
    case Friday = 6
    
    

}

struct DateTime {
    var zeroBasedCentury : Int;
    var yearOfCentury : Int;
    var month : Int;
    var dayOfMonth : Int;
    
    init(year:Int, month:Int, day:Int)
    {
        var y = year, m = month, d = day;

        if (m == 1 || m == 2) {
            y--;
            m += 12;
        }
        
        self.zeroBasedCentury = y / 100;
        self.yearOfCentury = y % 100;
        self.month = m;
        self.dayOfMonth = d;
    }
    
    internal func dayOfWeek() -> DayOfWeek {
        //zeller
        var XX : Int = 26 * (month + 1) / 10;
        var Y : Int = yearOfCentury;
        var C : Int = zeroBasedCentury;
        var YdividedBy4 : Int = Y/4;
        var CdividedBy4 : Int = C/4;
        
        // Gregorian
        var Gamma : Int = -2 * C + CdividedBy4;
        
        var h  = (dayOfMonth + XX + Y + YdividedBy4 + Gamma) % 7;
        return DayOfWeek(rawValue: h)!;
    }
    
}