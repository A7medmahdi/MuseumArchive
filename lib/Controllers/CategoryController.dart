import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Models/Category.dart';
import '../db/db_helper.dart';

class CategoryController extends GetxController {
  RxList<Category> categoryList = <Category>[].obs;

  Future<void> getCategory() async {
    List<Map<String, dynamic>> categories =
        await DBHelper.query(DBHelper.categoryTableName);
    categoryList
        .assignAll(categories.map((e) => Category.fromJson(e)).toList());
  }

  Future<int> addCategory(Category category) {
    return DBHelper.insert(category, DBHelper.categoryTableName);
  }

  Future<List<Category>> getCategoryByTitle(String input) async {
    List<Map<String, dynamic>> categories =
        await DBHelper.likeQuery(DBHelper.categoryTableName, 'title', input);
    List<Category> itemsSearch = [];
    itemsSearch.assignAll(categories.map((e) => Category.fromJson(e)).toList());
    debugPrint(itemsSearch.length.toString());
    return itemsSearch;
  }

  Future<void> deleteAllItems(int categoryId) async {
    try {
      String query = """
       DELETE FROM ${DBHelper.itemTableName}
          WHERE category = $categoryId """;
      await DBHelper.updateQuery(query);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> updated(Category category) async {
    try {
      String query = """
          UPDATE Category  SET 
          title = '${category.title}',
          color = '${category.color}'
          WHERE id = ${category.id} """;
      await DBHelper.updateQuery(query);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
