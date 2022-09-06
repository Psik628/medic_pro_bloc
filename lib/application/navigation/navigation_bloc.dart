import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';
part 'navigation_bloc.freezed.dart';

@injectable
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationState.questions()) {
    on<NavigateTo>((NavigationEvent event, emit) {
      switch(event.destination){
        case NavigationDestination.home:
          emit(const Questions());
          break;
        case NavigationDestination.profile:
          emit(const Profile());
          break;
        case NavigationDestination.settings:
          emit(const Settings());
          break;
        default:
          break;
      }
    });
  }
}
