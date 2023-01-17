import 'package:flutter/cupertino.dart';

class ItemInfo {
    int? id;
   String ?museumNumber;
   String ?storeNumber;
   String? name;
   String? manufacturersName;
   String? details;
   int? category;
   int? special;
   String? Date;
   String? material;

   ItemInfo({
     this.id,
     this.museumNumber,
     this.storeNumber,
     this.name,
     this.manufacturersName,
     this.details,
     this.category,
     this.special,
     this.Date,
     this.material,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "manufacturersName": manufacturersName,
      "museumNumber": museumNumber,
      "storeNumber": storeNumber,
      "name": name,
      "details": details,
      "category": category,
      "special": special,
      "Date": Date,
      "material": material
    };
  }

  //String toJson() => json.encode(toMap());

   ItemInfo.fromJson(Map<String, dynamic> json) {
        id=json["id"];
        museumNumber = json["museumNumber"];
        storeNumber = json["storeNumber"];
        name= json["name"];
        details= json["details"];
        category= json["category"];
        special= json["special"];
        manufacturersName= json["manufacturersName"];
        Date= json["Date"];
        material= json["material"];
  }
}
