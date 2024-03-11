
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseBuilder {
  static const String dbName = "movies.sqlite";
  static Future<Database> veritabaniErisim() async {
    String dbPath = join(await getDatabasesPath(),dbName);
    if(await databaseExists(dbPath)){
      print("Veritabanı zaten var.Kopyalamaya gerek yok.");
    }else{
      ByteData data = await rootBundle.load("database/$dbName");
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
      await File(dbPath).writeAsBytes(bytes,flush: true);
      print("Veritabanı kopyalandı.");
    }
    return openDatabase(dbPath);
  }
}
