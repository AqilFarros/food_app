part of 'pages.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  bool isLoading = false;
  List<String>? cities;
  String? selectedCity;

  @override
  void initState() {
    nameController.text =
        (context.read<UserCubit>().state as UserLoaded).user.name!;
    addressController.text =
        (context.read<UserCubit>().state as UserLoaded).user.address!;
    cityController.text =
        (context.read<UserCubit>().state as UserLoaded).user.city!;
    houseNumberController.text =
        (context.read<UserCubit>().state as UserLoaded).user.houseNumber!;
    phoneNumberController.text =
        (context.read<UserCubit>().state as UserLoaded).user.phoneNumber!;
    cities = ['Bandung', 'Jakarta', 'Surabaya'];
    selectedCity = cities![0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: heading1,
        ),
        backgroundColor: mainColor,
      ),
      backgroundColor: darkColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(
                  defaultMargin,
                  26,
                  defaultMargin,
                  6,
                ),
                child: Text(
                  "Name",
                  style: heading2,
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: darkColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: whiteColor,
                  ),
                ),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Type Your Name",
                    hintStyle: greyFontStyle,
                    border: InputBorder.none,
                  ),
                  style: heading3,
                  cursorColor: whiteColor,
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(
                  defaultMargin,
                  10,
                  defaultMargin,
                  6,
                ),
                child: Text(
                  "Address",
                  style: heading2,
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: darkColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: whiteColor,
                  ),
                ),
                child: TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                    hintText: "Type Your Address",
                    hintStyle: greyFontStyle,
                    border: InputBorder.none,
                  ),
                  style: heading3,
                  cursorColor: whiteColor,
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(
                    defaultMargin, 10, defaultMargin, 6),
                child: Text(
                  "Phone Number",
                  style: heading2,
                ),
              ),
              // field phone number
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: darkColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: whiteColor,
                  ),
                ),
                child: TextField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Type Your Phone Number",
                    hintStyle: greyFontStyle,
                  ),
                  style: heading3,
                  cursorColor: whiteColor,
                ),
              ),
              // text house number
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(
                    defaultMargin, 10, defaultMargin, 6),
                child: Text(
                  "House Number",
                  style: heading2,
                ),
              ),
              // field house number
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: darkColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: whiteColor,
                  ),
                ),
                child: TextField(
                  controller: houseNumberController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Type Your House Number",
                    hintStyle: greyFontStyle,
                  ),
                  style: heading3,
                  cursorColor: whiteColor,
                ),
              ),
              // text city
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(
                    defaultMargin, 10, defaultMargin, 6),
                child: Text(
                  "City",
                  style: heading2,
                ),
              ),
              // city dropdown
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: darkColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: whiteColor,
                  ),
                ),
                child: DropdownButton(
                  value: selectedCity,
                  items: cities!
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: heading3,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (item) {
                    setState(() {
                      selectedCity = item;
                    });
                  },
                  isExpanded: true,
                  underline: const SizedBox(),
                  dropdownColor: darkColor,
                  style: heading3,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      right: 10,
                    ),
                    child: (isLoading == true)
                        ? loadingIndicator
                        : ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });

                              User user = (context.read<UserCubit>().state
                                      as UserLoaded)
                                  .user
                                  .copyWith(
                                    name: nameController.text,
                                    address: addressController.text,
                                    city: selectedCity,
                                    houseNumber: houseNumberController.text,
                                    phoneNumber: phoneNumberController.text,
                                  );

                              ApiReturnValue<User> result =
                                  await UserService.updateProfile(user);

                              if (result.value != null) {
                                context
                                    .read<UserCubit>()
                                    .getUser(result.value!);

                                Get.snackbar(
                                  "",
                                  "",
                                  backgroundColor: "2ECC71".toColor(),
                                  icon: Icon(
                                    MdiIcons.closeCircleOutline,
                                    color: whiteColor,
                                  ),
                                  titleText: Text(
                                    "Successfully Update Profile",
                                    style: heading1,
                                  ),
                                  messageText: Text(
                                    'Your Profile Has Been Updated',
                                    style: heading3,
                                  ),
                                );

                                Get.back();
                              } else {
                                Get.snackbar(
                                  "",
                                  "",
                                  backgroundColor: "D9435E".toColor(),
                                  icon: Icon(
                                    MdiIcons.closeCircleOutline,
                                    color: whiteColor,
                                  ),
                                  titleText: Text(
                                    "Your Profile Has Been Updated",
                                    style: heading1,
                                  ),
                                  messageText: Text(
                                    'Please Try Again Later',
                                    style: heading3,
                                  ),
                                );
                              }

                              setState(() {
                                isLoading = false;
                              });

                              Get.back();

                              context.read<UserCubit>().getUser(user);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: mainColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              "save profile",
                              style: heading3,
                            ),
                          ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
