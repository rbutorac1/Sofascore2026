//
//  MatchHelper.swift
//  sofascore
//
//  Created by akademija on 23.03.2026..
//

import UIKit
import SofaAcademic

enum Helper { }

// Colors
extension Helper {
    static func goalsColor(homeGoals: Int?, awayGoals: Int?, status: EventStatus) -> (UIColor?, UIColor?) {
        if status == EventStatus.notStarted { return (nil, nil) }
        if (status == EventStatus.inProgress || status == EventStatus.halftime){ return (Colors.liveColor, Colors.liveColor) }
        
        var homeColor: UIColor
        var awayColor: UIColor
        
        let score = homeGoals! - awayGoals!
        if score > 0 {
            homeColor = Colors.teamWinColor
            awayColor = Colors.teamLossColor
        }
        else if score < 0 {
            homeColor = Colors.teamLossColor
            awayColor = Colors.teamLossColor
        }
        else {
            homeColor = Colors.teamDrawColor
            awayColor = Colors.teamDrawColor
        }
        
        return (homeColor, awayColor)
    }
    
    static func teamColor(homeGoals: Int?, awayGoals: Int?, status: EventStatus) -> (UIColor, UIColor) {
        var homeColor: UIColor = Colors.teamColor
        var awayColor: UIColor = Colors.teamColor
        
        if status != EventStatus.finished { return (homeColor, awayColor) }
        
        else {
            let score = homeGoals! - awayGoals!
            if score > 0 {
                homeColor = Colors.teamWinColor
                awayColor = Colors.teamLossColor
            } else if score < 0 {
                homeColor = Colors.teamLossColor
                awayColor = Colors.teamWinColor
            } else {
                homeColor = Colors.teamDrawColor
                awayColor = Colors.teamDrawColor
            }
            
            return (homeColor, awayColor)
        }
    }
    
    static func minuteColor(status: EventStatus) -> UIColor {
        if(status == EventStatus.halftime || status == EventStatus.inProgress){
            return Colors.liveColor
        }
        return Colors.notLiveColor
    }
}

// Text
extension Helper {
    static func goalsString(homeGoals: Int?, awayGoals: Int?) -> (String, String) {
        var homeString: String =  ""
        var awayString: String =  ""
        
        guard let homeGoals = homeGoals else {
            return (homeString, awayString)
        }
        guard let awayGoals = awayGoals else {
            return (homeString, awayString)
        }
        
        homeString = "\(homeGoals)"
        awayString = "\(awayGoals)"
        
        return (homeString, awayString)
    }
    
    static func minute(startTimestamp: Int, status: EventStatus) -> String {
        if status == EventStatus.notStarted {
            return "-"
        }
        else if status == EventStatus.halftime {
            return "HT"
        }
        else if status == EventStatus.finished {
            return "FT"
        }
        else {
            let start = Date(timeIntervalSince1970: TimeInterval(startTimestamp))
            let now = Date()
            
            let diff = now.timeIntervalSince(start)
            
            let minute = Int((Int(diff) + 59) / 60)
            
            return "\(minute)'"
        }
    }
    
    static func matchStart(startTimestamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(startTimestamp))
        
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        
        let start = format.string(from: date)
        
        return "\(start)"
    }
}
