//
//  AirlinerDetailViewModel.swift
//  TheAirliners
//
//  Created by Doan Le Thieu on 3/26/20.
//  Copyright © 2020 Doan Le Thieu. All rights reserved.
//

import SwiftUI

struct AirlinerDetailViewModel {
    let airliner: Airliner
    
    var detailRowViewModels: [DetailRowViewModel] {
        [
            .init(title: "National Origin", description: airliner.nationalOrigin),
            .init(title: "Manufacturer", description: airliner.manufacturer),
            .init(title: "First Flight", description: airliner.firstFlight),
            .init(title: "Produced", description: airliner.productionPeriod),
            .init(title: "Number Built", description: airliner.numberBuilt.toDecimalString),
            .init(title: "Status", description: airliner.status)
        ]
    }
}

extension AirlinerDetailViewModel {
    var mediaFile: String {
        airliner.mediaFile
    }
    
    var description: String {
        airliner.description
    }
}

fileprivate extension Int {
    var toDecimalString: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(integerLiteral: self))!
    }
}
