import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sistema_matricula/backend/db.dart';
import 'package:sistema_matricula/di/dependency_injection.dart';
import 'package:sistema_matricula/presentation/login/login_page.dart';
import 'package:sistema_matricula/shared/app_routes/paths.dart';
import 'package:sistema_matricula/shared/app_routes/routes.dart';
import 'package:window_size/window_size.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {  
  WidgetsFlutterBinding.ensureInitialized();

  DependencyInjector().setup();

  final db = Db();
  
  await db.init();

  runApp(
    MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: GetInformationParser(),
      routerDelegate: GetDelegate(
        preventDuplicateHandlingMode: PreventDuplicateHandlingMode.DoNothing,
      ),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.0),
          ),
          child: GetMaterialApp(
            initialRoute: Paths.login,
            getPages: Routes.pages,
            debugShowCheckedModeBanner: false,
            builder: (context, child) => child!,
          ),
        );
      },
    ),
  );
}
