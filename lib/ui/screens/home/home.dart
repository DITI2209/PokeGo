import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokego/configs/colors.dart';
import 'package:pokego/configs/images.dart';
import 'package:pokego/data/categories.dart';
import 'package:pokego/domain/entities/category.dart';
import 'package:pokego/ui/widgets/search_bar.dart';
import 'package:pokego/ui/widgets/pokeball_background.dart';
import 'package:pokego/routes.dart';

import 'package:pokego/states/theme/theme_cubit.dart';
import 'package:pokego/ui/screens/home/widgets/news_card.dart';
import 'widgets/category_card.dart';

part 'sections/pokemon_news.dart';
part 'sections/header_card_content.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool showTitle = false;

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    _scrollController.addListener(_onScroll);

    super.initState();
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
    await AppNavigator.replaceWith(Routes.login);
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final offset = _scrollController.offset;
    final showTitle = offset > _HeaderCardContent.height - kToolbarHeight;

    if (this.showTitle == showTitle) return;
    setState(() {
      this.showTitle = showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (_, __) => [
            SliverAppBar(
              expandedHeight: _HeaderCardContent.height,
              floating: true,
              pinned: true,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              backgroundColor: AppColors.red,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                centerTitle: true,
                title: Visibility(
                  visible: showTitle,
                  child: Text(
                    'PokeGo',
                    style: Theme.of(context)
                        .appBarTheme
                        .toolbarTextStyle!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                background: _HeaderCardContent(),
              ),
            ),
          ],
          body: _PokemonNews(),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              signOut();
            },
            child: Icon(Icons.logout_rounded),
            backgroundColor: AppColors.brown));
  }
}
