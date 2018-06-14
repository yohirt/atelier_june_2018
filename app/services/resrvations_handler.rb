class ReservationsHandler
  def initialize(user, book)
    @user = user
    @book = book
  end

  def reserve
    return "Book is not available for reservation" unless book.can_be_reserved?(user)
    book.reservations.create(user: user, status: "RESERVED")
  end

  def take
    return "metoda take w reservatin-handler" unless book.can_take?(user)

    if available_reservation.present?
      available_reservation.update_attributes(status: "TAKEN")
    else
      reservations.create(user: user, status: "TAKEN")
    end
  end

  def can_give_back?(user)
    reservations.find_by(user: user, status: "TAKEN").present?
  end

  private

  attr_reader :user, :book

  def cancel_reservation
    book.reservations.where(user: user, status: "RESERVED").order(created_at: :asc).first.update_attributes(status: "CANCELED")
  end
end
