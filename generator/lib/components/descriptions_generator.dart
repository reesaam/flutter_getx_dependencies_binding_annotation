import '../resources/info.dart';

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
      _addLine('  Including:');
      _addLine('    - Pages');
      _addLine('    - Injected Dependencies:');
      _addLine('      - Controllers');
      _addLine('      - Components');
      _addLine('      - Repositories');
      _addBigSpace();
    }
    if (all == true || packageInfo == true) {
      _addLine('Package:');
      _addLine('  Package Last Version: [ ${PackageAuthorInfo.version} ]');
      _addLine('  Package Name: [ ${PackageAuthorInfo.packageName} ]');
      _addLine('  Package Description: [ ${PackageAuthorInfo.packageNameDescription} ]');
      _addLine('  Package Address: [ ${PackageAuthorInfo.packageAddress} ]');
      _addLine('  Package GitHubRepositoryAddress: [ ${PackageAuthorInfo.packageGitHubRepositoryAddress} ]');
      _addBigSpace();
    }
    if (all == true || authorInfo == true) {
      _addLine('Written and Provided by:');
      _addLine('  [ ${PackageAuthorInfo.authorName} ]');
      _addLine('  Email: [ ${PackageAuthorInfo.emailAddress} ]');
      _addLine('  Website: [ ${PackageAuthorInfo.websiteAddress} ]');
      _addLine('  LinkedIn: [ ${PackageAuthorInfo.linkedinAddress} ]');
      _addLine('  GitHub: [ ${PackageAuthorInfo.githubAddress} ]');
      _addBigSpace();
    }
    return result;
  }

  String get _caution => 'GENERATED CODE - DO NOT MODIFY BY HAND EVER';

  String _addLine(String line) => result += '///  $line\n';
  String _addSpace() => result += '\n';
  String _addBigSpace() => result += '\n\n';
}
