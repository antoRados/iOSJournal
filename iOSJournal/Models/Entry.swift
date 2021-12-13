//
//  Entry.swift
//  iOSJournal
//
//  Created by Anto Rados on 11/24/21.
//

import UIKit

class Entry: Codable {
    var title: String
    var body: String
    var timeStamp: Date
    
    init(title: String, body: String, timeStamp: Date = Date()) {
        self.title = title
        self.body = body
        self.timeStamp = timeStamp
    }
} //End of "Entry" class


extension Entry: Equatable {
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.title == rhs.title && lhs.body == rhs.body
    }
} //End of "Equatable" protocol
