let btnfinish = document.getElementById('termine')
let btnnotfinish = document.getElementById('encour')
let btnall = document.getElementById('toute')
let formaelements = document.getElementsByClassName('class-termine')
let formelements = document.getElementsByClassName('class-nontermine')
let elements = document.getElementsByClassName('article-formation')
function eventfiltretermine () {
  for (let element of elements) {    
    element.style.display = "block"
      for (let formelement of formelements ){
        formelement.style.display = "none"
      }
    }
}
termine.addEventListener('click', eventfiltretermine)
function eventfiltreencour () {
  for (let element of elements) {    
    element.style.display = "block"
    for (let formaelement of formaelements ){
      formaelement.style.display = "none"
    }
  }
}
encour.addEventListener('click', eventfiltreencour)
function eventfiltretoute () {
  for (let element of elements) {
    
      element.style.display = "block"
      }  
}
toute.addEventListener('click', eventfiltretoute)