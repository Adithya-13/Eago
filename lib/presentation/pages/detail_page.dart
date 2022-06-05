import 'package:eago_app/data/entities/entities.dart';
import 'package:eago_app/presentation/routes/routes.dart';
import 'package:eago_app/presentation/utils/utils.dart';
import 'package:eago_app/presentation/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final ArgumentBundle bundle;

  DetailPage({Key? key, required this.bundle}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late ProductItemEntity _productItem = widget.bundle.extras[Keys.productItem];
  int selectedColor = 0;
  int countTotal = 1;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _header(),
                    _productImages(),
                    _informationProduct(),
                  ],
                ),
              ),
            ),
          ),
          _bottomPricing(),
        ],
      ),
    );
  }

  _header() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                CupertinoIcons.back,
                color: AppTheme.deepBlue,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.white,
              child: Icon(
                isFavorite
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
                color: Colors.redAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _productImages() {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.6,
      child: Hero(
        tag: 'image ${_productItem.id}',
        child: Image.asset(
          _productItem.image,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  _informationProduct() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _titleAndRating(),
          SizedBox(height: 20),
          Text(_productItem.description, style: AppTheme.text2.moreLineSpace),
          SizedBox(height: 20),
          _otherProduct(),
          SizedBox(height: 20),
          _colorAndCount(),
        ],
      ),
    );
  }

  _titleAndRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _productItem.title,
              style: AppTheme.headline2,
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
                    text: _productItem.seller,
                    style: AppTheme.text2.bold,
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: AppTheme.deepBlue, width: 0.1),
          ),
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.star_rounded, color: Colors.orangeAccent),
              SizedBox(width: 4),
              Text(
                _productItem.rating.toString(),
                style: AppTheme.text1.withDeepBlue.bold,
              ),
            ],
          ),
        ),
      ],
    );
  }

  _otherProduct() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _productItem.otherProductImages
            .map((item) => Container(
                  padding: EdgeInsets.all(4),
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  height: MediaQuery.of(context).size.width * 0.24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppTheme.scaffoldColor,
                  ),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(item),
                  ),
                ))
            .toList(),
      ),
    );
  }

  _colorAndCount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Color',
              style: AppTheme.text1.withDeepBlue.bold,
            ),
            SizedBox(width: 16),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: _productItem.listColor
                  .asMap()
                  .entries
                  .map((item) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColor = item.key;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: CircleAvatar(
                            radius: item.key == selectedColor ? 6 : 8,
                            backgroundColor: item.value,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: AppTheme.scaffoldColor,
            borderRadius: BorderRadius.circular(32),
          ),
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (countTotal > 1) {
                      countTotal--;
                    }
                  });
                },
                child: Icon(
                  Icons.remove,
                  color: AppTheme.deepBlue,
                ),
              ),
              SizedBox(width: 8),
              Text(
                countTotal.toString(),
                style: AppTheme.text2.withDeepBlue,
              ),
              SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  setState(() {
                    countTotal++;
                  });
                },
                child: Icon(
                  Icons.add,
                  color: AppTheme.deepBlue,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _bottomPricing() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                style: AppTheme.headline2,
                children: [
                  TextSpan(
                    text: '\$${_productItem.price * countTotal}.',
                  ),
                  TextSpan(
                    text: '00',
                    style: AppTheme.text1.withDeepBlue,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => _buyProduct(),
              child: Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: AppTheme.deepOrange,
                  boxShadow: AppTheme.getShadow(AppTheme.deepOrange),
                ),
                child: Text(
                  'Buy now',
                  style: AppTheme.text2.withWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buyProduct() {
    showDialog<bool>(
      context: context,
      builder: (context) => FilterWrapper(
        blurAmount: 5,
        child: AlertDialog(
          title: Text(
            "Success Buy ${_productItem.title}!",
            style: AppTheme.headline3,
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SuccessWidget(),
              SizedBox(height: 20),
              Text(
                'Thank you for order the ${_productItem.title}!',
                style: AppTheme.text1,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Close',
                style: AppTheme.text1.withDeepBlue,
              ),
            ),
          ],
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          clipBehavior: Clip.antiAlias,
        ),
      ),
    );
  }
}
