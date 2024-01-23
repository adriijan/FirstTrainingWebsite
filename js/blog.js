document.addEventListener('DOMContentLoaded', function () {
	const scrollLinks = document.querySelectorAll('.scroll-link');

	if (scrollLinks) {
		scrollLinks.forEach(function (link) {
			link.addEventListener('click', function (event) {
				event.preventDefault();
				const targetId = this.getAttribute('href').substring(1);
				scrollToElement('#' + targetId);
			});
		});
	}

	function scrollToElement(elementId) {
		const element = document.querySelector(elementId);
		if (element) {
			element.scrollIntoView({ behavior: 'smooth' });
		}
	}
});
