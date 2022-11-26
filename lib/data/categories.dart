import 'package:pokego/configs/colors.dart';
import 'package:pokego/domain/entities/category.dart';
import 'package:pokego/routes.dart';

const List<Category> categories = [
  Category(name: 'PokeGo', color: AppColors.teal, route: Routes.pokedex),
  Category(name: 'Abilities', color: AppColors.blue, route: Routes.pokedex),
  Category(name: 'Items', color: AppColors.yellow, route: Routes.items),
  Category(name: 'Locations', color: AppColors.purple, route: Routes.pokedex),
];
