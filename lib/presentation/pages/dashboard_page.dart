import 'package:eago_app/logic/blocs/blocs.dart';
import 'package:eago_app/presentation/routes/routes.dart';
import 'package:eago_app/presentation/utils/utils.dart';
import 'package:eago_app/presentation/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
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
        context.read<ProductBloc>().add(ProductFetched());
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
            return LoadingWidget();
          } else if (state is ProductFailure) {
            return FailureWidget(
              message: state.e,
            );
          } else if (state is ProductSuccess) {
            if (state.entity.productList.isEmpty) return EmptyWidget();
            final productList = state.entity.productList.shuffleList;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: productList.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final productItem = productList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      PagePath.detail,
                      arguments: ArgumentBundle(
                        id: productItem.id,
                        extras: {
                          Keys.productItem: productItem,
                        },
                      ),
                    );
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.44,
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
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AspectRatio(
                          aspectRatio: 3 / 4,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppTheme.scaffoldColor,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: CircleAvatar(
                                      radius: 16,
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        Icons.favorite_border_rounded,
                                        color: Colors.redAccent,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Column(
                                    children: [
                                      Spacer(),
                                      Expanded(
                                        flex: 4,
                                        child: Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Hero(
                                            tag: 'image ${productItem.id}',
                                            child:
                                                Image.asset(productItem.image),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
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
                                            text: productItem.seller,
                                            style: AppTheme.text2.bold,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 6),
                                Text(
                                  productItem.lessDescription,
                                  style: AppTheme.text2,
                                ),
                                SizedBox(height: 6),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        style: AppTheme.headline3,
                                        children: [
                                          TextSpan(
                                            text: '\$${productItem.price}.',
                                          ),
                                          TextSpan(
                                            text: '00',
                                            style: AppTheme.text2.withDeepBlue,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 24),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(32),
                                        color: AppTheme.deepBlue,
                                        boxShadow: AppTheme.getShadow(
                                            AppTheme.deepBlue),
                                      ),
                                      child: Text(
                                        'Buy',
                                        style: AppTheme.text2.withWhite,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
