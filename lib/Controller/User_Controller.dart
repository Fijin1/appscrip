import 'dart:convert';

import 'package:appscrip/repostry/User_Repositry.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:http/http.dart' as http;



final userServiceProvider = Provider<UserService>((ref) {
  return UserService();
});

final userListProvider = FutureProvider.family((ref,String search) => ref.watch(userServiceProvider).fetchUsers(search));