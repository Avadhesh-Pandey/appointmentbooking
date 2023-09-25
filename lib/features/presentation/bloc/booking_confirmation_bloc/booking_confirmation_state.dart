part of 'booking_confirmation_bloc.dart';

abstract class BookingConfirmationState extends Equatable {
  const BookingConfirmationState();

  @override
  List<Object> get props => [];
}

class GettingBookingConfirmationInitiatedState extends BookingConfirmationState {}

class LoadingBookingConfirmationState extends BookingConfirmationState {}

class ErrorGettingBookingConfirmationState extends BookingConfirmationState {}

class BookingConfirmationRetrievedSuccessfullyState extends BookingConfirmationState {
  final BookingConfirmationModel details;

  const BookingConfirmationRetrievedSuccessfullyState(this.details);

  @override
  List<Object> get props => [details];
}
