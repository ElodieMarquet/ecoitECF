/*  Event filter for formation in catalogue  */

let elements = document.getElementsByClassName('article-formation')

function eventFilterFinish () {

  for (let element of elements) {    
    if (element.className.match('class-termine')){
      element.style.display = 'block'
    }
    else {
      element.style.display = 'none'
    }
      
  }
}

function eventFilterNotFinish () {

  for (let element of elements) {    
    if (element.className.match('class-termine')){
      element.style.display = 'none'
    }
    else {
      element.style.display = 'block'
    }
      
  }
}

function eventFilterAll () {
  for (let element of elements) {
    
      element.style.display = "block"
  }  
}

if ( window.location.href.match('catalogue')) 
  {
    finish.addEventListener('click', eventFilterFinish)
    notFinish.addEventListener('click', eventFilterNotFinish)
    all.addEventListener('click', eventFilterAll)
}



