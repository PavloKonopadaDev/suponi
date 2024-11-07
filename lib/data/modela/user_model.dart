// lib/data/models/user.dart

import 'package:hive/hive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
@freezed
class User with _$User {
  const factory User({
    @HiveField(0) required String name,
    @HiveField(1) required String birthday,
    @HiveField(2) required String gender,
    @HiveField(3) String? photoPath,
  }) = _User;

  const User._();
}
