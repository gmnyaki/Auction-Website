var starttime = document.getElementById("BidStartTime").textContent;
var endtime = document.getElementById("BidEndTime").textContent;

setInterval(function () {
    var date1 = new Date();
    var date2 = new Date(starttime);
    var date3 = new Date(endtime);

    if (date1 < date2 && date1 > date3) {
        document.getElementById("timeremaining").textContent = "There is an error, an auction was incorrectly configured";
        document.getElementById("NewBid").disabled = true;
        document.getElementById("SubmitBid").disabled = true;
        return;
    } else if (date1 < date2) {
        document.getElementById("timeremaining").textContent = "Auction has not yet begun."
        document.getElementById("NewBid").disabled = true;
        document.getElementById("SubmitBid").disabled = true;
        return;
    } else if (date1 > date3) {
        document.getElementById("timeremaining").textContent = "Auction has expired.";
        document.getElementById("NewBid").disabled = true;
        document.getElementById("SubmitBid").disabled = true;
        return;
    } else {
        document.getElementById("NewBid").disabled = false;
        document.getElementById("SubmitBid").disabled = false;
        var timediff = Math.abs(date1.getTime() - date3.getTime());
        var diffsecs = Math.ceil(timediff / 1000);
        var diffmins = Math.ceil(diffsecs / 60);
        var diffhrs = diffmins / 60;
        var diffdays = Math.ceil(diffhrs / 24);
        document.getElementById("timeremaining").textContent = diffsecs + " seconds remaining. " + diffmins + " minutes remaining. " + diffhrs + " hours remaining. " + diffdays + " days remaining.";
    }
}
, 1000);
