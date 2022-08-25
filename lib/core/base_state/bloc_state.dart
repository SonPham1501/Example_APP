import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../common/error/failure.dart';

part 'bloc_state.freezed.dart';

@freezed
class BlocState with _$BlocState {
  const factory BlocState.data(dynamic value) = SuccessState;

  const factory BlocState.init() = InitialState;

  const factory BlocState.loading() = LoadingState;

  const factory BlocState.error(Failure ex) = ErrorState;
}
