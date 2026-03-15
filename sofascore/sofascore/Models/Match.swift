//
//  Match.swift
//  sofascore
//
//  Created by akademija on 15.03.2026..
//

import UIKit

struct Match{
    let matchStartTimestamp: Int
    let HTLogo: UIImage?
    let ATLogo: UIImage?
    let HTName: String
    let ATName: String
    var HTGoals: Int
    var ATGoals: Int
    
    var matchStart: String {
        let date = Date(timeIntervalSince1970: TimeInterval(matchStartTimestamp))
        
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        
        let start = format.string(from: date)
        
        return "\(start)"
    }
    
    var minute: String {
        let start = Date(timeIntervalSince1970: TimeInterval(matchStartTimestamp))
        let now = Date()
        
        let diff = now.timeIntervalSince(start)
        
        let minute = Int((diff + 59) / 60)
        
        if minute > 90 {
            return "FT"
        }
        else if minute <= 0 {
            return "-"
        }
        
        return "\(minute)'"
    }
    
    var minuteInt: Int {
        let start = Date(timeIntervalSince1970: TimeInterval(matchStartTimestamp))
        let now = Date()
        
        let diff = now.timeIntervalSince(start)
        
        let minute = Int((diff + 59) / 60)
        
        return minute
    }
    
    var HTGString: String {
        if minute == "-" {
            return ""
        }
        return "\(HTGoals)"
    }
    
    var ATGString: String {
        if minute == "-" {
            return ""
        }
        return "\(ATGoals)"
    }
    
    var colors: Colors = Colors()
    
    var minuteColor: UIColor {
        if ((1...90).contains(minuteInt)){
            return colors.liveColor
        }
        else if minuteInt > 90 {
            return colors.FinishedColor
        }
        return colors.notLiveColor
    }
        
    var HTNameColor: UIColor {
        if minuteInt > 90 {
            if HTGoals > ATGoals {
                return colors.teamWinColor
            }
            else if HTGoals < ATGoals {
                return colors.teamLossColor
            }
            return colors.teamDrawColor
        }
        return colors.teamColor
    }
    
    var ATNameColor: UIColor {
        if minuteInt > 90 {
            if ATGoals > HTGoals {
                return colors.teamWinColor
            }
            else if ATGoals < HTGoals {
                return colors.teamLossColor
            }
            return colors.teamDrawColor
        }
        return colors.teamColor
    }
    
    var HTScoreColor: UIColor {
        if (1...90).contains(minuteInt){
            return colors.liveColor
        }
        return HTNameColor
    }
    
    var ATScoreColor: UIColor {
        if (1...90).contains(minuteInt){
            return colors.liveColor
        }
        return ATNameColor
    }
}
