import 'dart:io';

import 'package:eago_app/data/exceptions/api_exception.dart';
import 'package:eago_app/data/repositories/repositories.dart';
import 'package:eago_app/logic/blocs/blocs.dart';
import 'package:eago_app/presentation/routes/routes.dart';
import 'package:eago_app/presentation/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logging/logging.dart';

main() async {
  debugPrint = (String? message, {int? wrapWidth}) {};
  await GetStorage.init();
  BlocOverrides.runZoned(
    () => runApp(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider<ProductRepository>(
            create: (context) => ProductRepository(),
          )
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<ProductBloc>(
              create: (context) => ProductBloc(
                productRepository: context.read<ProductRepository>(),
              ),
            ),
          ],
          child: MyApp(),
        ),
      ),
    ),
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  late final PageRouter _router;

  MyApp() : _router = PageRouter() {
    initLogger();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        title: 'Eago',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          scaffoldBackgroundColor: AppTheme.scaffoldColor,
          fontFamily: !Platform.isIOS ? 'Gotham' : null,
        ),
        onGenerateRoute: _router.getRoute,
        navigatorObservers: [_router.routeObserver],
      ),
    );
  }

  void initLogger() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      dynamic e = record.error;
      String m = e is APIException ? e.message : e.toString();
      debugPrint(
          '${record.loggerName}: ${record.level.name}: ${record.message} ${m != 'null' ? m : ''}');
    });
    Logger.root.info("Logger initialized.");
  }
}
