// $(document).on('turbolinks:load', function () {
//
//   $("a.btn-fb-link-reg").on("click", function (e) {
//     e.preventDefault();
//     FB.getLoginStatus(function (response) {
//       console.log(response);
//       statusChangeCallback(response);
//       sendData(response);
//
//       function statusChangeCallback(response) {
//         if (response.status === 'connected') {
//
//         } else if (response.status === 'authorization_expired') {
//           facebookLogin(response);
//           // sendData(response);
//
//         } else if (response.status === 'not_authorized') {
//
//         } else {
//           facebookLogin(response);
//           // sendData(response);
//
//
//         }
//
//       }
//
//
//       // FB.getLoginStatus(function (response) {
//       //   if (response.status === 'connected') {
//       //     var uid = response.authResponse.userID;
//       //     var accessToken = response.authResponse.accessToken;
//       //   }
//       // };
//       // }
//
//       function sendData(response) {
//         if  (response.status === 'connected' || response.status === 'not_authorized') {
//           jsonData = FB.api('/me', 'get', { access_token: response.authResponse.accessToken, fields: 'id,name,email' }, function(response) {
//             console.log(response);
//           });
//           $.ajax({
//             url: '/signup/facebook_reg',
//             type: "POST",
//             data: jsonData,
//             dataType: 'json',
//             processData: false,
//             contentType: false
//           });
//         }
//       }
//
//       function facebookLogin() {
//         FB.login(function (response) {
//           // handle the response
//         }, {scope: 'email'});
//       }
//
//
//
//     });
//   });
// })
