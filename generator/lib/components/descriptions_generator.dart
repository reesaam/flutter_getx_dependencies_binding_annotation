import '../resources/constants.dart';
import '../resources/info.dart';
import '../resources/strings.dart';

/// This class will provide descriptions and comments
/// I wrote this class for my use, so I can generate and add comment will some flags and have a much less code and comment writing

class DescriptionGenerator {
  String result = '';

  String generate({
    bool? all,
    bool? caution,
    bool? authorInfo,
    bool? packageInfo,
    bool? description,
  }) {
    if (all == true || caution == true) {
      _addLine(_caution);
      _addSpace();
    }
    if (all == true || description == true) {
      _addLine('Dependencies binding annotation generator for [ GetX State Manager ]');
      _addLine('This file will provide mandatory dependencies for [ GetMaterialApp ]');
      _addLine('Including:');
      _addLineWithSpace('- Pages');
      _addLineWithSpace('- Controllers');
      _addLineWithSpace('- Components');
      _addLineWithSpace('- Repositories');
      _addSpace();
      _addLine('Generator will generate a file with \'.${PackageInfo.generatedFilesPrefix}.dart\' format in the lib/ root fot using in \'main.dart\'');
      _addLine('You can see how to use the generated class in the main in the GetMaterialApp as [example]');
      _addBigSpace();
    }
    if (all == true || packageInfo == true) {
      _addLine('Package:');
      _addLineWithSpace('Package Last Version: [ ${PackageAuthorInfo.version} ]');
      _addLineWithSpace('Package Name: [ ${PackageAuthorInfo.packageName} ]');
      _addLineWithSpace('Package Description: [ ${PackageAuthorInfo.packageNameDescription} ]');
      _addLineWithSpace('Package Address: [ ${PackageAuthorInfo.packageAddress} ]');
      _addLineWithSpace('Package GitHubRepositoryAddress: [ ${PackageAuthorInfo.packageGitHubRepositoryAddress} ]');
      _addBigSpace();
    }
    if (all == true || authorInfo == true) {
      _addLine('Written and Provided by:');
      _addLineWithSpace('[ ${PackageAuthorInfo.authorName} ]');
      _addLineWithSpace('Email: [ ${PackageAuthorInfo.emailAddress} ]');
      _addLineWithSpace('Website: [ ${PackageAuthorInfo.websiteAddress} ]');
      _addLineWithSpace('LinkedIn: [ ${PackageAuthorInfo.linkedinAddress} ]');
      _addLineWithSpace('GitHub: [ ${PackageAuthorInfo.githubAddress} ]');
      _addBigSpace();
    }
    return result;
  }

  String get _caution => 'GENERATED CODE - DO NOT MODIFY BY HAND EVER';

  String _addLine(String line, {bool? space}) => result += '///  ${space == true ? Strings.space : Strings.empty}$line\n';
  String _addLineWithSpace(String line) => _addLine(line, space: true);
  String _addSpace() => result += '\n';
  String _addBigSpace() => result += '\n\n';
}
