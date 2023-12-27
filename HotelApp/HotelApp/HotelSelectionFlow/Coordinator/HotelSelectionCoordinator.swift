import SwiftUI

enum Page: Identifiable, Hashable {
  case hotel
  case room(title: String)
  case booking
  case orderConfirmation

  var id: String {
    switch self {
    case .hotel:
      "hotel"
    case .room(let title):
      "room \(title)"
    case .booking:
      "booking"
    case .orderConfirmation:
      "orderConfirmation"
    }
  }
}

@Observable
class HotelSelectionCoordinator {

    var path = NavigationPath()

    func push(_ page: Page) {
        path.append(page)
    }

    func pop() {
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }

    @ViewBuilder
    func build(page: Page) -> some View {
      switch page {
      case .hotel:
        HotelView(viewModel: HotelViewModel())
          .navigationTitle("Отель")
      case .room(let title):
        RoomsView(viewModel: RoomViewModel())
          .navigationTitle(title)
      case .booking:
        BookingView(viewModel: ReservationViewModel(httpService: HTTPService()))
          .navigationTitle("Бронирование")
      case .orderConfirmation:
        OrderConfirmationView()
          .navigationTitle("Заказ оплачен")
          .navigationBarBackButtonHidden(false)
      }
    }
}
