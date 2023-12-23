//
//  FacilityView.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-22.
//

import SwiftUI

struct FacilityView: View {
    var body: some View {
      VStack {
        VStack(spacing: 0) {
          FacilityRow(iconName: "happyEmoji", title: "Удобства", subtitle: "Самое необходимое")
          Divider()
          FacilityRow(iconName: "includedEmoji", title: "Что включено", subtitle: "Самое необходимое")
          Divider()
          FacilityRow(iconName: "notIncludedEmoji", title: "Что не включено", subtitle: "Самое необходимое")
        }
        .background(Color.primaryGreyColor)
        .cornerRadius(10)
      }
        .padding(16)
        .background(.white)
    }
}

struct FacilityRow: View {
    let iconName: String
    let title: String
    let subtitle: String

    var body: some View {
        HStack {
            Image(iconName)
                .foregroundColor(.gray)
                .frame(width: 24, height: 24)
            VStack(alignment: .leading) {
                Text(title)
                .font(.system(size: 16, weight: .medium))

                Text(subtitle)
                .foregroundColor(Color.foregroundGrayColor)
                .font(.system(size: 14, weight: .medium))

            }
            Spacer()
            Image(systemName: "chevron.right")
            .foregroundColor(.black)
        }
        .padding(15)
    }
}
