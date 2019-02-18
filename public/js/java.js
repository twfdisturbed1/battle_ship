
var btn = document.getElementById("bBtn");
var span = document.getElementsByClassName("closeIt")[0];

 function showModal(){
    var modal = document.getElementById("bModal");
    modal.style.display = "block";
}

 function onModal(){
    var modal = document.getElementById("bModal");
    var span = document.getElementsByClassName("closeIt")[0];
    modal.style.display = "none";
}

 function winMod(event){
    var modal = document.getElementById("bModal");
    if (event.target == modal){
      modal.style.display = "none";
    }
}


function removeElement() {
    var num = document.getElementById("ship_num");
    if (num.value >= 4){
        var elementt = document.getElementById("HV");
        elementt.parentNode.removeChild(elementt);
        var element = document.getElementById("pos");
        element.parentNode.removeChild(element);
    }
}

function goaway() {
  var ship_num = document.getElementById("value_s");
  var dir = document.getElementById("direction");
  if (ship_num.value == 5 ){
    dir.style.display = "none"
  }
}