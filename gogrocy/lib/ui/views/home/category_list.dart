import 'package:flutter/material.dart';
import 'package:gogrocy/core/models/category_product_list_arguments.dart';
import 'package:gogrocy/core/services/navigation_service.dart';
import 'package:gogrocy/service_locator.dart';
import 'package:gogrocy/ui/shared/constants.dart' as constants;
import 'package:gogrocy/ui/shared/colors.dart' as colors;

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final NavigationService _navigationService = locator<NavigationService>();

  final List<String> categoryTitle = [
    "Grocery",
    "Food",
    "Healthcare",
    "Rice and its products",
    "Toiletries",
    "Detergents",
    "Pulses and Flour",
    "Oil and Ghee",
    "Packed Foods",
    "Masala"
  ];

  final List<String> assetPaths = [
    "assets/images/grocery.png",
    "assets/images/pizza.png",
    "assets/images/healthcare.png",
    "assets/images/rice.png",
    "assets/images/toiletries.png",
    "assets/images/detergent.png",
    "assets/images/pulses.png",
    "assets/images/oil_ghee.png",
    "assets/images/snacks.png",
    "assets/images/masala.png"
  ];

  final List<String> catId = [
    "2",
    "6",
    "18",
    "7",
    "9",
    "10",
    "12",
    "14",
    "15",
    "16"
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox(
      height: constants.HomePageConfig.categoryListHeight,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: categoryTitle.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  _navigationService.navigateTo('category',
                      arguments: CategoryProductListArgument(
                          categoryTitle[index], catId[index]));
                },
                child: Container(
                  width: constants.HomePageConfig.categoryListWidth,
                  height: constants.HomePageConfig.categoryListHeight,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          child: Container(
                            width: constants.HomePageConfig.categoryBoxWidth,
                            height: constants.HomePageConfig.categoryBoxHeight,
                            color: colors.categoryListBox,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            categoryTitle[index],
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment(0, -1),
                          child: SizedBox(
                            height:
                                constants.HomePageConfig.categoryImageHeight,
                            width: constants.HomePageConfig.categoryImageWidth,
                            child: Image(
                              image: AssetImage(assetPaths[index]),
                              fit: BoxFit.contain,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
