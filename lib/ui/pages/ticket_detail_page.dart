part of 'pages.dart';

class TicketDetailPage extends StatelessWidget {
  final Ticket ticket;

  TicketDetailPage(this.ticket);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          context.read<PageBloc>().add(GoToMainPage(
              bottomNavBarIndex: 1,
              isExpired: ticket.time.isBefore(DateTime.now())));

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
                color: accentColor1,
              )),
              ListView(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20, left: defaultMargin),
                        padding: EdgeInsets.all(1),
                        child: GestureDetector(
                          onTap: () {
                            context.read<PageBloc>().add(GoToMainPage(
                                bottomNavBarIndex: 1,
                                isExpired:
                                    ticket.time.isBefore(DateTime.now())));
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 20),
                        child: Text(
                          'Ticket Details',
                          style: whiteTextFont.copyWith(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: CustomPaint(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.65,
                        width: MediaQuery.of(context).size.width -
                            2 * defaultMargin -
                            10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 70,
                            ),
                            Center(
                                child: Container(
                              margin: EdgeInsets.only(
                                  left: defaultMargin, right: defaultMargin),
                              child: Text(
                                ticket.movieDetail.title,
                                style: blackTextFont.copyWith(
                                    color: accentColor1,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600),
                                maxLines: 2,
                                overflow: TextOverflow.clip,
                              ),
                            )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: defaultMargin, top: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Date',
                                        style:
                                            greyTextFont.copyWith(fontSize: 16),
                                      ),
                                      Text(ticket.time.dateAndTime,
                                          style: blackTextFont.copyWith(
                                              fontSize: 20,
                                              color: accentColor1,
                                              fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      right: defaultMargin, top: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Seat',
                                        style:
                                            greyTextFont.copyWith(fontSize: 16),
                                      ),
                                      Text(ticket.seatsInString,
                                          style: blackTextFont.copyWith(
                                              fontSize: 20,
                                              color: accentColor1,
                                              fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: defaultMargin, top: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Cinema',
                                        style:
                                            greyTextFont.copyWith(fontSize: 16),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: Text(
                                          ticket.theater.name,
                                          style: blackTextFont.copyWith(
                                              fontSize: 20,
                                              color: accentColor1,
                                              fontWeight: FontWeight.w600),
                                          overflow: TextOverflow.clip,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      right: defaultMargin, top: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'ID Order',
                                        style:
                                            greyTextFont.copyWith(fontSize: 16),
                                      ),
                                      Text(ticket.bookingCode,
                                          style: blackTextFont.copyWith(
                                              fontSize: 16,
                                              color: accentColor1,
                                              fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: defaultMargin),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Name',
                                        style:
                                            greyTextFont.copyWith(fontSize: 16),
                                      ),
                                      Text(
                                        ticket.name,
                                        style: blackTextFont.copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        'Paid',
                                        style:
                                            greyTextFont.copyWith(fontSize: 16),
                                      ),
                                      Text(
                                        NumberFormat.currency(
                                                locale: 'id_ID',
                                                decimalDigits: 0,
                                                symbol: 'IDR ')
                                            .format(ticket.totalPrice),
                                        textAlign: TextAlign.end,
                                        style: whiteNumberFont.copyWith(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: defaultMargin),
                                  child: QrImage(
                                    embeddedImage:
                                        AssetImage('assets/ic_tickets.png'),
                                    version: 6,
                                    foregroundColor: Colors.black,
                                    errorCorrectionLevel: QrErrorCorrectLevel.M,
                                    padding: EdgeInsets.all(0),
                                    size: 80,
                                    data: ticket.bookingCode,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      painter: RPSCustomPainter(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(size.width * -0.00, size.height * 0.60);
    path_0.quadraticBezierTo(
        size.width * 0.00, size.height * 0.19, 0, size.height * 0.14);
    path_0.quadraticBezierTo(size.width * 0.00, size.height * 0.10,
        size.width * 0.05, size.height * 0.10);
    path_0.lineTo(size.width * 0.95, size.height * 0.10);
    path_0.quadraticBezierTo(
        size.width * 1.00, size.height * 0.10, size.width, size.height * 0.14);
    path_0.quadraticBezierTo(size.width * 1.00, size.height * 0.19,
        size.width * 1.00, size.height * 0.70);
    path_0.quadraticBezierTo(size.width * 0.95, size.height * 0.70,
        size.width * 0.95, size.height * 0.74);
    path_0.quadraticBezierTo(size.width * 0.95, size.height * 0.78,
        size.width * 1.00, size.height * 0.78);
    path_0.lineTo(size.width * 1.00, size.height * 0.80);
    path_0.quadraticBezierTo(size.width * 1.00, size.height * 0.92,
        size.width * 1.00, size.height * 0.96);
    path_0.quadraticBezierTo(size.width * 1.00, size.height * 1.00,
        size.width * 0.95, size.height * 1.00);
    path_0.lineTo(size.width * 0.05, size.height * 1.00);
    path_0.quadraticBezierTo(size.width * -0.00, size.height * 1.00,
        size.width * -0.00, size.height * 0.96);
    path_0.quadraticBezierTo(size.width * -0.00, size.height * 0.92,
        size.width * -0.00, size.height * 0.80);
    path_0.lineTo(size.width * -0.00, size.height * 0.78);
    path_0.quadraticBezierTo(size.width * 0.05, size.height * 0.78,
        size.width * 0.05, size.height * 0.74);
    path_0.quadraticBezierTo(size.width * 0.05, size.height * 0.70,
        size.width * -0.00, size.height * 0.70);
    path_0.lineTo(size.width * -0.00, size.height * 0.60);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
