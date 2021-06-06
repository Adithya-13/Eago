import 'package:eago_app/logic/blocs/blocs.dart';
import 'package:eago_app/presentation/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<String> categories = StaticData.getCategoryList();
  final categoryScrollController = ItemScrollController();
  int selectedCategory = 0;

  @override
  void initState() {
    context.read<ProductBloc>().add(ProductFetched());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _header(),
              _search(),
              _categories(),
              _productList(),
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

  _search() {
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
                  hintStyle: AppTheme.text1),
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
            child: SvgPicture.asset(
              Resources.setting,
              width: 20,
            ),
          ),
        ],
      ),
    );
  }

  _categories() {
    return Container(
      height: 24,
      margin: EdgeInsets.symmetric(vertical: 20),
      child: StatefulBuilder(builder: (context, categorySetState) {
        return ScrollablePositionedList.builder(
          initialAlignment: 0,
          initialScrollIndex: selectedCategory,
          itemScrollController: categoryScrollController,
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) =>
              buildCategory(index, categorySetState),
        );
      }),
    );
  }

  Widget buildCategory(int index, Function(void Function()) categorySetState) {
    return GestureDetector(
      onTap: () {
        categorySetState(() {
          categoryScrollController.scrollTo(
            index: index,
            alignment: 0,
            duration: Duration(milliseconds: 500),
            opacityAnimationWeights: [20, 20, 60],
            curve: Curves.easeInOutCubic,
          );
          selectedCategory = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: selectedCategory == index
                  ? AppTheme.text1.withDeepBlue
                  : AppTheme.text1,
            ),
            Container(
              margin: EdgeInsets.only(top: 20 / 4), //top padding 5
              height: 2,
              width: 30,
              color: selectedCategory == index
                  ? AppTheme.deepBlue
                  : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }

  _productList() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoad) {
            return Container();
          } else if (state is ProductFailure) {
            return Container();
          } else if (state is ProductSuccess) {
            final productList = state.entity.productList;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: productList.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final productItem = productList[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.deepBlue.withOpacity(0.1),
                        offset: Offset(0, 12),
                        blurRadius: 20,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width * 0.4,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppTheme.scaffoldColor,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: AspectRatio(
                          aspectRatio: 3 / 4,
                          child: Image.asset(productItem.image),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                              Text(
                                productItem.title,
                                style: AppTheme.text1.withDeepBlue,
                              ),
                              SizedBox(height: 4),
                              Text.rich(
                                TextSpan(
                                  style: AppTheme.text2,
                                  children: [
                                    TextSpan(
                                      text: 'by ',
                                    ),
                                    TextSpan(
                                      text: 'Seto',
                                      style: AppTheme.text2.bold,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 6),
                              Center(
                                child: Text(
                                  'Lorem Ipsum Dolor Sit Amet Lorem Ipsum',
                                  style: AppTheme.text2,
                                ),
                              ),
                              SizedBox(height: 6),
                              Row(),
                            ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
