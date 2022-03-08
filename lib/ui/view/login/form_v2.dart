import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/constant/constant_asset.dart';
import 'package:fmh_mobile/core/constant/strings_constant.dart';
import 'package:fmh_mobile/core/model/country_model.dart';
import 'package:fmh_mobile/core/service/localization/get_localization.dart';
import 'package:fmh_mobile/core/theme/google_font_syle.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';
import 'package:fmh_mobile/core/viewmodel/login_vm.dart';
import 'package:fmh_mobile/ui/widget/custom_button.dart';

class FormV2 extends StatelessWidget {
  const FormV2({
    required this.ref,
    Key? key,
  }) : super(key: key);

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final List<CountryModel> _countryList =
        ref.watch(vmProvider.select((vm) => vm.getCountryList));
    final CountryModel? _selectedCountry =
        ref.watch(vmProvider.select((vm) => vm.getSelectedCountry));
    final String? _phoneNumber =
        ref.watch(vmProvider.select((vm) => vm.getPhoneNumber));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
          child: Text(
            getLocalization.mobileNumber,
            style: GoogleStyle.bodyText.copyWith(color: ThemeColor.gray700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: TextField(
            onChanged: (text) {
              ref.read<LoginVM>(vmProvider).setPhoneNumber(text);
            },
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              hintText: getLocalization.mobileNumberHint,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 2),
                child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      _showCountryFlagOptions(context, _countryList);
                    },
                    child:
                        Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Image.asset(
                            _selectedCountry?.image ?? ConstantAsset.flagMY),
                      ),
                      const Icon(Icons.keyboard_arrow_down,
                          color: ThemeColor.gray500),
                    ]),
                  ),
                  const SizedBox(width: 5),
                  Text(_selectedCountry?.code ?? ConstantStrings.countryCodeMY,
                      style: GoogleStyle.bodyText)
                ]),
              ),
            ),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
              FilteringTextInputFormatter.deny(RegExp('^0+')),
            ],
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 14, 20, 0),
          child: CustomButton(
            enable: _phoneNumber?.isNotEmpty ?? false,
            height: 44,
            enableColor: ThemeColor.sunny400,
            disableColor: ThemeColor.sunny200,
            disableTextColor: ThemeColor.brass200,
            text: getLocalization.continueText.toUpperCase(),
            callback: _continueCallback,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
          child: RichText(
            text: TextSpan(
                text: getLocalization.termsOfUseStatement,
                style: GoogleStyle.caption,
                children: <TextSpan>[
                  TextSpan(
                    text: ' ${getLocalization.termsOfUse.toLowerCase()}',
                    style:
                        GoogleStyle.caption.copyWith(color: ThemeColor.blue400),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                  TextSpan(text: ' ${getLocalization.and}'),
                  TextSpan(
                      text: ' ${getLocalization.privacyPolicy.toLowerCase()}',
                      style: GoogleStyle.caption
                          .copyWith(color: ThemeColor.blue400),
                      recognizer: TapGestureRecognizer()..onTap = () {}),
                  TextSpan(text: '.'),
                ]),
          ),
        ),
      ],
    );
  }

  Future<void> _showCountryFlagOptions(
      BuildContext context, List<CountryModel> countryList) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            color: ThemeColor.white,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: countryList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      ref
                          .read<LoginVM>(vmProvider)
                          .setSelectedCountry(countryList[index]);
                      Navigator.of(context).pop();
                    },
                    title: Row(
                      children: [
                        Image.asset(
                            countryList[index].image ?? ConstantAsset.flagMY),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(countryList[index].name ?? ''),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        );
      },
    );
  }

  void _continueCallback() {}
}
