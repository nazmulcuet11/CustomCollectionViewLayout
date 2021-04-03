//
//  Session+DummyData.swift
//  CustomCollectionViewLayout
//
//  Created by Nazmul Islam on 3/4/21.
//

import Foundation

extension Session {
    fileprivate convenience init?(dictionary: NSDictionary) {
        guard let title = dictionary["Title"] as? String,
              let speaker = dictionary["Speaker"] as? String,
              let room = dictionary["Room"] as? String,
              let time = dictionary["Time"] as? String
        else {
            return nil
        }

        self.init(
            title: title,
            speaker: speaker,
            room: room,
            time: time
        )
    }
    
    class func getDummySessions() -> [Session] {

        guard let url = Bundle.main.url(forResource: "Sessions", withExtension: "plist") else {
            return []
        }
        guard let sessionsFromPlist = NSArray(contentsOf: url) else {
            return []
        }

        let sessionDictionaries = sessionsFromPlist.compactMap({ $0 as? NSDictionary })
        var sessions = [Session]()

        for dictionary in sessionDictionaries {
            if let session = Session(dictionary: dictionary) {
                sessions.append(session)
            }
        }
        return sessions
    }
}
