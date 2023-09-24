import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseController extends GetxController {
  // Ill store data in a variable called Data and the db table is data
  var Data = <Map<String, dynamic>>[].obs;
  var filtredData = <Map<String, dynamic>>[].obs;
  String searchedText = "";
  Map<String, dynamic> Sample = {
    'title': 'Sample Title',
    'content': 'Sample Content',
  };
  late Database database;


  @override
  Future<void> onInit() async {
    super.onInit();
    await initializeDatabase();
    await fetchData();
  }

  void getSearchText(String value) {
    searchedText = value;
    filterTitles(value);
  }

  void filterTitles(String value) {
    if (value.isEmpty) {
      filtredData.value = Data.value; // Show all articles if value is empty
    } else {
      filtredData.value = Data.value
          .where((instance) => instance["title"]!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    print("Here the filtred titles and DATA $filtredData $filtredData");
  }

  // This is a default function that sets the db
  Future<void> initializeDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'my_database.db');
    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE data (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          content TEXT
        )
      ''');
      },
    );
  }

  // This function fetches data when the app starts running
  Future<void> fetchData() async {
    final db = await database;
    Data.assignAll(await db.query('data'));
    print("Assaigning here ${Data.value}");
    update();
  }

  /* This function simply saves the data in the db, the data stored in Data
  will be stored in db */
  Future<void> save() async {
    final db = await database;
    await db.delete('data');

    for (Map<String, dynamic> dataMap in Data) {
      await db.insert('data', dataMap);
    }
  }

  // This function changes the Data list
  void addSampleData() {
    Data.add(Sample);
    update();
  }

  /* This function empties the table so it's rarely needed and be carfull of
  losing important data when using it*/
  Future<void> emptyTable() async {
    final db = await database;
    await db.delete('data');
    update();
  }
}
