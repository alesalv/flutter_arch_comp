import 'package:flutter/material.dart';
import 'package:flutter_arch_comp/src/core/views/pages/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../settings/controllers/settings_controller.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  ConsumerState<SplashPage> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((final _) => _afterSplash(context));
  }

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: Text('Flutter Architecture Components'),
      ),
    );
  }

  Future<void> _afterSplash(BuildContext context) async {
    // initialize the settings controller
    await ref.read(settingsControllerProvider).loadSettings();

    Navigator.restorablePushNamed(context, HomePage.routeName);
  }
}
