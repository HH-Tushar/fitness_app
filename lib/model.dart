class ExercisesModel{
  String ?id;
  String ?title,image,gif;

  ExercisesModel({
    this.title,this.id,this.image,this.gif
  });
}
List<ExercisesModel> exercisesDataList=[];
ExercisesModel? exercisesModel;