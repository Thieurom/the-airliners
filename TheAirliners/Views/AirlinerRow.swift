//
//  AirlinerRow.swift
//  TheAirliners
//
//  Created by Doan Le Thieu on 3/8/20.
//  Copyright © 2020 Doan Le Thieu. All rights reserved.
//

import SwiftUI

struct AirlinerRow: View {
    private let viewModel: AirlinerRowViewModel
    
    init(viewModel: AirlinerRowViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        HStack(spacing: 14) {
            VStack(alignment: .leading, spacing: 6) {
                Text(viewModel.model)
                    .font(.caption)
                    .foregroundColor(.primary)

                Text(viewModel.shortInfo)
                    .lineLimit(2)
                    .font(.body2)
                    .foregroundColor(.primary)
            }
            
            Spacer()
            
            Image(viewModel.mediaFile)
                .resizable()
                .frame(width: 64, height: 64)
                .cornerRadius(8)
                .scaledToFill()
        }
        .padding(14)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.shadowed, radius: 5, x: 0, y: 3)
    }
}

struct AirlinerRow_Previews: PreviewProvider {
    static var previews: some View {
        AirlinerRow(viewModel: AirlinerRowViewModel(airliner: Airliner.example))
    }
}
