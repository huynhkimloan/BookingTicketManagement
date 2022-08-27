/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* global trip, fetch */
//function loadComments() {
//     fetch("/BookingTicketWeb/comment").then(function (res) {
//        return res.json();
//    }).then(function (data) {
//        let area = document.getElementById("commentArea");
//        let h = '';
//        for (let d of data)
//            h += `
//                <div class="col-md-4 col-xs-12" style="padding:10px;">
//                     <div class="card-body ">
//                         <p>Nội dung: ${d.content}</li>
//                         <p class="comment-date">${moment(d.createddate).fromNow()} </p>
//                         <hr>                   
//                     </div>
//
//                 </div>
//            `;
//        area.innerHTML = h;
//    });
//}

function addComment(event, tripId) {
    event.preventDefault();
    console.log('trigger on submit', event, tripId);
    fetch("/BookingTicketWeb/comment", {
        method: 'post',
        body: JSON.stringify({
            "content": document.getElementById("commentId").value,
            "trip": tripId
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then((res) => {
        return res.json();
    }).then(data => {
        console.log(data);


        let area = document.getElementById("commentArea");
        
        area.innerHTML = `
        <div class="col-md-4 col-xs-12 " style="padding:10px; ">
            <div class="card-body ">
                <p>Nội dung: ${data.content}</p>
                <p class="comment-date">${moment(data.createddate).fromNow()} </p>
                <hr>                   
                </div>
            </div>
       </div>
        ` + area.innerHTML;


    });
}

