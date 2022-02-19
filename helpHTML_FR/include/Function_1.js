/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function slowScroll (id){

    var offset = 0;
    $('html,body').animate({
        scrollTop: $(id).offset().top - offset
    }, 500);
    return false;
}

