//
//  AddTouristView.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-26.
//

import SwiftUI

struct AddTouristView: View {
    var title: String
    var addAction: () -> Void

    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 22, weight: .medium))

            Spacer()

            Button(action: addAction) {
              Image("plusIcon")
            }
        }
        .padding(.horizontal, 16)
    }
}
