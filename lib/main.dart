import 'dart:async';
import 'dart:math';

import 'package:europe_quiz/gen/assets.gen.dart';
import 'package:europe_quiz/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        EuropeQuizAppLocalizations.delegate,
      ],
      supportedLocales: EuropeQuizAppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

const _width = 1035.0, _height = 900.0;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final countriesImages = [
  EuropeQuizAppAssets.images.albania,
  EuropeQuizAppAssets.images.andora,
  EuropeQuizAppAssets.images.austria,
  EuropeQuizAppAssets.images.belarus,
  EuropeQuizAppAssets.images.belgium,
  EuropeQuizAppAssets.images.bosnia,
  EuropeQuizAppAssets.images.bulgaria,
  EuropeQuizAppAssets.images.croatia,
  EuropeQuizAppAssets.images.cyprus,
  EuropeQuizAppAssets.images.czechia,
  EuropeQuizAppAssets.images.denmark,
  EuropeQuizAppAssets.images.estonia,
  EuropeQuizAppAssets.images.finland,
  EuropeQuizAppAssets.images.france,
  EuropeQuizAppAssets.images.germany,
  EuropeQuizAppAssets.images.greatBritain,
  EuropeQuizAppAssets.images.greece,
  EuropeQuizAppAssets.images.hungary,
  EuropeQuizAppAssets.images.iceland,
  EuropeQuizAppAssets.images.ireland,
  EuropeQuizAppAssets.images.italy,
  EuropeQuizAppAssets.images.letonia,
  EuropeQuizAppAssets.images.lichtenstein,
  EuropeQuizAppAssets.images.litvania,
  EuropeQuizAppAssets.images.luxemburg,
  EuropeQuizAppAssets.images.malta,
  EuropeQuizAppAssets.images.moldavia,
  EuropeQuizAppAssets.images.monaco,
  EuropeQuizAppAssets.images.montenegro,
  EuropeQuizAppAssets.images.netherlands,
  EuropeQuizAppAssets.images.northMacedonia,
  EuropeQuizAppAssets.images.norway,
  EuropeQuizAppAssets.images.poland,
  EuropeQuizAppAssets.images.portugal,
  EuropeQuizAppAssets.images.romania,
  EuropeQuizAppAssets.images.russia,
  EuropeQuizAppAssets.images.sanMarino,
  EuropeQuizAppAssets.images.serbia,
  EuropeQuizAppAssets.images.slovakia,
  EuropeQuizAppAssets.images.slovenia,
  EuropeQuizAppAssets.images.spain,
  EuropeQuizAppAssets.images.sweden,
  EuropeQuizAppAssets.images.switzerland,
  EuropeQuizAppAssets.images.turkey,
  EuropeQuizAppAssets.images.ukraine,
  EuropeQuizAppAssets.images.vatican,
];

class _MyHomePageState extends State<MyHomePage> {
  Timer? timer;
  AssetGenImage? _current;
  
  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    const rowWidth = 150.0;
    return Scaffold(
      body: Title(title: EuropeQuizAppLocalizations.of(context)!.title, color: Colors.white,
      child: Center(child: LayoutBuilder(builder: (context, constraints) => constraints.maxWidth < constraints.maxHeight || constraints.maxWidth - constraints.maxHeight * _width / _height < rowWidth ?
        IntrinsicWidth(child: Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 5,),
              Text(_current == null ? '' : _getCountryName(_current!, context), textAlign: TextAlign.center,),
              const SizedBox(height: 5,),
              Flexible(child: _ContinentView(countriesImages: countriesImages, current: _current,)),
              const SizedBox(height: 5,),
              ElevatedButton(onPressed: _onStartStopPressed, child: Text(timer == null ? EuropeQuizAppLocalizations.of(context)!.start : EuropeQuizAppLocalizations.of(context)!.stop)),
              const SizedBox(height: 5,),
            ],),
        ) :
        Row(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _ContinentView(countriesImages: countriesImages, current: _current,),
            const SizedBox(width: 5,),
            SizedBox(width: rowWidth - 10, child: Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(_current == null ? '' : _getCountryName(_current!, context), textAlign: TextAlign.center,),
              const SizedBox(height: 5,),
              ElevatedButton(onPressed: _onStartStopPressed, child: Text(timer == null ? EuropeQuizAppLocalizations.of(context)!.start : EuropeQuizAppLocalizations.of(context)!.stop)),
            ],)),
            const SizedBox(width: 5,),
          ],
        ),)),),
    );
  }

  void _onStartStopPressed() => setState(() {
    if(timer == null) {
      timer = Timer.periodic(const Duration(milliseconds: 400), (timer) {
        if(!mounted || !timer.isActive) return;
        setState(() {
          _current = countriesImages[Random().nextInt(countriesImages.length)];
        });
      });
    } else {
      timer!.cancel();
      timer = null;
    }
  });

  @override
  void dispose() {
    if(timer != null) timer!.cancel();
    super.dispose();
  }
}

