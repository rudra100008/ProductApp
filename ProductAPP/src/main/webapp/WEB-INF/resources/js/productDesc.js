const carousel = document.querySelector('.carousel');
const cards = document.querySelectorAll('.card');
const prevButton = document.querySelector('.prev');
const nextButton = document.querySelector('.next');

let currentIndex = 0;

function updateCarousel() {
    const cardWidth = cards[0].clientWidth;
    const carouselWidth = carousel.clientWidth;
    const maxIndex = Math.floor(cards.length - carouselWidth / cardWidth);

    if (currentIndex < 0) {
        currentIndex = maxIndex;
    } else if (currentIndex > maxIndex) {
        currentIndex = 0;
    }

    const offset = -currentIndex * (cardWidth + 20); // Include margin
    carousel.style.transform = `translateX(${offset}px)`;
}

prevButton.addEventListener('click', () => {
    currentIndex--;
    updateCarousel();
});

nextButton.addEventListener('click', () => {
    currentIndex++;
    updateCarousel();
});

// Initialize carousel position
updateCarousel();
