//
//  Models.swift
//  sofascore
//
//  Created by akademija on 11.03.2026..
//

import UIKit

struct League{
    let logo: UIImage?
    let name: String
    let country: String
}

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
    
    let matchStartColor = UIColor.gray
    
    let notLiveColor = UIColor.gray
    let liveColor = UIColor.red
    let FinishedColor = UIColor.gray
    
    let winColor = UIColor.black
    let lossColor = UIColor.gray
    let drawColor = UIColor.gray
    
    let TeamColor = UIColor.black
    let TeamWinColor = UIColor.black
    let TeamLossColor = UIColor.gray
    let TeamDrawColor = UIColor.gray
    
    var minuteColor: UIColor {
        if ((1...90).contains(minuteInt)){
            return liveColor
        }
        else if minuteInt > 90 {
            return FinishedColor
        }
        return notLiveColor
    }
        
    var HTNameColor: UIColor {
        if minuteInt > 90 {
            if HTGoals > ATGoals {
                return TeamWinColor
            }
            else if HTGoals < ATGoals {
                return TeamLossColor
            }
            return TeamDrawColor
        }
        return TeamColor
    }
    
    var ATNameColor: UIColor {
        if minuteInt > 90 {
            if ATGoals > HTGoals {
                return TeamWinColor
            }
            else if ATGoals < HTGoals {
                return TeamLossColor
            }
            return TeamDrawColor
        }
        return TeamColor
    }
    
    var HTScoreColor: UIColor {
        if (1...90).contains(minuteInt){
            return liveColor
        }
        return HTNameColor
    }
    
    var ATScoreColor: UIColor {
        if (1...90).contains(minuteInt){
            return liveColor
        }
        return ATNameColor
    }
}