class _ContinentView extends StatelessWidget {
  final List<AssetGenImage> countriesImages;
  final AssetGenImage? current;

  const _ContinentView({required this.countriesImages, this.current});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(aspectRatio: _width / _height,
      child: Stack(
        children: [
          Container(color: Colors.blue,),
          ...countriesImages.map<Image>((e) => e.image(color: e == current ? Colors.red : null),).toList(growable: false),
        ],
      ),
    );
  }
}

String _getCountryName(AssetGenImage country, BuildContext context) {
  String? name;
  if(country == EuropeQuizAppAssets.images.albania) {
    name = EuropeQuizAppLocalizations.of(context)!.albania;
  } else if(country == EuropeQuizAppAssets.images.andora) {
    name = EuropeQuizAppLocalizations.of(context)!.andora;
  } else if(country == EuropeQuizAppAssets.images.austria) {
    name = EuropeQuizAppLocalizations.of(context)!.austria;
  } else if(country == EuropeQuizAppAssets.images.belarus) {
    name = EuropeQuizAppLocalizations.of(context)!.belarus;
  } else if(country == EuropeQuizAppAssets.images.belgium) {
    name = EuropeQuizAppLocalizations.of(context)!.belgium;
  } else if(country == EuropeQuizAppAssets.images.bosnia) {
    name = EuropeQuizAppLocalizations.of(context)!.bosnia;
  } else if(country == EuropeQuizAppAssets.images.bulgaria) {
    name = EuropeQuizAppLocalizations.of(context)!.bulgaria;
  } else if(country == EuropeQuizAppAssets.images.croatia) {
    name = EuropeQuizAppLocalizations.of(context)!.croatia;
  } else if(country == EuropeQuizAppAssets.images.cyprus) {
    name = EuropeQuizAppLocalizations.of(context)!.cyprus;
  } else if(country == EuropeQuizAppAssets.images.czechia) {
    name = EuropeQuizAppLocalizations.of(context)!.czechia;
  } else if(country == EuropeQuizAppAssets.images.denmark) {
    name = EuropeQuizAppLocalizations.of(context)!.denmark;
  } else if(country == EuropeQuizAppAssets.images.estonia) {
    name = EuropeQuizAppLocalizations.of(context)!.estonia;
  } else if(country == EuropeQuizAppAssets.images.finland) {
    name = EuropeQuizAppLocalizations.of(context)!.finland;
  } else if(country == EuropeQuizAppAssets.images.france) {
    name = EuropeQuizAppLocalizations.of(context)!.france;
  } else if(country == EuropeQuizAppAssets.images.germany) {
    name = EuropeQuizAppLocalizations.of(context)!.germany;
  } else if(country == EuropeQuizAppAssets.images.greatBritain) {
    name = EuropeQuizAppLocalizations.of(context)!.great_britain;
  } else if(country == EuropeQuizAppAssets.images.greece) {
    name = EuropeQuizAppLocalizations.of(context)!.greece;
  } else if(country == EuropeQuizAppAssets.images.hungary) {
    name = EuropeQuizAppLocalizations.of(context)!.hungary;
  } else if(country == EuropeQuizAppAssets.images.iceland) {
    name = EuropeQuizAppLocalizations.of(context)!.iceland;
  } else if(country == EuropeQuizAppAssets.images.ireland) {
    name = EuropeQuizAppLocalizations.of(context)!.ireland;
  } else if(country == EuropeQuizAppAssets.images.italy) {
    name = EuropeQuizAppLocalizations.of(context)!.italy;
  } else if(country == EuropeQuizAppAssets.images.letonia) {
    name = EuropeQuizAppLocalizations.of(context)!.letonia;
  } else if(country == EuropeQuizAppAssets.images.lichtenstein) {
    name = EuropeQuizAppLocalizations.of(context)!.lichtenstein;
  } else if(country == EuropeQuizAppAssets.images.litvania) {
    name = EuropeQuizAppLocalizations.of(context)!.litvania;
  } else if(country == EuropeQuizAppAssets.images.luxemburg) {
    name = EuropeQuizAppLocalizations.of(context)!.luxemburg;
  } else if(country == EuropeQuizAppAssets.images.malta) {
    name = EuropeQuizAppLocalizations.of(context)!.malta;
  } else if(country == EuropeQuizAppAssets.images.moldavia) {
    name = EuropeQuizAppLocalizations.of(context)!.moldavia;
  } else if(country == EuropeQuizAppAssets.images.monaco) {
    name = EuropeQuizAppLocalizations.of(context)!.monaco;
  } else if(country == EuropeQuizAppAssets.images.montenegro) {
    name = EuropeQuizAppLocalizations.of(context)!.montenegro;
  } else if(country == EuropeQuizAppAssets.images.netherlands) {
    name = EuropeQuizAppLocalizations.of(context)!.netherlands;
  } else if(country == EuropeQuizAppAssets.images.northMacedonia) {
    name = EuropeQuizAppLocalizations.of(context)!.north_macedonia;
  } else if(country == EuropeQuizAppAssets.images.norway) {
    name = EuropeQuizAppLocalizations.of(context)!.norway;
  } else if(country == EuropeQuizAppAssets.images.poland) {
    name = EuropeQuizAppLocalizations.of(context)!.poland;
  } else if(country == EuropeQuizAppAssets.images.portugal) {
    name = EuropeQuizAppLocalizations.of(context)!.portugal;
  } else if(country == EuropeQuizAppAssets.images.romania) {
    name = EuropeQuizAppLocalizations.of(context)!.romania;
  } else if(country == EuropeQuizAppAssets.images.russia) {
    name = EuropeQuizAppLocalizations.of(context)!.russia;
  } else if(country == EuropeQuizAppAssets.images.sanMarino) {
    name = EuropeQuizAppLocalizations.of(context)!.san_marino;
  } else if(country == EuropeQuizAppAssets.images.serbia) {
    name = EuropeQuizAppLocalizations.of(context)!.serbia;
  } else if(country == EuropeQuizAppAssets.images.slovakia) {
    name = EuropeQuizAppLocalizations.of(context)!.slovakia;
  } else if(country == EuropeQuizAppAssets.images.slovenia) {
    name = EuropeQuizAppLocalizations.of(context)!.slovenia;
  } else if(country == EuropeQuizAppAssets.images.spain) {
    name = EuropeQuizAppLocalizations.of(context)!.spain;
  } else if(country == EuropeQuizAppAssets.images.sweden) {
    name = EuropeQuizAppLocalizations.of(context)!.sweden;
  } else if(country == EuropeQuizAppAssets.images.switzerland) {
    name = EuropeQuizAppLocalizations.of(context)!.switzerland;
  } else if(country == EuropeQuizAppAssets.images.turkey) {
    name = EuropeQuizAppLocalizations.of(context)!.turkey;
  } else if(country == EuropeQuizAppAssets.images.ukraine) {
    name = EuropeQuizAppLocalizations.of(context)!.ukraine;
  } else if(country == EuropeQuizAppAssets.images.vatican) {
    name = EuropeQuizAppLocalizations.of(context)!.vatican;
  }
  return name!;
}