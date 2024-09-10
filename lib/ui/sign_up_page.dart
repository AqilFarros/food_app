part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GeneralPages(
      title: "Sign Up",
      subtitle: "Find your best ever meal",
      onBackButtonPresses: () {
        Get.back();
      },
      child: Column(
        children: <Widget>[
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
            margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
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
              "Email Address",
              style: heading2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: darkColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: whiteColor,
              ),
            ),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Type Your Email Address",
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
              "Password",
              style: heading2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: darkColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: whiteColor,
              ),
            ),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                hintText: "Type Your Password",
                hintStyle: greyFontStyle,
                border: InputBorder.none,
              ),
              style: heading3,
              cursorColor: whiteColor,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: Text(
                    "Already Have an Account?",
                    style: heading3.copyWith(
                      color: secondaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: secondaryColor,
                      decorationThickness: 2,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: defaultMargin),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => const AddressPage());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Continue",
                      style: heading3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
