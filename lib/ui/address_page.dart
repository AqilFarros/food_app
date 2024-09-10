part of 'pages.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GeneralPages(
      title: "Address",
      subtitle: "Make sure it's valid",
      onBackButtonPresses: () {
        Get.back();
      },
      child: Column(
        children: [
          // gambar
          Container(
            width: 110,
            height: 110,
            margin: EdgeInsets.only(
              top: 26,
            ),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/photo_border.png"),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    "https://ui-avatars.com/api/?background=random&color=fff&name=aqil+farros",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // text address
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              "Address",
              style: heading2,
            ),
          ),
          // field addredd
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
              controller: addressController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Type Your Address",
                hintStyle: greyFontStyle,
              ),
              style: heading3,
              cursorColor: whiteColor,
            ),
          ),
          // text phone number
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 6),
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
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 6),
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
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 6),
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
              items: const [
                DropdownMenuItem(
                  value: "Batam",
                  child: Text("Batam"),
                ),
                DropdownMenuItem(
                  value: "Cirebon",
                  child: Text("Cirebon"),
                ),
                DropdownMenuItem(
                  value: "Bandung",
                  child: Text("Bandung"),
                ),
                DropdownMenuItem(
                  value: "Bekasi",
                  child: Text("Bekasi"),
                ),
                DropdownMenuItem(
                  value: "Palembang",
                  child: Text("Palembang"),
                ),
              ],
              onChanged: (item) {},
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
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const MainPage());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Create Account",
                    style: heading3,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
