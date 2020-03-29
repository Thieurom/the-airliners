//
//  AirlinerListViewModel.swift
//  TheAirliners
//
//  Created by Doan Le Thieu on 3/25/20.
//  Copyright © 2020 Doan Le Thieu. All rights reserved.
//

import SwiftUI
import class Combine.AnyCancellable

class AirlinerListViewModel: ObservableObject {
    @Published var rowViewModels: [AirlinerRowViewModel] = []
    private var subscriptions = Set<AnyCancellable>()
    
    func fetchAirliners() {
        let airliners: [Airliner] = Bundle.main.decode(from: "airliners.json")
            
        airliners.publisher
            .map(AirlinerRowViewModel.init(airliner:))
            .collect()
            .assign(to: \.rowViewModels, on: self)
            .store(in: &subscriptions)
    }
}

extension AirlinerListViewModel {
    func detailView(rowViewModel: AirlinerRowViewModel) -> some View {
        let viewModel = AirlinerDetailViewModel(airliner: rowViewModel.airliner)
        return AirlinerListViewBuilder.makeAirlinerDetailView(viewModel: viewModel)
    }
}
