import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled1/db/db_helper.dart';
import '../Models/item_Info.dart';

class DetailsController extends GetxController {
  RxList<ItemInfo> itemList = <ItemInfo>[].obs;

  Future<int> addItem(ItemInfo item) {
    return DBHelper.insert(item, 'ItemInfo');
  }

  Future<void> getItems() async {
    List<Map<String, dynamic>> items = await DBHelper.query('ItemInfo');
    itemList.assignAll(items.map((e) => ItemInfo.fromJson(e)).toList());
    // for (var element in itemList) {
    //   debugPrint(element.manufacturersName);
    // }
  }
  //getItemByMuseumNumber
  Future<List<ItemInfo>> getItemByMuseumNumber(String input) async {
    List<Map<String, dynamic>> items = await DBHelper.likeQuery('ItemInfo','museumNumber',input);
    List<ItemInfo> itemsSearch = [];
    itemsSearch.assignAll(items.map((e) => ItemInfo.fromJson(e)).toList());
    return itemsSearch;
  }

  Future<List<ItemInfo>> getItemByName(String name) async {
    //var items = await DBHelper.query();
    return itemList.where((item) => item.name!.contains(name)).toList();
  }

  Future<ItemInfo> getItemById(int id) async {
    //var items = await DBHelper.query();
    getItems();
    return itemList.where((item) => item.id == id).first;
  }

  void delete(int id) async {
    try {
      String query = """
          UPDATE ItemInfo SET 
          name ='',
          museumNumber ='',
          details ='',
          manufacturersName = '',
          Date = '',
          material = '', 
          special =0
           WHERE id = $id """;
      await DBHelper.updateQuery(query);
      getItems();
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> updated(ItemInfo item) async {
   try {
     String query = """
          UPDATE ItemInfo SET 
          name ='${item.name}',
          museumNumber ='${item.museumNumber}',
          details ='${item.details}',
          manufacturersName = '${item.manufacturersName}',
          Date = '${item.Date}',
          material = '${item.material}' 
           WHERE id = ${item.id} """;
      await DBHelper.updateQuery(query);
      getItems();
   } on Exception catch (e) {
     debugPrint(e.toString());
   }
  }
  Future<void> updateQuery(String query) async {
    await DBHelper.updateQuery(query);
  }
}
