require "rails_helper"

describe "AppRouting" do
  it {
    expect(root: "books", action: "index")
  }

  it {
    expect(get: "books/12/reserve").to route_to(controller: "reservations", action: "reserve", book_id: "12")
  }
  it {
    expect(get: "books/1/take").to route_to(controller: "reservations", action: "take", book_id: "1")
  }
  it {
    expect(get: "books/150/take").to route_to(controller: "reservations", action: "take", book_id: "150")
  }

  it {
    expect(get: reserve_book_path(book_id: 12)).to route_to(controller: "reservations", action: "reserve", book_id: "12")
  }
  # get 'books/:book_id/give_back', to: 'reservations#give_back', as: 'give_back_book'
  it {
    expect(get: "books/12/give_back").to route_to(controller: "reservations", action: "give_back", book_id: "12")
  }
  # get 'books/:book_id/cancel_reservation', to: 'reservations#cancel', as: 'cancel_book_reservation'
  # it {
  #   expect(get: "books/2/cancel_reservation").to route_to(controller: "reservations", action: "cancel_reservation", book_id: "2")
  # }

  # get 'users/:user_id/reservations', to: 'reservations#users_reservations', as: 'users_reservations'
  it {
    expect(get: "users/2/reservations").to route_to(controller: "reservations", action: "users_reservations", user_id: "2")
  }

  it {
    expect(get: reserve_book_path(book_id: 1)).to route_to(controller: "reservations", action: "reserve", book_id: "1")
  }
  # get 'google-isbn', to: 'google_books#show'

  it {
    expect(get: "google-isbn").to route_to("google_books#show")
  }
end
