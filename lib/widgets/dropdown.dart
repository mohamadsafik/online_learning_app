import 'package:online_learning_app/export.dart';

class DropDown extends StatefulWidget {
  DropDown({super.key});
  final List<String> role = [
    'Mahasiswa',
    'Dosen',
  ];
  String? selectedRole;
  String roleValue = '';
  final _formKey = GlobalKey<FormState>();

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          hint: Row(
            children: [
              const Icon(
                Icons.account_circle_outlined,
                size: 20,
                color: kGreyColor,
              ),
              const SizedBox(
                width: 14,
              ),
              Expanded(
                child: Text(
                  'Pilih Role',
                  style: greyTextStyle.copyWith(
                    fontSize: 14,
                    color: kGreyColor,
                    fontWeight: regular,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: widget.role
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: regular,
                      color: kBlackColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
              .toList(),
          value: widget.selectedRole,
          onChanged: (value) {
            setState(() {
              widget.selectedRole = value as String;
              widget.roleValue = value;
            });
          },
          //
          icon: const Icon(Icons.keyboard_arrow_down),
          iconSize: 24,
          iconEnabledColor: kPrimaryColor,
          iconDisabledColor: kGreyColor,
          buttonHeight: 60,
          buttonWidth: double.infinity,
          buttonPadding: const EdgeInsets.only(left: 14, right: 14),
          buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: kGreyColor,
            ),
            color: Colors.transparent,
          ),
          buttonElevation: 0,
          itemHeight: 50,
          itemPadding: const EdgeInsets.only(left: 14, right: 14),
          dropdownMaxHeight: 200,
          dropdownWidth: 290,
          dropdownPadding: null,
          dropdownDecoration: BoxDecoration(
            border: Border.all(color: kGreyColor),
            borderRadius: BorderRadius.circular(20),
          ),
          dropdownElevation: 0,
          scrollbarRadius: const Radius.circular(40),
          scrollbarThickness: 6,
          scrollbarAlwaysShow: true,
        ),
      ),
    );
  }
}
