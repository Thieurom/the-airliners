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
    
    let airliner: Airliner

    var body: some View {
        List {
            Section {
                VStack {
                    Image(airliner.mediaFile)
                        .resizable()
                        .frame(height: 280)
                        .scaledToFit()
                    Spacer()
                }
            }
            .listRowInsets(EdgeInsets())

            Section {
                Text(airliner.description)
                    .font(.body1)
                    .foregroundColor(.secondary)
                    .listRowInsets(EdgeInsets(top: 8, leading: 22, bottom: 0, trailing: 22))
            }

            Section {
                Text("Information")
                    .font(.headline)
                    .foregroundColor(.primary)
                    .listRowInsets(EdgeInsets(top: 14, leading: 22, bottom: 8, trailing: 22))

                ForEach(0..<self.airliner.detailInformation.count) {
                    DetailRow(title: self.airliner.detailInformation[$0].name, description: self.airliner.detailInformation[$0].detail)
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

extension AirlinerDetailView {
    struct DetailRow: View {
        let title: String
        let description: String

        var body: some View {
            ZStack {
                HStack {
                    Text(title)
                        .lineLimit(1)
                        .font(.subtitle)
                        .foregroundColor(.primary)

                    Spacer()

                    Text(description)
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
}

fileprivate extension Airliner {
    var detailInformation: [(name: String, detail: String)] {
        [
            ("National Origin", nationalOrigin),
            ("Manufacturer", manufacturer),
            ("First Flight", firstFlight),
            ("Produced", productionPeriod),
            ("Number Built", numberBuilt.toDecimalString),
            ("Status", status)
        ]
    }
}

fileprivate extension Int {
    var toDecimalString: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(integerLiteral: self))!
    }
}

struct AirlinerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AirlinerDetailView(airliner: Airliner.example)
    }
}
