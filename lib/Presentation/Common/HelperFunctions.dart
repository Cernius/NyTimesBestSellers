import 'package:loadmore/loadmore.dart';

import '../../Common/AppModule.dart';
import 'Localizations/Strings.dart';

LoadMoreTextBuilder getLoadMoreTextBuilder() {
  return (status) {
    Strings strings = injector.get<Strings>();
    switch (status) {
      case LoadMoreStatus.idle:
        return "idle";
      case LoadMoreStatus.loading:
        return strings.loading;
      case LoadMoreStatus.fail:
        return strings.networkError;
      case LoadMoreStatus.nomore:
        return "";
      default:
        return "";
    }
  };
}
