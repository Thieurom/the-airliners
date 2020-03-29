//
//  AirlinerDetailView.swift
//  TheAirliners
//
//  Created by Doan Le Thieu on 1/11/20.
//  Copyright © 2020 Doan Le Thieu. All rights reserved.
//

import SwiftUI

struct AirlinerDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    private let viewModel: AirlinerDetailViewModel
    
    init(viewModel: AirlinerDetailViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        List {
            Section {
                VStack {
                    Image(viewModel.mediaFile)
                        .resizable()
                        .frame(height: 280)
                        .scaledToFit()
                    Spacer()
                }
            }
            .listRowInsets(EdgeInsets())

            Section {
                Text(viewModel.description)
                    .font(.body1)
                    .foregroundColor(.secondary)
                    .listRowInsets(EdgeInsets(top: 8, leading: 22, bottom: 0, trailing: 22))
            }

            Section {
                Text("Information")
                    .font(.headline)
                    .foregroundColor(.primary)
                    .listRowInsets(EdgeInsets(top: 14, leading: 22, bottom: 8, trailing: 22))

                ForEach(viewModel.detailRowViewModels, id: \.title) {
                    DetailRow(viewModel: $0)
                        .frame(height: 51)
                        .listRowInsets(EdgeInsets(top: 0, leading: 22, bottom: 0, trailing: 22))
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarTitle(Text(""), displayMode: .large)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image("BackButton")
                    .renderingMode(.original)
            }
        )
    }
}

struct AirlinerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AirlinerDetailView(viewModel: AirlinerDetailViewModel(airliner: Airliner.example))
    }
}
