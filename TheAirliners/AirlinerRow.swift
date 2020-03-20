//
//  AirlinerRow.swift
//  TheAirliners
//
//  Created by Doan Le Thieu on 3/8/20.
//  Copyright © 2020 Doan Le Thieu. All rights reserved.
//

import SwiftUI

struct AirlinerRow: View {
    let airliner: Airliner

    var body: some View {
        HStack(spacing: 14) {
            VStack(alignment: .leading, spacing: 6) {
                Text(airliner.boeingModel)
                    .font(.caption)
                    .foregroundColor(.primary)

                Text(airliner.shortInfo)
                    .lineLimit(2)
                    .font(.body2)
                    .foregroundColor(.primary)
            }
            
            Spacer()
            
            Image(airliner.mediaFile)
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

fileprivate extension Airliner {
    var boeingModel: String {
        "The Boeing \(lineNumber)"
    }
}

struct AirlinerRow_Previews: PreviewProvider {
    static var previews: some View {
        AirlinerRow(airliner: Airliner.example)
    }
}
