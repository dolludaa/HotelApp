//
//  HotelSelectionCoordinatorView.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-26.
//

import SwiftUI

struct HotelSelectionCoordinatorView: View {

  var startPage = Page.hotel
  @State private var coordinator = HotelSelectionCoordinator()

  var body: some View {
    NavigationStack(path: $coordinator.path) {
      coordinator.build(page: startPage)
        .navigationDestination(for: Page.self) { page in
          coordinator.build(page: page)
        }
    }
    .environment(coordinator)
  }
}

#Preview {
  HotelSelectionCoordinatorView()
}
