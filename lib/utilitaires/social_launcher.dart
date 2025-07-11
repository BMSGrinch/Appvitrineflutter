import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

Future<void> openSocialLink(BuildContext context, String url) async {
  final uri = Uri.parse(url);

  try {
    final canOpenExternal = await canLaunchUrl(uri);
    if (canOpenExternal) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (uri.scheme == 'http' || uri.scheme == 'https') {
        await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Impossible d'ouvrir le lien : $url")),
        );
      }
    }
  } catch (e) {
    ScaffoldMessenger.of(
      // ignore: use_build_context_synchronously
      context,
    ).showSnackBar(SnackBar(content: Text("Erreur :${e.toString()}")));
  }

  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: 'huileenpoudre@gmail.com',
    query: Uri.encodeFull(
      'subject=Commande&body=Bonjour,je shouhaite passer une commande',
    ),
  );
  await launchUrl(emailUri, mode: LaunchMode.externalApplication);
}
