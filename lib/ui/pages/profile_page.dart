part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          context.read<PageBloc>().add(GoToMainPage());

          return;
        },
        child: Scaffold(
            body: Stack(children: [
          Container(
            color: accentColor1,
          ),
          SafeArea(
              child: Container(
            color: Colors.white,
          )),
          ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, left: defaultMargin),
                    padding: EdgeInsets.all(1),
                    child: GestureDetector(
                      onTap: () {
                        context.read<PageBloc>().add(GoToMainPage());
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
                if (userState is UserLoaded) {
                  User user = userState.user;
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 30, bottom: 10),
                        width: 120,
                        height: 120,
                        child: Stack(
                          children: [
                            Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: SpinKitFadingCircle(
                                  color: mainColor,
                                ),
                              ),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: (user.profilePicture != ''
                                            ? NetworkImage(user.profilePicture)
                                            : AssetImage(
                                                'assets/user_pic.png')),
                                        fit: BoxFit.cover))),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width -
                            2 * defaultMargin,
                        child: Text(
                          user.name,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.clip,
                          style: blackTextFont.copyWith(fontSize: 18),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width -
                            2 * defaultMargin,
                        margin: EdgeInsets.only(top: 8, bottom: 20),
                        child: Text(
                          user.email,
                          textAlign: TextAlign.center,
                          style: greyTextFont.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w300),
                        ),
                      )
                    ],
                  );
                } else
                  return SizedBox();
              }),
              Container(
                margin: EdgeInsets.only(
                    left: defaultMargin,
                    bottom: 12,
                    right: defaultMargin,
                    top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<UserBloc, UserState>(
                      builder: (_, userState) => GestureDetector(
                        onTap: () {
                          context.read<PageBloc>().add(GoToEditProfilePage(
                              (userState as UserLoaded).user));
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: Image.asset('assets/edit_profile.png'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Edit Profile',
                              style: blackTextFont.copyWith(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    MySeparator(
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: defaultMargin,
                    bottom: 12,
                    right: defaultMargin,
                    top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context
                            .read<PageBloc>()
                            .add(GoToWalletPage(GoToProfilePage()));
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Image.asset('assets/my_wallet.png'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'My Wallet',
                            style: blackTextFont.copyWith(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    MySeparator(
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: defaultMargin,
                    bottom: 12,
                    right: defaultMargin,
                    top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Image.asset('assets/language.png'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Change Language',
                            style: blackTextFont.copyWith(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    MySeparator(
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: defaultMargin,
                    bottom: 12,
                    right: defaultMargin,
                    top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Image.asset('assets/help_centre.png'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Help Centre',
                            style: blackTextFont.copyWith(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    MySeparator(
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: defaultMargin,
                    bottom: 12,
                    right: defaultMargin,
                    top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Image.asset('assets/rate.png'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Rate Flutix App',
                            style: blackTextFont.copyWith(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    MySeparator(
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Container(
                height: 45,
                width: 150,
                margin: EdgeInsets.symmetric(
                    horizontal: defaultMargin, vertical: 30),
                child: RaisedButton(
                  elevation: 0,
                  color: mainColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    'Log Out',
                    style: whiteTextFont.copyWith(fontSize: 16),
                  ),
                  onPressed: () {
                    context.read<UserBloc>().add(SignOut());
                    AuthServices.signOut();
                  },
                ),
              ),
            ],
          ),
        ])));
  }
}
