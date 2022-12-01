import 'dart:convert';
import 'package:flutter/material.dart';
class InfoModel {
  String? name;
  String? profession;
  int? phoneNo;
  String? email;
  String? address;
  String? linkedinLink;

  InfoModel({
    this.name,
    this.profession,
    this.phoneNo,
    this.email,
    this.address,
    this.linkedinLink
  });

  Map<String, dynamic> toMap() {
    return {
      'name':name,
      'profession': profession,
      'phoneNo':phoneNo,
      'email': email,
      'address':address,
    'linkedinLink':linkedinLink,
    };
  }

  factory InfoModel.fromMap(Map<String, dynamic> map) {
    return InfoModel(
      phoneNo: map['phoneNo']?.toInt(),
      profession: map['profession'],

    );
  }
}
