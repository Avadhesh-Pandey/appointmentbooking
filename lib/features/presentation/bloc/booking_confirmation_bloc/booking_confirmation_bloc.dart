import 'package:appointmentbooking/features/data/model/my_appointments_model.dart';
import 'package:appointmentbooking/features/domain/usecases/my_appointments_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:appointmentbooking/core/usecases/usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/booking_confirmation_model.dart';
import '../../../domain/usecases/booking_confirmation_usecase.dart';

part 'booking_confirmation_event.dart';
part 'booking_confirmation_state.dart';

class GetBookingConfirmationBloc extends Bloc<BookingConfirmationEvent, BookingConfirmationState> {
  final BookingConfirmationUseCase getBookingConfirmationUseCase;

  GetBookingConfirmationBloc({
    required this.getBookingConfirmationUseCase,
  }) : super(GettingBookingConfirmationInitiatedState()) {
    on<BookingConfirmationEvent>((event, emit) async {
      if (event is GetBookingConfirmationEvent) {
        emit(LoadingBookingConfirmationState());
        final failureOrSuccessGettingJokesStatus = await getBookingConfirmationUseCase(NoParams());
        failureOrSuccessGettingJokesStatus.fold(
          (failure) => emit(ErrorGettingBookingConfirmationState()),
          (result) => emit(BookingConfirmationRetrievedSuccessfullyState(result)),
        );
      }
    });
  }
}
