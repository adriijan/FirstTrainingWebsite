document.addEventListener('DOMContentLoaded', function () {
	const italyLink = document.getElementById('italyLink');
	const northLink = document.getElementById('northLink');
	const christmasLink = document.getElementById('christmasLink');
	const parisLink = document.getElementById('parisLink');
	const londonLink = document.getElementById('londonLink');

	if (italyLink && northLink && christmasLink && parisLink && londonLink) {
		italyLink.addEventListener('click', function (event) {
			event.preventDefault();
			scrollToElement('#italy');
		});

		northLink.addEventListener('click', function (event) {
			event.preventDefault();
			scrollToElement('#north');
		});

		christmasLink.addEventListener('click', function (event) {
			event.preventDefault();
			scrollToElement('#christmas');
		});

		parisLink.addEventListener('click', function (event) {
			event.preventDefault();
			scrollToElement('#paris');
		});

		londonLink.addEventListener('click', function (event) {
			event.preventDefault();
			scrollToElement('#london');
		});
	}

	function scrollToElement(elementId) {
		const element = document.querySelector(elementId);
		if (element) {
			element.scrollIntoView({ behavior: 'smooth' });
		}
	}
});
