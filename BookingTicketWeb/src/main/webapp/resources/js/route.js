/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import fetch from 'node-fetch';

function deleteRoute(endpoint, id, btn) {
    let r = document.getElementById(`row${id}`);
    let load = document.getElementById(`load${id}`);
    load.style.display = "block";
    btn.style.display = "none";
    fetch(endpoint, {
        method: 'delete'
    }).then(function(res) {
        if (res.status !== 204)
            alert("Something wrong!!!");
        load.style.display = "none";
        r.style.display = "none";
    }).catch(function(err) {
        console.error(err);
        btn.style.display = "block";
        load.style.display = "none";
    });
}

function getRoutes(endpoint) {
    fetch(endpoint).then(function (res) {
        return res.json();
    }).then(function (data) {
        let d = document.getElementById("myRoute");
        if (d !== null) {
            let h = "";
            for (let i = 0; i < data.length; i++)
                h += `
                <tr id="row${data[i].id}">
                    <td>${data[i].routename}</td>
                    <td>${data[i].startingpoint}</td>
                    <td>${data[i].destination}</td>
                    <td>${data[i].price}</td>
                    <td>${data[i].specialprice}</td>
                    <td>
                        <div class="spinner-border text-info" style="display:none" id="load${data[i].id}"></div>
                        <button class="btn btn-danger" onclick="deleteProduct('${endpoint + "/" + data[i].id}', ${data[i].id}, this)"> <i class="bi bi-trash text-light"></i>Xóa tuyến xe</button>
                    </td>
                </tr>
            `
            d.innerHTML = h;
        }

        let d2 = document.getElementById("mySpinner");
        d2.style.display = "none";
    }).catch(function (err) {
        console.error(err);
    });
}

