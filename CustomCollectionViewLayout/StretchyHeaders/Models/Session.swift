//
//  Session.swift
//  RWDevCon
//
//  Created by Mic Pringle on 02/03/2015.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

class Session {

    var title: String
    var speaker: String
    var room: String
    var time: String

    var roomAndTime: String {
        return "\(time) • \(room)"
    }
    
    init(
        title: String,
        speaker: String,
        room: String,
        time: String
    ) {
        self.title = title
        self.speaker = speaker
        self.room = room
        self.time = time
    }
}
