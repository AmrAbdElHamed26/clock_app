import 'package:clock_app/shared/utils/constances.dart';
import 'package:sqflite/sqflite.dart';

import '../../alarm_module/data_layer/models/alarm_data_model.dart';
import '../utils/custom_colors.dart';

class AlarmHelper {
  static Database? _database;
  static AlarmHelper? _alarmHelper;

  AlarmHelper._createInstance();

  factory AlarmHelper() {
    _alarmHelper ??= AlarmHelper._createInstance();
    return _alarmHelper!;
  }

  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    var dir = await getDatabasesPath();
    var path = "$dir/alarm.db";

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
         create table ${Constances.kTableAlarm} ( 
          ${Constances.kColumnId} integer primary key autoincrement, 
          ${Constances.kColumnTitle} text not null  ,
          ${Constances.kColumnDate} text not null,
          ${Constances.kColumnTime} text not null,
          ${Constances.kColumnPending} text not null,
          ${Constances.kColumnColorIndex} text not null,
           ${Constances.kColumnDescription} text not null )
        ''');
      },
    );

    print("______ data base is initialized _____");
    print(database);
    return database;
  }

  Future<int> insertAlarm(AlarmDataModel alarmDataModel) async {
    var db = await database;

    var result = await db.insert(Constances.kTableAlarm, alarmDataModel.toMap());

    await db.update(
      Constances.kTableAlarm,
      {Constances.kColumnColorIndex: ((result)%GradientColors.allColors.length).toString()},
      where: '${Constances.kColumnId} = ?',
      whereArgs: [result],
    );

    return result;
  }


  Future<List<AlarmDataModel>> getAlarms() async {
    List<AlarmDataModel> alarms = [];

    var db = await database;
    var result = await db.query(Constances.kTableAlarm);
    for (var element in result) {
      var alarmInfo = AlarmDataModel.fromMap(element);
      alarms.add(alarmInfo);
    }

    return alarms;
  }

  Future<int> delete(int? id) async {
    var db = await database;
    return await db.delete(Constances.kTableAlarm,
        where: '${Constances.kColumnId} = ?', whereArgs: [id]);
  }
}
