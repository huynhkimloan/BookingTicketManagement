/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* global fetch */

const form = document.getElementById("submitFormDriver");
let userId;

function submitUserDriver() {
    event.preventDefault();

    const data = new FormData();
    const file = document.getElementById('upload_avatar').files[0];
    data.append("file", file);
    data.append("upload_preset", "upload_for_web");
    fetch('https://api.cloudinary.com/v1_1/dvsqhstsi/upload', {
        method: "post",
        body: data
    }).then((res) => {
        if (res.ok) {
            resCopy = res.clone();
            console.log(res); //first consume it in console.log
            return res.json(); //then consume it again, the error happens
        }
    }).then((data) => {
        if (data && data.secure_url) {
            console.dir(form.elements.address.value);
            return fetch("/BookingTicketWeb/api/admin/add-user", {
                method: 'post',
                body: JSON.stringify({
                    "name": form.elements.name.value,
                    "username": form.elements.username.value,
                    "password": form.elements.password.value,
                    "confirmPassword": form.elements.confirmPassword.value,
                    "email": form.elements.email.value,
                    "phone": form.elements.phone.value,
                    "avt": data.secure_url
                }),
                headers: {
                    "Content-Type": "application/json"
                }
            });
        } else {
            throw Error("Có lỗi xảy ra, vui lòng quay lại sau!!");
        }
    }).then((res) => {
        return res.json();
    }).then((data) => {
        console.log(data);
        if (data && data.id > 0) {
            userId = data.id;
            return fetch("/BookingTicketWeb/api/admin/add-driver", {
                method: 'post',
                body: JSON.stringify({
                    "userIdDriver": userId,
                    "identityCard": form.elements.identityCard.value,
                    "address": form.elements.address.value,
                    "dateOfBirth": form.elements.dateOfBirth.value,
                    "license": form.elements.license.value
                }),
                headers: {
                    "Content-Type": "application/json"
                }
            });
        } else {
            throw Error("Có lỗi xảy ra, vui lòng quay lại sau!!");
        }
    }).then((res) => {
        return res.json();
    }).then(data => {
        if (data) {
            alert('Thêm tài xế thành công!');
            location.reload();
        } else {
            throw Error("Có lỗi xảy ra, vui lòng quay lại sau!!");
        }
    }).catch((error) => {
        const errEle = document.getElementById('error-message');
        errEle.textContent = "Có lỗi xảy ra, vui lòng thử lại lần nữa!!";
        console.error(error);
    });
}




