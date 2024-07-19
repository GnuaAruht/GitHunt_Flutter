import 'package:flutter/material.dart';
import 'package:githunt_flutter/core/repository/app_repository.dart';

class PATProvider extends ChangeNotifier {

  final AppRepository repo;

  late bool _tokenAdded;
  bool get tokenAdded => _tokenAdded;

  late bool _bannerClosed;
  bool get bannerClosed => _bannerClosed;

  bool get shouldShowBanner => !(tokenAdded || bannerClosed);

  static Future<PATProvider> create({required AppRepository repo}) async {
    final tokenAdded = await repo.checkIfTokenAdded();
    final bannerClosed = await repo.checkIfBannerClosed();
    return PATProvider._(
      repo: repo,
      tokenAdded: tokenAdded,
      bannerClosed: bannerClosed,
    );
  }

  PATProvider._({
    required this.repo,
    required bool tokenAdded,
    required bool bannerClosed,
  }) {
    _tokenAdded = tokenAdded;
    _bannerClosed = bannerClosed;
  }

  Future<void> markBannerClosed() async {
    await repo.markAsBannerClosed();
    _bannerClosed = true;
    notifyListeners();
  }

  Future<void> addToken(String token) async {
    await repo.saveGithubToken(token);
    _tokenAdded = true;
    notifyListeners();
  }

  void clearToken() async {
    await repo.clearGitHubToken();
    _tokenAdded = false;
    notifyListeners();
  }

}
