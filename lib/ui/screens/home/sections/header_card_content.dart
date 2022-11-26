part of '../home.dart';

class _HeaderCardContent extends StatelessWidget {
  static const double height = 582;

  void _onSelectCategory(Category category) {
    AppNavigator.push(category.route);
  }

  @override
  Widget build(BuildContext context) {
    var themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    var isDark = themeCubit.isDark;

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: PokeballBackground(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SafeArea(
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      themeCubit.toggleTheme();
                    },
                    padding: EdgeInsets.only(
                      left: 28,
                    ),
                    icon: Icon(
                      isDark ? Icons.wb_sunny_outlined : Icons.dark_mode_outlined,
                      color: isDark ? Colors.yellow : Colors.black,
                      size: 25,
                    )),
              ),
            ),
            _buildTitle(),
            SearchBar(),
            _buildCategories(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Expanded(
      child: Container(
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.all(28),
        alignment: Alignment.bottomLeft,
        child:Center(
          child:Text(
          'PokeGo',
          style: TextStyle(
            fontSize: 45,
            height: 2,
            fontWeight: FontWeight.w900,
          ),
        ),
        ) 
      ),
    );
  }

  Widget _buildCategories(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.fromLTRB(28, 42, 28, 62),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        childAspectRatio: 2.6,
        mainAxisSpacing: 15,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CategoryCard(
          categories[index],
          onPress: () => _onSelectCategory(categories[index]),
        );
      },
    );
  }
}
