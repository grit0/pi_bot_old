var login = require("facebook-chat-api");
var os = require('os');
var ifaces = os.networkInterfaces();

login({email: "lineemb@gmail.com", password: "linebot"}, function callback (err, api) {
    if(err) return console.error(err);
 
    // api.listen(function callback(err, message) {
    //     api.sendMessage("หวัดดี"+message.body, message.threadID);
    // var ID_A = "100006518468165";
    //var yourID = "100007120352956";
var yourID =100006776198525
     // });
//api.listen(function callback(err, message) {


Object.keys(ifaces).forEach(function (ifname) {
  var alias = 0;

  ifaces[ifname].forEach(function (iface) {
    if ('IPv4' !== iface.family || iface.internal !== false) {
      // skip over internal (i.e. 127.0.0.1) and non-ipv4 addresses
      return;
    }

    if (alias >= 1) {
      // this single interface has multiple ipv4 addresses
      console.log(ifname + ':' + alias, iface.address);
	api.sendMessage(iface.address, yourID);

    } else {
      // this interface has only one ipv4 adress
      console.log(ifname, iface.address);
 api.sendMessage(iface.address, yourID);

    }
    ++alias;
  });
});

//	api.sendMessage("Yes", yourID);
//	 });
});
