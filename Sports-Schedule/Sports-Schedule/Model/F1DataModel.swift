//
//  F1Schedule.swift
//  Sports-Schedule
//
//  Created by James Denny Wiryo on 18/6/21.
//

import Foundation

struct F1Data: Codable {
    var MRData: RaceTable
}

struct RaceTable: Codable {
    var RaceTable: Races
}

struct Races: Codable {
    var Races: [Race]
}

struct Race: Codable {
    
    var raceName: String
    var round: String
    var date: String
    var time: String
}
