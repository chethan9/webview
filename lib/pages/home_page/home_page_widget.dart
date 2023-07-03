import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white, // Replace with your theme's background color
        body: SafeArea(
          top: true,
          child: InAppWebView(
            initialUrlRequest: URLRequest(
              url: Uri.parse('https://chethan9.github.io/player/'),
            ),
            onEnterFullscreen: (FullscreenRequest fullscreenRequest) async {
              // Here you can adjust the size of the InAppWebView widget
              // to make it take up the whole screen.
              // You might need to use setState to trigger a rebuild of the widget.
              return Future.value(true);
            },
          ),
        ),
      ),
    );
  }
}
