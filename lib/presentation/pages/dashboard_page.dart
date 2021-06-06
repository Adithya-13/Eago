import 'package:eago_app/presentation/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _header(),
              _search(),
            ],
          ),
        ),
      ),
    );
  }

  _header() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 40, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Best Product',
            style: AppTheme.headline1,
          ),
          SizedBox(height: 8),
          Text(
            'Perfect Choice!',
            style: AppTheme.headline3.normal,
          )
        ],
      ),
    );
  }

  _search(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(
                  Icons.search_outlined,
                  color: AppTheme.deepBlue,
                ),
                hintText: 'Search',
                hintStyle: AppTheme.text1
              ),
              style: AppTheme.text1.withDeepBlue,
            ),
          ),
          SizedBox(width: 12),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: SvgPicture.asset(Resources.setting, width: 20,),
          ),
        ],
      ),
    );
  }
}
