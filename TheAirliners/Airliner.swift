//
//  Airliner.swift
//  TheAirliners
//
//  Created by Doan Le Thieu on 3/11/20.
//  Copyright © 2020 Doan Le Thieu. All rights reserved.
//

import Foundation

struct Airliner: Codable, Identifiable {
    var id: Int
    var lineNumber: Int
    var shortInfo: String
    var description: String
    var nationalOrigin: String
    var manufacturer: String
    var firstFlight: String
    var firstProduction: Year
    var lastProduction: Year?
    var numberBuilt: Int
    var status: String
    var mediaFile: String
}

extension Airliner {
    var productionPeriod: String {
        let last = lastProduction == nil ? "present" : "\(lastProduction!)"
        return "\(firstProduction)" + "-" + last
    }
}

extension Airliner {
    #if DEBUG
    static let example = Airliner(id: -1, lineNumber: 999, shortInfo: "Short Info", description: "Description", nationalOrigin: "United States", manufacturer: "Boeing Commercial Airplanes", firstFlight: "", firstProduction: 19, lastProduction: nil, numberBuilt: 1, status: "In Service", mediaFile: "example.jpg")
    #endif
}

typealias Year = Int
