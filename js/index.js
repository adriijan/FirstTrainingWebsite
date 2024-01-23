const nahoru = document.querySelector("#nahoru");
nahoru.addEventListener("click", (event) => {
	window.scrollTo({
		left: 0,
		top: 0,
		behavior: "smooth"
	});
})

const header = document.querySelector("header");

window.addEventListener("scroll", (event) => {

	const headerPosition = header.getBoundingClientRect();
	if(window.scrollY > headerPosition.bottom) {
		nahoru.classList.add("zobrazit");
	}
	else {
		nahoru.classList.remove("zobrazit");
	}
});