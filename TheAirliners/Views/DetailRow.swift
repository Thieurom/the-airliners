//
//  DetailRow.swift
//  TheAirliners
//
//  Created by Doan Le Thieu on 3/26/20.
//  Copyright © 2020 Doan Le Thieu. All rights reserved.
//

import SwiftUI

struct DetailRow: View {
    private let viewModel: DetailRowViewModel
    
    init(viewModel: DetailRowViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ZStack {
            HStack {
                Text(viewModel.title)
                    .lineLimit(1)
                    .font(.subtitle)
                    .foregroundColor(.primary)

                Spacer()

                Text(viewModel.description)
                    .lineLimit(1)
                    .font(.body2)
                    .foregroundColor(.secondary)
            }

            VStack {
                Spacer()
                Divider()
                    .background(Color.divider)
            }
        }
    }
}
