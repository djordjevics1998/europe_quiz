import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart' deferred as app_localizations_en;
import 'app_localizations_sr.dart' deferred as app_localizations_sr;

/// Callers can lookup localized strings with an instance of EuropeQuizAppLocalizations
/// returned by `EuropeQuizAppLocalizations.of(context)`.
///
/// Applications need to include `EuropeQuizAppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: EuropeQuizAppLocalizations.localizationsDelegates,
///   supportedLocales: EuropeQuizAppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the EuropeQuizAppLocalizations.supportedLocales
/// property.
abstract class EuropeQuizAppLocalizations {
  EuropeQuizAppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static EuropeQuizAppLocalizations? of(BuildContext context) {
    return Localizations.of<EuropeQuizAppLocalizations>(context, EuropeQuizAppLocalizations);
  }

  static const LocalizationsDelegate<EuropeQuizAppLocalizations> delegate = _EuropeQuizAppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('sr')
  ];

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Europe quiz'**
  String get title;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @stop.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get stop;

  /// No description provided for @albania.
  ///
  /// In en, this message translates to:
  /// **'Albania'**
  String get albania;

  /// No description provided for @andora.
  ///
  /// In en, this message translates to:
  /// **'Andora'**
  String get andora;

  /// No description provided for @austria.
  ///
  /// In en, this message translates to:
  /// **'Austria'**
  String get austria;

  /// No description provided for @belarus.
  ///
  /// In en, this message translates to:
  /// **'Belarus'**
  String get belarus;

  /// No description provided for @belgium.
  ///
  /// In en, this message translates to:
  /// **'Belgium'**
  String get belgium;

  /// No description provided for @bosnia.
  ///
  /// In en, this message translates to:
  /// **'Bosnia & Herzegovina'**
  String get bosnia;

  /// No description provided for @bulgaria.
  ///
  /// In en, this message translates to:
  /// **'Bulgaria'**
  String get bulgaria;

  /// No description provided for @croatia.
  ///
  /// In en, this message translates to:
  /// **'Croatia'**
  String get croatia;

  /// No description provided for @cyprus.
  ///
  /// In en, this message translates to:
  /// **'Cyprus'**
  String get cyprus;

  /// No description provided for @czechia.
  ///
  /// In en, this message translates to:
  /// **'Czechia'**
  String get czechia;

  /// No description provided for @denmark.
  ///
  /// In en, this message translates to:
  /// **'Denmark'**
  String get denmark;

  /// No description provided for @estonia.
  ///
  /// In en, this message translates to:
  /// **'Estonia'**
  String get estonia;

  /// No description provided for @finland.
  ///
  /// In en, this message translates to:
  /// **'Finland'**
  String get finland;

  /// No description provided for @france.
  ///
  /// In en, this message translates to:
  /// **'France'**
  String get france;

  /// No description provided for @germany.
  ///
  /// In en, this message translates to:
  /// **'Germany'**
  String get germany;

  /// No description provided for @great_britain.
  ///
  /// In en, this message translates to:
  /// **'Great Britain'**
  String get great_britain;

  /// No description provided for @greece.
  ///
  /// In en, this message translates to:
  /// **'Greece'**
  String get greece;

  /// No description provided for @hungary.
  ///
  /// In en, this message translates to:
  /// **'Hungary'**
  String get hungary;

  /// No description provided for @iceland.
  ///
  /// In en, this message translates to:
  /// **'Iceland'**
  String get iceland;

  /// No description provided for @ireland.
  ///
  /// In en, this message translates to:
  /// **'Ireland'**
  String get ireland;

  /// No description provided for @italy.
  ///
  /// In en, this message translates to:
  /// **'Italy'**
  String get italy;

  /// No description provided for @letonia.
  ///
  /// In en, this message translates to:
  /// **'Letonia'**
  String get letonia;

  /// No description provided for @lichtenstein.
  ///
  /// In en, this message translates to:
  /// **'Lichtenstein'**
  String get lichtenstein;

  /// No description provided for @litvania.
  ///
  /// In en, this message translates to:
  /// **'Litvania'**
  String get litvania;

  /// No description provided for @luxemburg.
  ///
  /// In en, this message translates to:
  /// **'Luxemburg'**
  String get luxemburg;

  /// No description provided for @malta.
  ///
  /// In en, this message translates to:
  /// **'Malta'**
  String get malta;

  /// No description provided for @moldavia.
  ///
  /// In en, this message translates to:
  /// **'Moldavia'**
  String get moldavia;

  /// No description provided for @monaco.
  ///
  /// In en, this message translates to:
  /// **'Monaco'**
  String get monaco;

  /// No description provided for @montenegro.
  ///
  /// In en, this message translates to:
  /// **'Montenegro'**
  String get montenegro;

  /// No description provided for @netherlands.
  ///
  /// In en, this message translates to:
  /// **'Netherlands'**
  String get netherlands;

  /// No description provided for @north_macedonia.
  ///
  /// In en, this message translates to:
  /// **'North Macedonia'**
  String get north_macedonia;

  /// No description provided for @norway.
  ///
  /// In en, this message translates to:
  /// **'Norway'**
  String get norway;

  /// No description provided for @poland.
  ///
  /// In en, this message translates to:
  /// **'Poland'**
  String get poland;

  /// No description provided for @portugal.
  ///
  /// In en, this message translates to:
  /// **'Portugal'**
  String get portugal;

  /// No description provided for @romania.
  ///
  /// In en, this message translates to:
  /// **'Romania'**
  String get romania;

  /// No description provided for @russia.
  ///
  /// In en, this message translates to:
  /// **'Russia'**
  String get russia;

  /// No description provided for @san_marino.
  ///
  /// In en, this message translates to:
  /// **'San Marino'**
  String get san_marino;

  /// No description provided for @serbia.
  ///
  /// In en, this message translates to:
  /// **'Serbia'**
  String get serbia;

  /// No description provided for @slovakia.
  ///
  /// In en, this message translates to:
  /// **'Slovakia'**
  String get slovakia;

  /// No description provided for @slovenia.
  ///
  /// In en, this message translates to:
  /// **'Slovenia'**
  String get slovenia;

  /// No description provided for @spain.
  ///
  /// In en, this message translates to:
  /// **'Spain'**
  String get spain;

  /// No description provided for @sweden.
  ///
  /// In en, this message translates to:
  /// **'Sweden'**
  String get sweden;

  /// No description provided for @switzerland.
  ///
  /// In en, this message translates to:
  /// **'Switzerland'**
  String get switzerland;

  /// No description provided for @turkey.
  ///
  /// In en, this message translates to:
  /// **'Turkey'**
  String get turkey;

  /// No description provided for @ukraine.
  ///
  /// In en, this message translates to:
  /// **'Ukraine'**
  String get ukraine;

  /// No description provided for @vatican.
  ///
  /// In en, this message translates to:
  /// **'Vatican'**
  String get vatican;
}

class _EuropeQuizAppLocalizationsDelegate extends LocalizationsDelegate<EuropeQuizAppLocalizations> {
  const _EuropeQuizAppLocalizationsDelegate();

  @override
  Future<EuropeQuizAppLocalizations> load(Locale locale) {
    return lookupEuropeQuizAppLocalizations(locale);
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'sr'].contains(locale.languageCode);

  @override
  bool shouldReload(_EuropeQuizAppLocalizationsDelegate old) => false;
}

Future<EuropeQuizAppLocalizations> lookupEuropeQuizAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return app_localizations_en.loadLibrary().then((dynamic _) => app_localizations_en.EuropeQuizAppLocalizationsEn());
    case 'sr': return app_localizations_sr.loadLibrary().then((dynamic _) => app_localizations_sr.EuropeQuizAppLocalizationsSr());
  }

  throw FlutterError(
    'EuropeQuizAppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
