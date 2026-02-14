// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counter_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CounterMessage {

 String get description;
/// Create a copy of CounterMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CounterMessageCopyWith<CounterMessage> get copyWith => _$CounterMessageCopyWithImpl<CounterMessage>(this as CounterMessage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CounterMessage&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,description);

@override
String toString() {
  return 'CounterMessage(description: $description)';
}


}

/// @nodoc
abstract mixin class $CounterMessageCopyWith<$Res>  {
  factory $CounterMessageCopyWith(CounterMessage value, $Res Function(CounterMessage) _then) = _$CounterMessageCopyWithImpl;
@useResult
$Res call({
 String description
});




}
/// @nodoc
class _$CounterMessageCopyWithImpl<$Res>
    implements $CounterMessageCopyWith<$Res> {
  _$CounterMessageCopyWithImpl(this._self, this._then);

  final CounterMessage _self;
  final $Res Function(CounterMessage) _then;

/// Create a copy of CounterMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? description = null,}) {
  return _then(_self.copyWith(
description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CounterMessage].
extension CounterMessagePatterns on CounterMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CounterMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CounterMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CounterMessage value)  $default,){
final _that = this;
switch (_that) {
case _CounterMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CounterMessage value)?  $default,){
final _that = this;
switch (_that) {
case _CounterMessage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CounterMessage() when $default != null:
return $default(_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String description)  $default,) {final _that = this;
switch (_that) {
case _CounterMessage():
return $default(_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String description)?  $default,) {final _that = this;
switch (_that) {
case _CounterMessage() when $default != null:
return $default(_that.description);case _:
  return null;

}
}

}

/// @nodoc


class _CounterMessage implements CounterMessage {
  const _CounterMessage({required this.description});
  

@override final  String description;

/// Create a copy of CounterMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CounterMessageCopyWith<_CounterMessage> get copyWith => __$CounterMessageCopyWithImpl<_CounterMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CounterMessage&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,description);

@override
String toString() {
  return 'CounterMessage(description: $description)';
}


}

/// @nodoc
abstract mixin class _$CounterMessageCopyWith<$Res> implements $CounterMessageCopyWith<$Res> {
  factory _$CounterMessageCopyWith(_CounterMessage value, $Res Function(_CounterMessage) _then) = __$CounterMessageCopyWithImpl;
@override @useResult
$Res call({
 String description
});




}
/// @nodoc
class __$CounterMessageCopyWithImpl<$Res>
    implements _$CounterMessageCopyWith<$Res> {
  __$CounterMessageCopyWithImpl(this._self, this._then);

  final _CounterMessage _self;
  final $Res Function(_CounterMessage) _then;

/// Create a copy of CounterMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? description = null,}) {
  return _then(_CounterMessage(
description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
