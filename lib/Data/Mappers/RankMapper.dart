import 'package:products/Data/Models/RankDTO.dart';
import 'package:products/Domain/Mappers/Mapper.dart';
import 'package:products/Domain/Models/Rank.dart';

class RankMapper extends Mapper<RankDTO, Rank> {
  @override
  Rank map(RankDTO input) {
    if (input == null) {
      return null;
    }

    return Rank(
        input.rank,
        input.listName,
        input.displayName,
        input.publishedDate,
        input.bestsellersDate,
        input.weeksOnList,
        input.asterisk,
        input.dagger);
  }
}
