//
//  TrackerRecord.swift
//  Tracker
//
//  Created by Дмитрий Герасимов on 17.01.2024.
//

import UIKit

struct TrackerRecord { // Entity for recording trackers
    let id: UUID
    let date: String
}

extension TrackerRecord: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
