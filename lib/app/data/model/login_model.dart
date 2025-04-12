import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Model for Login Response
// Model for Login Response
class LoginResponse {
  final String token;
  final bool? message;

  LoginResponse({required this.token,  this.message});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'],
      message: json['message'],
    );
  }
}

