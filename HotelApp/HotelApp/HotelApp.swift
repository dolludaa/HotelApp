//
//  HotelAppApp.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-20.
//

import SwiftUI

@main
struct HotelApp: App {

    var body: some Scene {
        WindowGroup {
          HotelSelectionCoordinatorView()
            .onAppear {
                                UINavigationBar.appearance().tintColor = UIColor.systemGreen
                            }
        }
    }
}
