//
//  TeamSectionColor.swift
//  sofascore
//
//  Created by akademija on 20.03.2026..
//

import UIKit
import SofaAcademic

func teamColor(homeGoals: Int?, awayGoals: Int?, status: EventStatus) -> (UIColor, UIColor) {
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
