import 'package:flutter/material.dart';

class Category {
   int? id;
   String? title;
   String? color;

   Category({
     this.id,
     this.title,
     this.color ,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "color": color,
    };
  }
  Category.fromJson(Map<String, dynamic> json) {
    id=json["id"];
    title = json["title"];
    color = json["color"];
  }
}
