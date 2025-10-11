import 'package:equatable/equatable.dart';

class GenreIds extends Equatable {
  final List<int>? ids;

  const GenreIds({this.ids});

  factory GenreIds.fromJson(List<dynamic> json) {
    return GenreIds(ids: json.map((e) => e as int).toList());
  }

  List<dynamic> toJson() => ids ?? [];

  @override
  List<Object?> get props => [ids];
}
