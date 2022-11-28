import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:clock2/widgets/animated_gradient_container.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatelessWidget {
  InfoScreen({super.key});

  final Widget background = AnimatedGradientContainer();
  String _version = 'not found';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // context.read<RotatingGradientProvider>().animatedGradientContainer,
        background,
        Scaffold(
          appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
          backgroundColor: Colors.transparent,
          body: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.extent(
                physics: const BouncingScrollPhysics(),
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  FrostedBox(
                    onTap: () async {
                      final Uri uri = Uri(
                        scheme: 'mailto',
                        path: 'clock2@chrisstayte.com',
                        query: 'subject=App Feedback ($_version)',
                      );

                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri);
                      }
                    },
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.paperPlane,
                            color: Colors.white,
                            size: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AutoSizeText(
                            'Suggestions',
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  FrostedBox(
                    onTap: () async {
                      final Uri uri = Uri(
                        scheme: 'https',
                        path: 'www.twitter.com/ChrisStayte',
                      );

                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri).catchError(
                          (error) {
                            print(error);
                            return false;
                          },
                        );
                      }
                    },
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.twitter,
                            color: Colors.white,
                            size: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AutoSizeText(
                            '@chrisstayte',
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  FrostedBox(
                    onTap: () => InAppReview.instance
                        .openStoreListing(appStoreId: '6443450819'),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.star,
                            color: Colors.white,
                            size: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AutoSizeText(
                            'Review',
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  FrostedBox(
                    onTap: () async {
                      final Uri uri = Uri(
                        scheme: 'https',
                        path: 'www.github.com/chrisstayte/clock2',
                      );

                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri).catchError(
                          (error) {
                            print(error);
                            return false;
                          },
                        );
                      }
                    },
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.github,
                            color: Colors.white,
                            size: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AutoSizeText(
                            'Open Source',
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  FrostedBox(
                    onTap: () async {
                      final Uri uri = Uri(
                        scheme: 'https',
                        path: 'www.chrisstayte.app/clock2/privacy',
                      );

                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri).catchError(
                          (error) {
                            print(error);
                            return false;
                          },
                        );
                      }
                    },
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.lock,
                            color: Colors.white,
                            size: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AutoSizeText(
                            'Privacy',
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  FrostedBox(
                    onTap: () async {
                      final Uri uri = Uri(
                        scheme: 'https',
                        path: 'www.chrisstayte.app/clock2/terms',
                      );
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri).catchError(
                          (error) {
                            print(error);
                            return false;
                          },
                        );
                      }
                    },
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.fileContract,
                            color: Colors.white,
                            size: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AutoSizeText(
                            'Terms of Service',
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  FrostedBox(
                    onTap: () => {},
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.circleInfo,
                            color: Colors.white,
                            size: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FutureBuilder(
                            future: PackageInfo.fromPlatform(),
                            builder:
                                (context, AsyncSnapshot<PackageInfo> snapshot) {
                              if (snapshot.hasData && snapshot.data != null) {
                                _version =
                                    '${snapshot.data!.version} (${snapshot.data!.buildNumber})';
                                return AutoSizeText(
                                  _version,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                  ),
                                );
                              } else {
                                return Text(
                                  'Loading...',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  FrostedBox(
                    onTap: () => {},
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.flutter_dash,
                            color: Colors.white,
                            size: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AutoSizeText(
                            'Made With Flutter',
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
                // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                //   crossAxisSpacing: 16,
                //   mainAxisSpacing: 16,
                //   maxCrossAxisExtent: 200,
                // ),
                // itemCount: informationBoxes.length,
                // itemBuilder: (_, index) => informationBoxes[index],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class FrostedBox extends StatelessWidget {
  const FrostedBox({super.key, this.child, this.onTap});

  final Widget? child;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GestureDetector(
        onTap: () => onTap?.call() ?? {},
        child: Container(
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
              ),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                    )
                  ],
                  border: Border.all(
                      color: Colors.white.withOpacity(0.2), width: 1.0),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0.2)
                    ],
                    stops: [0.0, 1.0],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
