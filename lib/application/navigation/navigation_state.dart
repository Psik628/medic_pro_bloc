part of 'navigation_bloc.dart';

@freezed
class NavigationState with _$NavigationState{
  const factory NavigationState.questions() = Questions;
  const factory NavigationState.profile() = Profile;
  const factory NavigationState.settings() = Settings;
}
