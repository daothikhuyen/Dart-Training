
enum Classification {
  sublist, superlist , equal,unequal;
}

class Sublist {

  Classification sublist(List<int> listOne, List<int> listTwo){

    if(listOne.isEmpty && listTwo.isEmpty){
      return Classification.equal;
    }else if(listOne.length > 0 && listTwo.length == 0){
      return Classification.superlist;
    }else if(listOne.length == 0 && listTwo.length > 0){
      return Classification.sublist;
    }else if(isTwolistEqual(listOne,listTwo)){
      return Classification.equal;
    }else if(isSublist(listOne,listTwo)){
      return Classification.sublist;
    }else if(isSublist(listTwo,listOne)){
      return Classification.superlist;
    }else{
      return Classification.unequal;
    }
  }

  bool isSublist(List<int> small, List<int> length){
    if(small.length > length.length) return false;

    for(int i = 0; i <= length.length-small.length; i++){
      List<int> trimmedList = length.sublist(i, i+ small.length);

      if(isTwolistEqual(trimmedList, small)){
        return true;
      }
    }

    return false;
  }

  bool isTwolistEqual(List<int> first, List<int> second){

    if(first.length != second.length) return false;
    
    for(int i = 0 ; i < first.length; i++){
      if(first[i] != second[i]){
        return false;
      }
    }

    return true;
  }
  
}

void main(){
  List<int> listOne = [0, 1, 2, 3, 4, 5];
  List<int> listTwo =  [0, 1, 2];

  final sublist = Sublist();

  print(sublist.sublist(listOne, listTwo));

}