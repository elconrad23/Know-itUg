import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../knowit_exporter.dart';
import '../auth/services/FirebaseUIActivity.java';
import 'components/card.dart';
// import 'login.dart';
import 'reward.dart';
import 'signUp.dart';
//show details once user is logged in otherwise show option to login

class KnowItProfile extends StatelessWidget {
  const KnowItProfile({super.key});

  @override
  Future<Widget> build(BuildContext context) {
    // if we are on mobile
    final isMobile = KnowItResponsive.isMobile(context) ||
        KnowItResponsive.isSmallMobile(context) ||
        KnowItResponsive.isMediumMobile(context);
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        const SignUpPage();
      } else {
        final user = FirebaseAuth.instance.currentUser;
        // Name, email address, and profile photo URL
        final String name = user.displayName;
        final String email = user.email;
        // final photoUrl = user.photoURL;
        final String bio = user.bio;

        // Check if user's email is verified
        final emailVerified = user.emailVerified;
        

        // The user's ID, unique to the Firebase project. Do NOT use this value to
        // authenticate with your backend server, if you have one. Use
        // User.getIdToken() instead.
        final uid = user.uid;
      

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: borderRadius8,
            ),
            clipBehavior: Clip.antiAlias,
            height: 300,
            margin: margin8,
            child: AspectRatio(
              aspectRatio: 1,
              child: CachedNetworkImage(
                imageUrl: demoProfilePic,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        // space
        const SliverVerticalSpace(of: spacing8),
        // name
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: spacing8),
          sliver: SliverToBoxAdapter(
            child: Text(
              //retrieve person's username and display here
              name,
              style: const TextStyle(
                color: knowItBlack,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        // space
        const SliverVerticalSpace(of: spacing8),
        // email
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: spacing8),
          sliver: SliverToBoxAdapter(
            child: Text(
              //user email
              email,
              maxLines: 3,
              style: TextStyle(
                color: knowItBlack.withOpacity(.6),
                overflow: TextOverflow.ellipsis,
                fontSize: 16,
              ),
            ),
          ),
        ),

        const SliverVerticalSpace(of: spacing8),SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: spacing8),
          sliver: SliverToBoxAdapter(
            child: Text(
              //about your user
              bio,
              maxLines: 3,
              style: TextStyle(
                color: knowItBlack.withOpacity(.6),
                overflow: TextOverflow.ellipsis,
                fontSize: 16,
              ),
            ),
          ),
        ),

        const SliverVerticalSpace(of: spacing8),
        // points scored
        // games played
        // TODO fetch results from cloud

        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: spacing8),
          sliver: SliverGrid.extent(
            maxCrossAxisExtent: isMobile ? 200 : 300,
            childAspectRatio: 1,
            children:
                rewards.map((reward) => RewardsCard(reward: reward)).toList(),
          ),
        ),

        const SliverVerticalSpace(of: spacing32),
      ],
    );
    }
    });
  }
}
