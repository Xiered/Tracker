//
//  Tracker.swift
//  Tracker
//
//  Created by Дмитрий Герасимов on 17.01.2024.
//

import UIKit

struct Tracker { // Entity for storing information about the tracker
    let id: UUID
    let name: String
    let color: UIColor
    let emoji: String
    let schedule: [Int]
}
