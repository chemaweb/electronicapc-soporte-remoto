import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_hbb/common.dart';
import 'package:flutter_hbb/consts.dart';

/// Support contact button shown in the main window title bar.
///
/// Customization point for ElectrónicaPC.com: opens a WhatsApp chat with a
/// pre-filled support request message, using the official WhatsApp
/// "Click to Chat" link (no API key / business account required).
class WhatsAppSupportButton extends StatefulWidget {
  const WhatsAppSupportButton({Key? key}) : super(key: key);

  /// E.164 phone number without the leading '+', spaces or dashes.
  static const String phoneNumber = '34628914200';

  /// Message pre-filled in the WhatsApp chat box.
  static const String presetMessage =
      'Hola, solicito soporte remoto informático.';

  static Uri get _chatUri => Uri.parse(
      'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(presetMessage)}');

  static Future<void> openChat() async {
    await launchUrl(_chatUri, mode: LaunchMode.externalApplication);
  }

  @override
  State<WhatsAppSupportButton> createState() => _WhatsAppSupportButtonState();
}

class _WhatsAppSupportButtonState extends State<WhatsAppSupportButton> {
  final hover = false.obs;

  static const _size = 20.0;
  static const _whatsappGreen = Color(0xFF25D366);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: translate('Request remote support via WhatsApp'),
      waitDuration: const Duration(seconds: 1),
      child: InkWell(
        borderRadius: BorderRadius.circular(_size),
        onHover: (value) => hover.value = value,
        onTap: WhatsAppSupportButton.openChat,
        child: SizedBox(
          height: kDesktopRemoteTabBarHeight - 1,
          width: kDesktopRemoteTabBarHeight + 6,
          child: Center(
            child: Obx(
              () => AnimatedContainer(
                duration: const Duration(milliseconds: 120),
                width: _size,
                height: _size,
                decoration: BoxDecoration(
                  color: hover.value
                      ? _whatsappGreen
                      : _whatsappGreen.withOpacity(0.92),
                  shape: BoxShape.circle,
                  boxShadow: hover.value
                      ? [
                          BoxShadow(
                            color: _whatsappGreen.withOpacity(0.55),
                            blurRadius: 6,
                          )
                        ]
                      : null,
                ),
                padding: const EdgeInsets.all(4),
                child: SvgPicture.asset(
                  'assets/whatsapp.svg',
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
