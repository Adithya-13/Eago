import 'package:eago_app/presentation/routes/routes.dart';
import 'package:eago_app/presentation/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    _navigateOtherScreen();
    super.initState();
  }

  void _navigateOtherScreen() {
    GetStorage _getStorage = GetStorage();
    bool isInitial = _getStorage.read(Keys.isOnBoardInitial) ?? true;
    if(isInitial){
      Future.delayed(Duration(seconds: 3))
          .then((_) => Navigator.pushReplacementNamed(context, PagePath.onBoard));
    } else {
      Future.delayed(Duration(seconds: 3))
          .then((_) => Navigator.pushReplacementNamed(context, PagePath.dashboard));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Resources.icon_launcher,
              width: 80,
              height: 80,
            ),
            SizedBox(height: 10),
            Text('Eago', style: AppTheme.headline1),
          ],
        ),
      ),
    );
  }
}
