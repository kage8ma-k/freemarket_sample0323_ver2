// $(document).on('turbolinks:load', function () {
//
//   $("a.btn-fb-link-login").on("click", function (e) {
//     e.preventDefault();
//     FB.getLoginStatus(function (response) {
//       console.log(response);
//       statusChangeCallback(response);
//
//       function statusChangeCallback(response) {
//         if (response.status === 'connected') {
//           // The user is logged in and has authenticated your
//           // app, and response.authResponse supplies
//           // the user's ID, a valid access token, a signed
//           // request, and the time the access token
//           // and signed request each expire.
//           var uid = response.authResponse.userID;
//           var accessToken = response.authResponse.accessToken;
//
//         } else if (response.status === 'not_authorized') {
//
//         } else {
//           FB.login(function (response) {
//             // handle the response
//           }, {scope: 'email,user_likes'});
//
//           // FB.getLoginStatus(function (response) {
//           //   if (response.status === 'connected') {
//           //     var uid = response.authResponse.userID;
//           //     var accessToken = response.authResponse.accessToken;
//           //   };
//           // The user isn't logged in to Facebook. You can launch a
//           // login dialog with a user gesture, but the user may have
//           // to log in to Facebook before authorizing your application.
//         }
//       }
//
//     });
//   });
// })