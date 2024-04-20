abstract class FavouriteState{}

class FavouriteInitState extends FavouriteState{}

class AddFavouriteLoadingState extends FavouriteState{}
class AddFavouriteSuccessState extends FavouriteState{}
class AddFavouriteErrorState extends FavouriteState{}


class GetFavouriteLoadingState extends FavouriteState{}
class GetFavouriteSuccessState extends FavouriteState{}
class GetFavouriteErrorState extends FavouriteState{}

class RemoveFavouriteLoadingState extends FavouriteState{}
class RemoveFavouriteSuccessState extends FavouriteState{}
class RemoveFavouriteErrorState extends FavouriteState{}