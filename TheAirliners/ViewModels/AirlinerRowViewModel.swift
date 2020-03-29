//
//  AirlinerViewModel.swift
//  TheAirliners
//
//  Created by Doan Le Thieu on 3/25/20.
//  Copyright © 2020 Doan Le Thieu. All rights reserved.
//

import SwiftUI

struct AirlinerRowViewModel: Identifiable {
    let airliner: Airliner
    
    var id: Int {
        airliner.id
    }
}

extension AirlinerRowViewModel {
    var model: String {
        airliner.boeingModel
    }
    
    var shortInfo: String {
        airliner.shortInfo
    }
    
    var mediaFile: String {
        airliner.mediaFile
    }
}

fileprivate extension Airliner {
    var boeingModel: String {
        "The Boeing \(lineNumber)"
    }
}
