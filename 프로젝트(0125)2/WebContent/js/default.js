const $headerStatus = $('.header_status');
const $headerStatusDropbox = $('.header_status_dropbox');
/*header Status Dropbox start*/
$headerStatus.click(function (e) {
    e.preventDefault();
    $headerStatusDropbox.toggleClass("show");
});