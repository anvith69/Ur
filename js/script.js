let navbar = document.querySelector('.header .flex .navbar');
let profile = document.querySelector('.header .flex .profile');
let notifications = document.querySelector('.order-notifications');

// Function to mark notifications as seen
function markNotificationsAsSeen() {
    fetch('components/mark_notifications_seen.php')
        .then(response => response.text())
        .then(data => {
            if(data === 'success') {
                // Hide notifications after marking them as seen
                if(notifications) {
                    notifications.style.display = 'none';
                }
            }
        });
}

// Add click event to notifications
if(notifications) {
    notifications.onclick = () => {
        markNotificationsAsSeen();
    }
}


document.querySelector('#menu-btn').onclick = () => {
    navbar.classList.toggle('active');
    profile.classList.remove('active');
}

document.querySelector('#user-btn').onclick = () => {
    profile.classList.toggle('active');
    navbar.classList.remove('active');
}

window.onscroll = () => {
    navbar.classList.remove('active');
    profile.classList.remove('active');
}

let mainImage = document.querySelector('.quick-view .box .row .image-container .main-image img');
let subImages = document.querySelectorAll('.quick-view .box .row .image-container .sub-image img');

subImages.forEach(images => {
    images.onclick = () => {
        src = images.getAttribute('src');
        mainImage.src = src;
    }
});