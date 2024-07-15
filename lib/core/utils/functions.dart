import 'app_strings.dart';

String currentPrice(double price, double discountPercentage) {
  String newPrice = (price - (price * discountPercentage ~/ 100)).toString();
  return "$newPrice ${AppStrings.egb}";
}
