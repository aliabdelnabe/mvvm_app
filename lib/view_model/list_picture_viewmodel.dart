
import 'package:mvvm_app/model/picsum_model.dart';
import 'package:mvvm_app/services/services.dart';

class ListPictureViewModel {
  List<PictureViewModel>? picture;
  Future<void> fetchPictures() async {
    final apiResult = await Services().fetchPicturesAPI();
    this.picture = apiResult.map((e) => PictureViewModel(e)).toList();
  }
}

class PictureViewModel {
  final PicSumModel? picSumModel;
  PictureViewModel(this.picSumModel);
}
