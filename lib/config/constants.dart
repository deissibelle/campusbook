/*
this is constant pages
 */

import 'package:flutter/material.dart';

const String APP_NAME = 'CampusBook';

// color for apps
// const Color PRIMARY_COLOR = Color.fromRGBO(#0000FF);
// const Color ASSENT_COLOR = Color.fromRGBO(43, 9, 211, 1);

// const Color CHARCOAL = Color(0xFF515151);
// const Color BLACK_GREY = Color(0xff777777);
// const Color SOFT_GREY = Color(0xFFaaaaaa);
// const Color SOFT_BLUE = Color(0xff01aed6);
const Color PRIMARY_COLOR = Color.fromARGB(255, 68, 85, 240);
const Color PRIMARY_SOFT_COLOR = Color.fromRGBO(151, 190, 189, 1);
const Color SECONDARY_SOFT_COLOR = Color.fromARGB(255, 193, 116, 226);
const Color SECONDARY_COLOR = Color.fromARGB(255, 160, 25, 219);
const Color WARNING_COLOR = Color.fromARGB(255, 214, 180, 8);
const Color ASSENT_COLOR = Color(0xFFe75f3f);
const Color DANGER_COLOR = Color.fromARGB(255, 236, 62, 62);

const Color CHARCOAL = Color(0xFF515151);
const Color BLACK_GREY = Color(0xff777777);
const Color BLACK_GREY1 = Color.fromARGB(255, 177, 175, 175);
const Color SOFT_GREY = Color(0xFFaaaaaa);
const Color SOFT_BLUE = Color(0xff01aed6);
const Color SOFT_BLUs = Color.fromARGB(255, 17, 31, 158);

const int STATUS_OK = 200;
const int STATUS_BAD_REQUEST = 400;
const int STATUS_NOT_AUTHORIZED = 403;
const int STATUS_NOT_FOUND = 404;
const int STATUS_INTERNAL_ERROR = 500;

const String ERROR_OCCURED = 'Error occured, please try again later';

const String SESSION_ID = '5f0e6bfbafe255.00218389';
const int LIMIT_PAGE = 8;

const String GLOBAL_URL = 'https://ijtechnology.net/assets/images/api/ijshop';
//const String GLOBAL_URL = 'http://192.168.0.4/ijshop';

const String SERVER_URL = 'https://ijtechnology.net/api_ijshop/';

class BottomNavItem {
  IconData icon;
  String label;
  Widget page;
  GlobalKey? key;

  BottomNavItem(
      {required this.icon, required this.label, required this.page, this.key});
}

List<BottomNavItem> defaultBottomNavItems = [
  BottomNavItem(
      icon: Icons.holiday_village_outlined, label: 'groups', page: Container()),
  BottomNavItem(
      icon: Icons.newspaper_rounded, label: 'document', page: Container()),
  BottomNavItem(
      icon: Icons.devices_fold_outlined, label: 'room', page: Container()),
  BottomNavItem(
      icon: Icons.person_pin_rounded, label: 'account', page: Container()),
];

List<BottomNavItem> navItems = [
  BottomNavItem(
      icon: Icons.newspaper_rounded, label: 'groups', page: Container()),
  BottomNavItem(
      icon: Icons.devices_fold_outlined, label: 'document', page: Container()),
  BottomNavItem(icon: Icons.description, label: 'room', page: Container()),
  BottomNavItem(
      icon: Icons.person_pin_rounded, label: 'account', page: Container()),
];

const String ADDRESS_API = SERVER_URL + "account/getAddress";
const String LAST_SEEN_PRODUCT_API = SERVER_URL + "account/getLastSeen";
const String ORDER_LIST_API = SERVER_URL + "account/getOrderList";
const String RELATED_PRODUCT_API = SERVER_URL + "general/getRelatedProduct";
const String REVIEW_API = SERVER_URL + "general/getReview";
const String CATEGORY_API = SERVER_URL + "home/category/getCategory";
const String CATEGORY_All_PRODUCT_API =
    SERVER_URL + "home/category/getCategoryAllProduct";
const String CATEGORY_BANNER_API =
    SERVER_URL + "home/category/getCategoryBanner";
const String CATEGORY_FOR_YOU_API =
    SERVER_URL + "home/category/getCategoryForYou";
const String CATEGORY_TRENDING_PRODUCT_API =
    SERVER_URL + "home/category/getCategoryTrendingProduct";
const String CATEGORY_NEW_PRODUCT_API =
    SERVER_URL + "home/category/getCategoryNewProduct";
const String SEARCH_API = SERVER_URL + "home/search/getSearch";
const String SEARCH_PRODUCT_API = SERVER_URL + "home/search/getSearchProduct";
const String COUPON_API = SERVER_URL + "home/getCoupon";
const String COUPON_DETAIL_API = SERVER_URL + "home/getCouponDetail";
const String FLASHSALE_API = SERVER_URL + "home/getFlashsale";
const String HOME_BANNER_API = SERVER_URL + "home/getHomeBanner";
const String HOME_TRENDING_API = SERVER_URL + "home/getHomeTrending";
const String LAST_SEARCH_API = SERVER_URL + "home/getLastSearch";
const String LAST_SEARCH_INFINITE_API =
    SERVER_URL + "home/getLastSearchInfinite";
const String RECOMENDED_PRODUCT_API = SERVER_URL + "home/getRecomendedProduct";
const String SHOPPING_CART_API = SERVER_URL + "shopping_cart/getShoppingCart";
const String WISHLIST_API = SERVER_URL + "wishlist/getWishlist";
