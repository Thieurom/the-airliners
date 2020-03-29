//
//  ContentView.swift
//  TheAirliners
//
//  Created by Doan Le Thieu on 12/31/19.
//  Copyright © 2019 Doan Le Thieu. All rights reserved.
//

import SwiftUI

struct AirlinerListView: View {
    @ObservedObject var viewModel: AirlinerListViewModel
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                List {
                    ForEach(self.viewModel.rowViewModels) { rowViewModel in
                        // Use ZStack here to remove the default row's disclosure indicator
                        ZStack {
                            AirlinerRow(viewModel: rowViewModel)
                            NavigationLink(destination: self.viewModel.detailView(rowViewModel: rowViewModel)) {
                                EmptyView()
                            }
                        }
                        .listRowInsets(EdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 12))
                        .listRowBackground(Color(red: 249.0/255, green: 249.0/255, blue: 249.0/255))
                    }
                }
                .navigationBarItems(leading:
                    Image("NavTitle")
                        .offset(x: (geometry.size.width - 148) / 2 - 18, y: 0)
                )
                .navigationBarTitle(Text(""), displayMode: .inline)
                .onAppear {
                    // Remove the separator lines between rows
                    UITableView.appearance().separatorStyle = .none
                    // Remove the row's highlight when being selected
                    UITableViewCell.appearance().selectionStyle = .none
                }
            }
        }
    }
}

struct AirlinerListView_Previews: PreviewProvider {
    static var previews: some View {
        AirlinerListView(viewModel: AirlinerListViewModel())
    }
}
