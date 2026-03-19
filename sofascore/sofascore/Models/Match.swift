//
//  Match.swift
//  sofascore
//
//  Created by akademija on 19.03.2026..
//

import UIKit
import SofaAcademic
import SDWebImage

struct Match {
    
    private enum Constants {
        
        static let secondsInMinute = 60
    }
    
    let matchStart: String
    let minute: String
    let HTLogoURL: String?
    let ATLogoURL: String?
    let HTName: String
    let ATName: String
    let HTGoals: Int?
    let ATGoals: Int?
    let HTGoalsString: String
    let ATGoalsString: String
    let minuteColor: UIColor
    let HTNameColor: UIColor
    let ATNameColor: UIColor
    let HTScoreColor: UIColor?
    let ATScoreColor: UIColor?
    
    init(event: Event){
        self.matchStart = Match.matchStartString(startTimestamp: event.startTimestamp)
        self.minute = Match.minuteString(startTimestamp: event.startTimestamp, status: event.status)
        self.HTLogoURL = event.homeTeam.logoUrl
        self.ATLogoURL = event.awayTeam.logoUrl
        self.HTName = event.homeTeam.name
        self.ATName = event.awayTeam.name
        self.HTGoals = event.homeScore
        self.ATGoals = event.awayScore
        self.HTGoalsString = Match.HTGStringFunc(homeGoals: event.homeScore)
        self.ATGoalsString = Match.ATGStringFunc(awayGoals: event.awayScore)
        self.minuteColor = Match.minuteColorFunc(status: event.status)
        self.HTScoreColor = Match.HTScoreColorFunc(homeGoals: HTGoals, awayGoals: ATGoals, status: event.status)
        self.ATScoreColor = Match.ATScoreColorFunc(homeGoals: HTGoals, awayGoals: ATGoals, status: event.status)
        self.HTNameColor = Match.HTNameColorFunc(homeGoals: HTGoals, awayGoals: ATGoals, status: event.status)
        self.ATNameColor = Match.ATNameColorFunc(homeGoals: HTGoals, awayGoals: ATGoals, status: event.status)
    }
    
    private static func matchStartString(startTimestamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(startTimestamp))
        
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        
        let start = format.string(from: date)
        
        return "\(start)"
    }
    
    private static func minuteString(startTimestamp: Int, status: EventStatus) -> String {
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
            
            let minute = Int((Int(diff) + 59) / Constants.secondsInMinute)
            
            return "\(minute)'"
        }
    }
    
    private static func minuteColorFunc(status: EventStatus) -> UIColor {
        switch status {
        case EventStatus.inProgress, EventStatus.halftime: return Colors.liveColor
        case EventStatus.finished: return Colors.FinishedColor
        default: return Colors.notLiveColor
        }
    }
        
    private static func HTScoreColorFunc(homeGoals: Int?, awayGoals: Int?, status: EventStatus) -> UIColor? {
        if status == EventStatus.notStarted { return nil }
        else if (status == EventStatus.inProgress || status == EventStatus.halftime){ return Colors.liveColor }
        else {
            let score = homeGoals! - awayGoals!
            switch score {
            case 1...1000: return Colors.teamWinColor
            case (-1000)...(-1): return Colors.teamLossColor
            default: return Colors.teamDrawColor
            }
        }
    }
    
    private static func ATScoreColorFunc(homeGoals: Int?, awayGoals: Int?, status: EventStatus) -> UIColor? {
        if status == EventStatus.notStarted { return nil }
        else if (status == EventStatus.inProgress || status == EventStatus.halftime){ return Colors.liveColor }
        else {
            let score = awayGoals! - homeGoals!
            switch score {
            case 1...1000: return Colors.teamWinColor
            case (-1000)...(-1): return Colors.teamLossColor
            default: return Colors.teamDrawColor
            }
        }
    }
    
    private static func HTGStringFunc(homeGoals: Int?) -> String {
        guard let homeGoals = homeGoals else {
            return ""
        }
        return "\(homeGoals)"
    }
    
    private static func ATGStringFunc(awayGoals: Int?) -> String {
        guard let awayGoals = awayGoals else {
            return ""
        }
        return "\(awayGoals)"
    }
    
    private static func HTNameColorFunc(homeGoals: Int?, awayGoals: Int?, status: EventStatus) -> UIColor {
        if status != EventStatus.finished { return Colors.teamColor }
        else {
            let score = homeGoals! - awayGoals!
            if score > 0 {
                return Colors.teamWinColor
            } else if score < 0 {
                return Colors.teamLossColor
            } else {
                return Colors.teamDrawColor
            }
        }
    }
    
    private static func ATNameColorFunc(homeGoals: Int?, awayGoals: Int?, status: EventStatus) -> UIColor {
        if status != EventStatus.finished { return Colors.teamColor }
        else {
            let score = awayGoals! - homeGoals!
            if score > 0 {
                return Colors.teamWinColor
            } else if score < 0 {
                return Colors.teamLossColor
            } else {
                return Colors.teamDrawColor
            }
        }
    }
}
