part of 'university_cubit.dart';

class UniversityState {
  bool isLoading;
  List<UniverResponse>? university;

  UniversityState({this.university, this.isLoading = false});

  UniversityState copyWith({
    bool? isLoading,
    List<UniverResponse>? university,
  }) {
    return UniversityState(
        isLoading: isLoading ?? this.isLoading,
        university: university ?? this.university);
  }

}
