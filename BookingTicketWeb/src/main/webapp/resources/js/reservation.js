/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* global fetch */

function addToPay(id, name, price, pasCarId, tripId) {
    event.preventDefault();
    let btn = document.getElementById(`seat-${id}`);
    btn.style.background = "#f8beab";
    btn.disabled = "true";

    fetch("/BookingTicketWeb/api/reservation", {
        method: 'post',
        body: JSON.stringify({
            "id": id,
            "name": name,
            "pasCarId": pasCarId,
            "tripId": tripId,
            "price": price,
            "quantity": 1
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function (res) {
        return res.json();
    }).then(function (data) {
        let counter = document.getElementById("count");
        counter.innerHTML = data;
    });
}

function deleteSeat(seatId) {
    var option = confirm('Bạn có chắc chắn muốn xóa không?');
    if (option === true) {
        fetch(`/BookingTicketWeb/api/reservation/delete/${seatId}`, {
            method: "delete"
        }).then(function (res) {
            return res.json();
        }).then(function (data) {
            let counter = document.getElementById("count");
            counter.innerHTML = data.counter;
            let amount = document.getElementById("amount");
            amount.innerHTML = data.amount;
        });
    }

    let s = document.getElementById(`s-${seatId}`);
    s.style.display = "none";

}

function pay() {
    var option = confirm('Bạn chắc chắn muốn thanh toán?');
    if (option === true) {
        fetch("/BookingTicketWeb/api/pay", {
            method: "post"
        }).then(function (res) {
            return res.json();
        }).then(function (code) {
            console.log(code);
            location.reload();
        });
    }
}