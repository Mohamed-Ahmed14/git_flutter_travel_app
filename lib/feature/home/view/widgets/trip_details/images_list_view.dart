import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/feature/view_model/cubit/cubit.dart';
import 'package:travel_app/feature/view_model/cubit/state.dart';

class ImagesListView extends StatelessWidget {
  const ImagesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SizedBox(
              height:245 ,
              child: PageView.builder(
                controller: cubit.imageController,
                itemBuilder: (context, index) {
                    return  Image.asset(cubit.tripModel?.imagesList?[index] ?? "",
                      fit: BoxFit.fill,height: 245,width: double.infinity,);
                },itemCount: cubit.tripModel?.imagesList?.length,

              ),
            ),
            PositionedDirectional(
              bottom: 10,
              child: Align(alignment: AlignmentDirectional.center,
                child: Visibility(
                  visible: (cubit.tripModel?.imagesList?.length ?? 0) > 1,
                  child: SmoothPageIndicator(
                    controller: cubit.imageController,  // PageController
                    count:  cubit.tripModel?.imagesList?.length ?? 0,
                    effect:  ExpandingDotsEffect(),  // your preferred effect

                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
