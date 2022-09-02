// $(document).ready(function(){
    
//     $(".bodycam").hide();
//     $(".odz").hide();
//     $(".blackbox").hide();
//     window.addEventListener("message", function(event){
//         if(event.data.open == true)
//         {
//             $(".odz").fadeIn();
//             $(".bodycam").fadeIn();
//             $(".blackbox").fadeIn();
//             document.getElementById("data").innerHTML = event.data.date;
//             document.getElementById("stopien").innerHTML = event.data.ranga;
//             document.getElementById("dane").innerHTML = event.data.daneosoby;
//         }
//         else if(event.data.open == false) 
//         {
//             $(".odz").fadeOut();
//             $(".bodycam").fadeOut();
//             $(".blackbox").fadeOut();
//         }
//     })
// });

$(function () {
  
    // Update hud from user status
    $(document).ready(function() {
        $(".container").hide();
        $(".sikson").hide();
        window.addEventListener('message', function(event) {    
            
            switch(event.data.action) {
                case "update":
                    $(".sikson").show();
                    $('#mainBox').html("AXON FLEET BODY2 X81074711");
                    $('#casBox').html(event.data.date);
                    //$(".container").show();   
                    break;
                case "loadui":
                    $(".container").show();    
                    var top = localStorage.top + 'px';
                    var left = localStorage.left + 'px';
           
                    // console.log(top + " " + left);
                    
                    $('.container').css({
                        position:'absolute',
                        top:top,
                        left:left
                    });
                    
                    $(".container").draggable({
                        scroll: false,
                        axis: "x, y",
                        cursor: "move",
                        containment: "window"
                    });
                    
                    break;
                
                case "closeui":
                    $(".container").hide();
                    $(".sikson").hide();
                    break;
                
                default:
                    console.log("Error: Unknown Event occured!")
            };
        });
    });
    
    document.onkeyup = function (data) {
        if (data.which == 27) {
            var x = $(".container").position();
            localStorage.top = x.top;
            localStorage.left = x.left;
            $('.container').css({
                position:'absolute',
                top:x.top,
                left:x.left
            });
            
            $.post('http://archi-bodycam/exit', JSON.stringify({}));
            return;
        }
    };
})