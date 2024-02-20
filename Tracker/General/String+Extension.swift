//
//  String+Extension.swift
//  Tracker
//
//  Created by Дмитрий Герасимов on 20.02.2024.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
