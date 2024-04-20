abstract class BookingState{}
class BookingInitState extends BookingState{}

class UpdateNoOfTicketsSuccessState extends BookingState{}

class AddOrderLoadingState extends BookingState{}
class AddOrderSuccessState extends BookingState{}
class AddOrderErrorState extends BookingState{}

class GetOrderLoadingState extends BookingState{}
class GetOrderSuccessState extends BookingState{}
class GetOrderErrorState extends BookingState{}

class GetSingOrderSuccessState extends BookingState{}