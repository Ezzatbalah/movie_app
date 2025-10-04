import 'package:equatable/equatable.dart';

class NewReleasesDatesModel extends Equatable {
  final String? maximum;
  final String? minimum;

  const NewReleasesDatesModel({this.maximum, this.minimum});

  factory NewReleasesDatesModel.fromJson(Map<String, dynamic> json) {
    return NewReleasesDatesModel(
      maximum: json['maximum'],
      minimum: json['minimum'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'maximum': maximum, 'minimum': minimum};
  }

  @override
  List<Object?> get props => [maximum, minimum];
}
