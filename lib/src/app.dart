import 'package:movie_app/src/core/theme/extended_text_theme.dart';
import 'package:movie_app/src/core/ui.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eMovie',
      theme: AppTheme.theme(context),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('eMovie')),
        body: Center(
          child: Text(
            'Hello World',
            style: ExtendedTextTheme.displaySmall(context),
          ),
        ),
      ),
    );
  }
}
