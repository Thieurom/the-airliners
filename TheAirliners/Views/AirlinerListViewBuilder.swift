//
//  AirlinerListViewBuilder.swift
//  TheAirliners
//
//  Created by Doan Le Thieu on 3/26/20.
//  Copyright © 2020 Doan Le Thieu. All rights reserved.
//

import SwiftUI

enum AirlinerListViewBuilder {
    static func makeAirlinerDetailView(viewModel: AirlinerDetailViewModel) -> some View {
        AirlinerDetailView(viewModel: viewModel)
    }
}
