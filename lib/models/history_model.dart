import 'package:meta/meta.dart';
import 'dart:convert';

HistoryModel historyModelFromJson(String str) =>
    HistoryModel.fromMap(json.decode(str));

String historyModelToJson(HistoryModel data) => json.encode(data.toMap());

class HistoryModel {
  List<Node> nodes;
  List<Link> links;

  HistoryModel({
    @required this.nodes,
    @required this.links,
  });

  factory HistoryModel.fromMap(Map<String, dynamic> json) => HistoryModel(
        nodes: json["nodes"] == null
            ? null
            : List<Node>.from(json["nodes"].map((x) => Node.fromMap(x))),
        links: json["links"] == null
            ? null
            : List<Link>.from(json["links"].map((x) => Link.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "nodes": nodes == null
            ? null
            : List<dynamic>.from(nodes.map((x) => x.toMap())),
        "links": links == null
            ? null
            : List<dynamic>.from(links.map((x) => x.toMap())),
      };
}

class Link {
  int source;
  int target;

  Link({
    @required this.source,
    @required this.target,
  });

  factory Link.fromMap(Map<String, dynamic> json) => Link(
        source: json["source"] == null ? null : json["source"],
        target: json["target"] == null ? null : json["target"],
      );

  Map<String, dynamic> toMap() => {
        "source": source == null ? null : source,
        "target": target == null ? null : target,
      };
}

class Node {
  String id;
  String cases;
  String province;
  String provinceId;
  String age;
  String ageText;
  String gender;
  String genderId;
  String status;
  String statusId;
  String wn;
  String wnId;
  String announcement;
  String transmission;
  String rs;
  String rsId;

  Node({
    @required this.id,
    @required this.cases,
    @required this.province,
    @required this.provinceId,
    @required this.age,
    @required this.ageText,
    @required this.gender,
    @required this.genderId,
    @required this.status,
    @required this.statusId,
    @required this.wn,
    @required this.wnId,
    @required this.announcement,
    @required this.transmission,
    @required this.rs,
    @required this.rsId,
  });

  factory Node.fromMap(Map<String, dynamic> json) => Node(
        id: json["id"] == null ? null : json["id"],
        cases: json["kasus"] == null ? null : json["kasus"],
        province: json["provinsi"] == null ? null : json["provinsi"],
        provinceId: json["provinsiid"] == null ? null : json["provinsiid"],
        age: json["umur"] == null ? null : json["umur"],
        ageText: json["umurtext"] == null ? null : json["umurtext"],
        gender: json["gender"] == null ? null : json["gender"],
        genderId: json["genderid"] == null ? null : json["genderid"],
        status: json["status"] == null ? null : json["status"],
        statusId: json["statusid"] == null ? null : json["statusid"],
        wn: json["wn"] == null ? null : json["wn"],
        wnId: json["wnid"] == null ? null : json["wnid"],
        announcement: json["pengumuman"] == null ? null : json["pengumuman"],
        transmission: json["penularan"] == null ? null : json["penularan"],
        rs: json["rs"] == null ? null : json["rs"],
        rsId: json["rsid"] == null ? null : json["rsid"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "kasus": cases == null ? null : cases,
        "provinsi": province == null ? null : province,
        "provinsiid": provinceId == null ? null : provinceId,
        "umur": age == null ? null : age,
        "umurtext": ageText == null ? null : ageText,
        "gender": gender == null ? null : gender,
        "genderid": genderId == null ? null : genderId,
        "status": status == null ? null : status,
        "statusid": statusId == null ? null : statusId,
        "wn": wn == null ? null : wn,
        "wnid": wnId == null ? null : wnId,
        "pengumuman": announcement == null ? null : announcement,
        "penularan": transmission == null ? null : transmission,
        "rs": rs == null ? null : rs,
        "rsid": rsId == null ? null : rsId,
      };
}
