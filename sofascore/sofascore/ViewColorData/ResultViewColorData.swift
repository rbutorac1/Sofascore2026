//
//  ResultViewColorData.swift
//  sofascore
//
//  Created by akademija on 20.03.2026..
//

import UIKit
import SofaAcademic

func goalsString(homeGoals: Int?, awayGoals: Int?) -> (String, String) {
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

func goalsColor(homeGoals: Int?, awayGoals: Int?, status: EventStatus) -> (UIColor?, UIColor?) {
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
