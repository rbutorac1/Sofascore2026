//
//  Match.swift
//  sofascore
//
//  Created by akademija on 15.03.2026..
//

import UIKit

private enum Numbers {
    
    static let matchDuration = 90
    static let secondsInMinute = 60
}

struct Match {
    
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
        
        let minute = Int((Int(diff) + 59) / Numbers.secondsInMinute)
        
        if minute > Numbers.matchDuration {
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
        
        let minute = Int((Int(diff) + 59) / Numbers.secondsInMinute)
        
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
    
    var minuteColor: UIColor {
        if ((1...Numbers.matchDuration).contains(minuteInt)){
            return Colors.liveColor
        }
        else if minuteInt > Numbers.matchDuration {
            return Colors.FinishedColor
        }
        return Colors.notLiveColor
    }
        
    var HTNameColor: UIColor {
        if minuteInt > Numbers.matchDuration {
            if HTGoals > ATGoals {
                return Colors.teamWinColor
            }
            else if HTGoals < ATGoals {
                return Colors.teamLossColor
            }
            return Colors.teamDrawColor
        }
        return Colors.teamColor
    }
    
    var ATNameColor: UIColor {
        if minuteInt > Numbers.matchDuration {
            if ATGoals > HTGoals {
                return Colors.teamWinColor
            }
            else if ATGoals < HTGoals {
                return Colors.teamLossColor
            }
            return Colors.teamDrawColor
        }
        return Colors.teamColor
    }
    
    var HTScoreColor: UIColor {
        if (1...Numbers.matchDuration).contains(minuteInt){
            return Colors.liveColor
        }
        return HTNameColor
    }
    
    var ATScoreColor: UIColor {
        if (1...Numbers.matchDuration).contains(minuteInt){
            return Colors.liveColor
        }
        return ATNameColor
    }
}
