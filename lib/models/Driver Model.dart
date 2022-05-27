import 'package:moovbe/pages/bus_list_screen.dart';

class BusListingResponse {
  BusListingResponse({
    this.success,
    this.data,
  });

  bool? success;
  List<Buslist>? data;

  factory BusListingResponse.fromJson(Map<String, dynamic> json) =>
      BusListingResponse(
        success: json["success"],
        data: List<Buslist>.from(json["data"].map((x) => Buslist.fromJson(x))),
      );
}

class Buslist {
  Buslist({
    this.id,
    this.drivername,
    this.lisence,
  });

  int? id;
  String? drivername;
  String? lisence;

  factory Buslist.fromJson(Map<String, dynamic> json) => Buslist(
        id: json["id"],
        drivername: json["expense_name"],
        lisence: json["expense_category"],
      );
}
