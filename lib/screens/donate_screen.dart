import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/theme/section_themes.dart';
import '../gen/strings.g.dart';

class DonateScreen extends StatelessWidget {
  const DonateScreen({super.key});

  static final Uri _buyMeACoffeeUri = Uri.parse(
    'https://buymeacoffee.com/rabinapps',
  );
  static final Uri _paypalUri = Uri.parse(
    'https://www.paypal.com/donate/?hosted_button_id=YEJ37WF4Q3HPC',
  );

  @override
  Widget build(BuildContext context) {
    final theme = SectionThemes.homeLocalized(context);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: theme.backgroundGradient,
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.volunteer_activism_rounded,
                  size: 72,
                  color: theme.accentColor,
                ),
                const SizedBox(height: 20),
                Text(
                  context.t.donate.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  context.t.donate.subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.72),
                    fontSize: 15,
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: 28),
                Wrap(
                  spacing: 14,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: [
                    FilledButton.icon(
                      onPressed: () => _openLink(context, _buyMeACoffeeUri),
                      icon: const Icon(Icons.coffee_rounded),
                      label: Text(context.t.donate.buyMeACoffee),
                      style: FilledButton.styleFrom(
                        backgroundColor: theme.accentColor,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 14,
                        ),
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: () => _openLink(context, _paypalUri),
                      icon: const Icon(Icons.account_balance_wallet_rounded),
                      label: Text(context.t.donate.paypalDonate),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: BorderSide(
                          color: Colors.white.withValues(alpha: 0.35),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _openLink(BuildContext context, Uri uri) async {
    final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!launched && context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.t.donate.openLinkFailed)));
    }
  }
}
