part of 'pages.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  MovieDetailPage(this.movie);

  @override
  Widget build(BuildContext context) {
    MovieDetail movieDetail;
    List<Credit> credits;
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToMainPage());

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
                FutureBuilder(
                    future: MovieServices.getDetails(movie),
                    builder: (_, snapsot) {
                      if (snapsot.hasData) {
                        movieDetail = snapsot.data;
                        return FutureBuilder(
                            future: MovieServices.getCredits(movie.id),
                            builder: (_, snapshot) {
                              if (snapshot.hasData) {
                                credits = snapshot.data;
                                return Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              height: 270,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          imageBaseURL +
                                                              "w1280" +
                                                              movie
                                                                  .backdropPath),
                                                      fit: BoxFit.cover)),
                                            ),
                                            Container(
                                              height: 271,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                      begin: Alignment(0, 1),
                                                      end: Alignment(0, 0.66),
                                                      colors: [
                                                    Colors.white,
                                                    Colors.white.withOpacity(0),
                                                  ])),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 20, left: defaultMargin),
                                          padding: EdgeInsets.all(1),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.black
                                                  .withOpacity(0.04)),
                                          child: GestureDetector(
                                            onTap: () {
                                              context
                                                  .bloc<PageBloc>()
                                                  .add(GoToMainPage());
                                            },
                                            child: Icon(
                                              Icons.arrow_back,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      movieDetail.title,
                                      style: blackTextFont.copyWith(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      movieDetail.genresAndLanguage,
                                      style: blackTextFont.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffadadad)),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        RatingStars(
                                          voteAverage: movieDetail.voteAverage,
                                          textStyle: whiteNumberFont.copyWith(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 12,
                                              color: Color(0xffadadad)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 24,
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: defaultMargin, bottom: 12),
                                        child: Text(
                                          'Cast & Crew',
                                          style: blackTextFont.copyWith(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                    FutureBuilder(
                                      future:
                                          MovieServices.getCredits(movie.id),
                                      builder: (_, snapshot) {
                                        if (snapshot.hasData) {
                                          credits = snapshot.data;
                                          return SizedBox(
                                              height: 110,
                                              child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: credits.length,
                                                  itemBuilder: (_, index) => Container(
                                                      margin: EdgeInsets.only(
                                                          left: (index == 0)
                                                              ? defaultMargin
                                                              : 0,
                                                          right: (index ==
                                                                  credits.length -
                                                                      1
                                                              ? defaultMargin
                                                              : 16)),
                                                      child: CreditsCard(
                                                          credits[index]))));
                                        } else {
                                          return SizedBox(
                                            height: 50,
                                            child: SpinKitFadingCircle(
                                              color: accentColor1,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          defaultMargin, 24, defaultMargin, 8),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Storyline',
                                          style: blackTextFont,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          defaultMargin, 0, defaultMargin, 30),
                                      child: Text(
                                        movie.overview,
                                        style: greyTextFont.copyWith(
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        color: mainColor,
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Text(
                                            'Continue to Book',
                                            style: whiteTextFont.copyWith(
                                                fontSize: 16),
                                          ),
                                        ),
                                        onPressed: () {
                                          context.read<PageBloc>().add(
                                              GoToSelectSchedulePage(
                                                  movieDetail));
                                        })
                                  ],
                                );
                              } else {
                                return SizedBox();
                              }
                            });
                      } else {
                        return SizedBox();
                      }
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
