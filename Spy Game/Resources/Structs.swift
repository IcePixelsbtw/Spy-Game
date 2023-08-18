//
//  Structs.swift
//  Spy Game
//
//  Created by Anton on 17.08.2023.
//

import Foundation

struct SettingRow {
    let label: String
    let currentValue: String?
    let iconName: String
    let handler: () -> Void
}

struct SettingsForUserDefaults {
    var playersCount: Int
    var spyCount: Int
    var timerMinutes: Int
    
}

public enum KeysForUserDefaults: String, CaseIterable {
    case playersCount
    case spyCount
    case timerMinutes
}
