// To parse this JSON data, do
//
//     final band = bandFromMap(jsonString);

import 'dart:convert';

class Band {
    Band({
        required this.id,
        required this.idrequest,
        required this.name,
    });

 final   String id;
 final   int idrequest;
 final   String name;

    factory Band.fromJson(String str) => Band.fromMap(json.decode(str));
    factory Band.fromMap(Map<String, dynamic> json) => Band(
        id: json["id"],
        idrequest: json["idrequest"],
        name: json["name"],
    );

    String toJson() => json.encode(toMap());
    Map<String, dynamic> toMap() => {
        "id": id,
        "idrequest": idrequest,
        "name": name,
    };
}
