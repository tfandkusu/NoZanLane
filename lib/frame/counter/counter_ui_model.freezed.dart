// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counter_ui_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CounterUiModel {

 int get count;
/// Create a copy of CounterUiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CounterUiModelCopyWith<CounterUiModel> get copyWith => _$CounterUiModelCopyWithImpl<CounterUiModel>(this as CounterUiModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CounterUiModel&&(identical(other.count, count) || other.count == count));
}


@override
int get hashCode => Object.hash(runtimeType,count);

@override
String toString() {
  return 'CounterUiModel(count: $count)';
}


}

/// @nodoc
abstract mixin class $CounterUiModelCopyWith<$Res>  {
  factory $CounterUiModelCopyWith(CounterUiModel value, $Res Function(CounterUiModel) _then) = _$CounterUiModelCopyWithImpl;
@useResult
$Res call({
 int count
});




}
/// @nodoc
class _$CounterUiModelCopyWithImpl<$Res>
    implements $CounterUiModelCopyWith<$Res> {
  _$CounterUiModelCopyWithImpl(this._self, this._then);

  final CounterUiModel _self;
  final $Res Function(CounterUiModel) _then;

/// Create a copy of CounterUiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CounterUiModel].
extension CounterUiModelPatterns on CounterUiModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CounterUiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CounterUiModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CounterUiModel value)  $default,){
final _that = this;
switch (_that) {
case _CounterUiModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CounterUiModel value)?  $default,){
final _that = this;
switch (_that) {
case _CounterUiModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CounterUiModel() when $default != null:
return $default(_that.count);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count)  $default,) {final _that = this;
switch (_that) {
case _CounterUiModel():
return $default(_that.count);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count)?  $default,) {final _that = this;
switch (_that) {
case _CounterUiModel() when $default != null:
return $default(_that.count);case _:
  return null;

}
}

}

/// @nodoc


class _CounterUiModel implements CounterUiModel {
  const _CounterUiModel({required this.count});
  

@override final  int count;

/// Create a copy of CounterUiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CounterUiModelCopyWith<_CounterUiModel> get copyWith => __$CounterUiModelCopyWithImpl<_CounterUiModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CounterUiModel&&(identical(other.count, count) || other.count == count));
}


@override
int get hashCode => Object.hash(runtimeType,count);

@override
String toString() {
  return 'CounterUiModel(count: $count)';
}


}

/// @nodoc
abstract mixin class _$CounterUiModelCopyWith<$Res> implements $CounterUiModelCopyWith<$Res> {
  factory _$CounterUiModelCopyWith(_CounterUiModel value, $Res Function(_CounterUiModel) _then) = __$CounterUiModelCopyWithImpl;
@override @useResult
$Res call({
 int count
});




}
/// @nodoc
class __$CounterUiModelCopyWithImpl<$Res>
    implements _$CounterUiModelCopyWith<$Res> {
  __$CounterUiModelCopyWithImpl(this._self, this._then);

  final _CounterUiModel _self;
  final $Res Function(_CounterUiModel) _then;

/// Create a copy of CounterUiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,}) {
  return _then(_CounterUiModel(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
