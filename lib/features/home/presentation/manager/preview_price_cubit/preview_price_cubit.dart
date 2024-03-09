import 'package:bloc/bloc.dart';
import 'package:story_squad/features/home/domain/repos/home_repo.dart';

part 'preview_price_state.dart';

class PreviewPriceCubit extends Cubit<PreviewPriceStates> {
  final HomeRepo homeRepo;
  PreviewPriceCubit({required this.homeRepo}) : super(PreviewPriceInitial());

  Future<void> previewBook({required String url}) async {
    final result = await homeRepo.launchPreview(url: url);
    result.fold((l) => null, (r) => null);
  }
}
