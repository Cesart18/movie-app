import 'package:movie_app/src/core/foundation.dart';
import 'package:movie_app/src/core/ui/ui.dart';

import 'src/core/routes/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _dependencies(),
      child: MaterialApp.router(
        title: 'eMovie',
        theme: AppTheme.theme(context),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router(),
      ),
    );
  }
}

List<SingleChildWidget> _dependencies() {
  return [BlocProvider(create: (context) => SplashBloc())];
}
