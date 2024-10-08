import '../resources/constants.dart';
import '../resources/enums.dart';

/// This class is for logging in the terminal for being notified and also debugging
/// I can use it when I am developing
/// and You can use it to know whats happening and may help you to debug and also know what is happening in your app

class log {

  // Colors
  final _logColorsNormal = ['\x1B[32m', '\x1B[0m'];
  final _logColorsInfo = ['\x1B[35m', '\x1B[0m'];
  final _logColorsWarning = ['\x1B[33m', '\x1B[0m'];
  final _logColorsError = ['\x1B[31m', '\x1B[0m'];

  //Variables
  final String? title;
  final String? as;
  final dynamic data;

  // Different Constructors with different log types
  log({this.title, this.data}) : as = null {
    print('${_logColorsNormal[0]}[$elementsMainName] $title $_data ${_logColorsNormal[1]}');
  }

  log.info({this.title, this.data, this.as}) {
    print('${_logColorsInfo[0]}[$elementsMainName] [${LogType.info.typeName}] $title $_data $_as ${_logColorsInfo[1]}');
  }
  log.warning({this.title, this.data, this.as}) {
    print('${_logColorsWarning[0]}[$elementsMainName] [${LogType.warning.typeName}] $title $_data $_as ${_logColorsWarning[1]}');
  }
  log.error({this.title, this.data}) : as = null  {
    print('${_logColorsError[0]}[$elementsMainName] [${LogType.error.typeName}] $title $_data ${_logColorsError[1]}');
  }
  //Just add Space in the Terminal
  log.space() : title = null, data = null, as = null  {
    print('\n');
  }

  String get _data => data == null ? '' : ':  $data';
  String get _as => as == null ? '' : 'as $as';
}
