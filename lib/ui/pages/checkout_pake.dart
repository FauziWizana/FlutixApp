part of 'pages.dart';

class CheckoutPage extends StatefulWidget {
  final Ticket ticket;

  CheckoutPage(this.ticket);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    int total = 26500 * widget.ticket.seats.length;

    return WillPopScope(
        onWillPop: () async {
          context.read<PageBloc>().add(GoToSelectSeatPage(widget.ticket));

          return;
        },
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                color: accentColor1,
              ),
              SafeArea(
                  child: Container(
                color: Colors.white,
              )),
              ListView(
                children: [
                  Stack(
                    children: [
                      Row(
                        children: [
                          //note: BACK BUTTON
                          Container(
                            margin:
                                EdgeInsets.only(top: 20, left: defaultMargin),
                            padding: EdgeInsets.all(1),
                            child: GestureDetector(
                              onTap: () {
                                context
                                    .read<PageBloc>()
                                    .add(GoToSelectSeatPage(widget.ticket));
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
                        User user = (userState as UserLoaded).user;

                        return Column(
                          children: [
                            //note: PAGE TITLE
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                'Checkout\nMovie',
                                style: blackTextFont.copyWith(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            // note: MOVIE DESCRIPTION
                            Row(
                              children: [
                                Container(
                                  width: 70,
                                  height: 90,
                                  margin: EdgeInsets.only(
                                      left: defaultMargin, right: 20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          image: NetworkImage(imageBaseURL +
                                              'w342' +
                                              widget.ticket.movieDetail
                                                  .posterPath),
                                          fit: BoxFit.cover)),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                2 * defaultMargin -
                                                70 -
                                                20,
                                        child: Text(
                                          widget.ticket.movieDetail.title,
                                          style: blackTextFont.copyWith(
                                              fontSize: 18),
                                          maxLines: 2,
                                          overflow: TextOverflow.clip,
                                        )),
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          2 * defaultMargin -
                                          70 -
                                          20,
                                      margin: EdgeInsets.symmetric(vertical: 6),
                                      child: Text(
                                        widget.ticket.movieDetail
                                            .genresAndLanguage,
                                        style: greyTextFont.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    RatingStars(
                                      voteAverage:
                                          widget.ticket.movieDetail.voteAverage,
                                      textStyle: greyTextFont.copyWith(
                                          color: accentColor3),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: defaultMargin,
                              ),
                              child: Divider(
                                thickness: 1,
                                color: Color(0xffe4e4e4),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Order ID',
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    widget.ticket.bookingCode,
                                    style: whiteNumberFont.copyWith(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Cinema',
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: Text(
                                      widget.ticket.theater.name,
                                      textAlign: TextAlign.end,
                                      style: whiteNumberFont.copyWith(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Date & Time',
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: Text(
                                      widget.ticket.time.dateAndTime,
                                      textAlign: TextAlign.end,
                                      style: whiteNumberFont.copyWith(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Seat Number',
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: Text(
                                      widget.ticket.seatsInString,
                                      textAlign: TextAlign.end,
                                      style: whiteNumberFont.copyWith(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Price',
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: Text(
                                      'IDR 25.000 x ${widget.ticket.seats.length}',
                                      textAlign: TextAlign.end,
                                      style: whiteNumberFont.copyWith(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Fee',
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: Text(
                                      'IDR 1.500 x ${widget.ticket.seats.length}',
                                      textAlign: TextAlign.end,
                                      style: whiteNumberFont.copyWith(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total',
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: Text(
                                      NumberFormat.currency(
                                              locale: 'id_ID',
                                              decimalDigits: 0,
                                              symbol: 'IDR ')
                                          .format(total),
                                      textAlign: TextAlign.end,
                                      style: whiteNumberFont.copyWith(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: defaultMargin,
                              ),
                              child: Divider(
                                thickness: 1,
                                color: Color(0xffe4e4e4),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Your Wallet',
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: Text(
                                      NumberFormat.currency(
                                              locale: 'id_ID',
                                              decimalDigits: 0,
                                              symbol: 'IDR ')
                                          .format(user.balance),
                                      textAlign: TextAlign.end,
                                      style: whiteNumberFont.copyWith(
                                          color: user.balance >= total
                                              ? Color(0xff3e9d9d)
                                              : Color(0xffff5c83),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 250,
                              height: 46,
                              margin: EdgeInsets.only(top: 36, bottom: 50),
                              child: RaisedButton(
                                  elevation: 0,
                                  color: user.balance >= total
                                      ? Color(0xff3e9d9d)
                                      : mainColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Text(
                                    user.balance >= total
                                        ? 'Checkout Now'
                                        : 'Top Up My Wallet',
                                    style: whiteTextFont.copyWith(fontSize: 16),
                                  ),
                                  onPressed: () {
                                    if (user.balance >= total) {
                                      FlutixTransaction transaction =
                                          FlutixTransaction(
                                              userID: user.id,
                                              title: widget
                                                  .ticket.movieDetail.title,
                                              subtitle:
                                                  widget.ticket.theater.name,
                                              time: DateTime.now(),
                                              amount: -total,
                                              picture: widget.ticket.movieDetail
                                                  .posterPath);

                                      context.read<PageBloc>().add(
                                          GoToSuccessPage(
                                              widget.ticket
                                                  .copyWith(totalPrice: total),
                                              transaction));
                                    } else {
                                      // #Uang tidak cukup
                                    }
                                  }),
                            )
                          ],
                        );
                      }),
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
