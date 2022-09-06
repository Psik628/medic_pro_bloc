import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';
part 'navigation_bloc.freezed.dart';

@injectable
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationState.home()) {
    on<NavigateTo>((NavigationEvent event, emit) {
      switch(event.destination){
        case Destination.home:
          emit(const Home());
          break;
        case Destination.profile:
          emit(const Profile());
          break;
        case Destination.settings:
          emit(const Settings());
          break;
        default:
          break;
      }
    });
  }
}
