//
//  TimeStatusColors.swift
//  sofascore
//
//  Created by akademija on 20.03.2026..
//

import UIKit
import SofaAcademic

func minuteColor(status: EventStatus) -> UIColor {
    if(status == EventStatus.halftime || status == EventStatus.inProgress){
        return Colors.liveColor
    }
    return Colors.notLiveColor
}

func minute(startTimestamp: Int, status: EventStatus) -> String {
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

func matchStart(startTimestamp: Int) -> String {
    let date = Date(timeIntervalSince1970: TimeInterval(startTimestamp))
    
    let format = DateFormatter()
    format.dateFormat = "HH:mm"
    
    let start = format.string(from: date)
    
    return "\(start)"
}
