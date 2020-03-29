//
//  Helper.swift
//  TheAirliners
//
//  Created by Doan Le Thieu on 3/11/20.
//  Copyright © 2020 Doan Le Thieu. All rights reserved.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}
