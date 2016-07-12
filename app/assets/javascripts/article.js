//入力文字制限の処理
$(document).ready(function(){
    $('#characterLeft').text('100 characters left');
    $('#message').keydown(function () {
        var max = 100;
        var len = $(this).val().length;
        if (len >= max) {
            $('#characterLeft').text('You have reached the limit');
            $('#characterLeft').addClass('red');
            $('#characterLeft').removeClass('help-block');
            $('#btnSubmit').addClass('disabled');
        }
        else {
            var ch = max - len;
            $('#characterLeft').text(ch + ' characters left');
            $('#btnSubmit').removeClass('disabled');
            $('#characterLeft').removeClass('red');
        }
    });
});

$(document).ready(function(){
    $('#characterLeft2').text('400 characters left');
    $('#message2').keydown(function () {
        var max = 400;
        var len = $(this).val().length;
        if (len >= max) {
            $('#characterLeft2').text('You have reached the limit');
            $('#characterLeft2').addClass('red');
            $('#characterLeft2').removeClass('help-block');
            $('#btnSubmit').addClass('disabled');
        }
        else {
            var ch = max - len;
            $('#characterLeft2').text(ch + ' characters left');
            $('#btnSubmit').removeClass('disabled');
            $('#characterLeft2').removeClass('red');
        }
    });
});

$(document).ready(function(){
    $('#characterLeft3').text('1000 characters left');
    $('#message3').keydown(function () {
        var max = 1000;
        var len = $(this).val().length;
        if (len >= max) {
            $('#characterLeft3').text('You have reached the limit');
            $('#characterLeft3').addClass('red');
            $('#characterLeft3').removeClass('help-block');
            $('#btnSubmit').addClass('disabled');
        }
        else {
            var ch = max - len;
            $('#characterLeft3').text(ch + ' characters left');
            $('#btnSubmit').removeClass('disabled');
            $('#characterLeft3').removeClass('red');
        }
    });
});

$(document).ready(function(){
    $('#characterLeft4').text('1000 characters left');
    $('#message4').keydown(function () {
        var max = 1000;
        var len = $(this).val().length;
        if (len >= max) {
            $('#characterLeft4').text('You have reached the limit');
            $('#characterLeft4').addClass('red');
            $('#characterLeft4').removeClass('help-block');
            $('#btnSubmit').addClass('disabled');
        }
        else {
            var ch = max - len;
            $('#characterLeft4').text(ch + ' characters left');
            $('#btnSubmit').removeClass('disabled');
            $('#characterLeft4').removeClass('red');
        }
    });
});

$(document).ready(function(){
    $('#characterLeft5').text('1000 characters left');
    $('#message5').keydown(function () {
        var max = 1000;
        var len = $(this).val().length;
        if (len >= max) {
            $('#characterLeft5').text('You have reached the limit');
            $('#characterLeft5').addClass('red');
            $('#characterLeft5').removeClass('help-block');
            $('#btnSubmit').addClass('disabled');
        }
        else {
            var ch = max - len;
            $('#characterLeft5').text(ch + ' characters left');
            $('#btnSubmit').removeClass('disabled');
            $('#characterLeft5').removeClass('red');
        }
    });
});