import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_ui_model.freezed.dart';

/// カウンター画面の状態モデルです。
@freezed
abstract class CounterUiModel with _$CounterUiModel {
  /// [CounterUiModel] を生成します。
  const factory CounterUiModel({
    required int count,
  }) = _CounterUiModel;
}
