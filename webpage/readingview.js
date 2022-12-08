function init() {
    //loadBackground = document.body.style.background-color
    var boxes = document.getElementsByTagName('input')
    for (var i = 0; i < boxes.length; i++) {
        boxes[i].addEventListener('click', toggleHighlight, false);
        boxes[i].addEventListener('click', toggleHover, false);
    }
}
function toggleHover() {
    var device = this.value;
    switch (device) {
        case 'hoverable': {
            var hoverable = document.querySelectorAll('.hoverable');
            for (var i = 0; i < hoverable.length; i++) {
                hoverable[i].classList.toggle('on');
            };
        };
        break;
    }
}
function toggleHighlight() {
    var device = this.value;
    switch (device) {
        case 'male_character': {
            var male_character = document.querySelectorAll('.male_character');
            for (var i = 0; i < male_character.length; i++) {
                male_character[i].classList.toggle('on');
            };
        };
        break;
        case 'female_character': {
            var female_character = document.querySelectorAll('.female_character');
            for (var i = 0; i < female_character.length; i++) {
                female_character[i].classList.toggle('on');
            };
        };
        break;
        case 'nonbinary_character': {
            var nonbinary_character = document.querySelectorAll('.nonbinary_character');
            for (var i = 0; i < nonbinary_character.length; i++) {
                nonbinary_character[i].classList.toggle('on');
            };
        };
        break;
        case 'male_dia': {
            var male_dia = document.querySelectorAll('.male_dia');
            for (var i = 0; i < male_dia.length; i++) {
                male_dia[i].classList.toggle('on');
            };
        };
        break;
        case 'female_dia': {
            var female_dia = document.querySelectorAll('.female_dia');
            for (var i = 0; i < female_dia.length; i++) {
                female_dia[i].classList.toggle('on');
            };
        };
        break;
        case 'nonbinary_dia': {
            var nonbinary_dia = document.querySelectorAll('.nonbinary_dia');
            for (var i = 0; i < nonbinary_dia.length; i++) {
                nonbinary_dia[i].classList.toggle('on');
            };
        };
        break;
        case 'male_transform': {
            var male_transform = document.querySelectorAll('.male_transform');
            for (var i = 0; i < male_transform.length; i++) {
                male_transform[i].classList.toggle('on');
            };
        };
        break;
        case 'female_transform': {
            var female_transform = document.querySelectorAll('.female_transform');
            for (var i = 0; i < female_transform.length; i++) {
                female_transform[i].classList.toggle('on');
            };
        };
        break;
        case 'nonbinary_transform': {
            var nonbinary_transform = document.querySelectorAll('.nonbinary_transform');
            for (var i = 0; i < nonbinary_transform.length; i++) {
                nonbinary_transform[i].classList.toggle('on');
            };
        };
        break;
    }
}
window.onload = init;