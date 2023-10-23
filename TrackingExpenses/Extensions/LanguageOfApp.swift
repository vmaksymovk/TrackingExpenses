//
//  LanguageOfApp.swift
//  TrackingExpenses
//
//  Created by Влад on 10/23/23.
//

import Foundation


enum Language: String, CaseIterable, Identifiable {
    case English, Polish, Ukrainian, Russian
    var id: Self {
        self
    }
}
