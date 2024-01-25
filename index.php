<?php

require "vendor/autoload.php";
require "stranky.php";


if (array_key_exists("stranka", $_GET)) {
	$stranka = $_GET["stranka"];

	// kontrola, zda-li zadaná stránka existuje:
	if (array_key_exists($stranka, $seznamStranek) == false) {
		$stranka = "404"; // stránka neexistuje

		// odeslat informaci i vyhledávači, že URL neexistuje
		http_response_code(404);
	}
} else {
	// zjistím první stránku z pole seznamStranek
	$stranka = array_key_first($seznamStranek);
}


?>

<!DOCTYPE html>
<html lang="cs">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="keywords" content="web, HTML, stránka, ukázka">
	<meta name="author" content="Adriana Jančičková">
	<title>
		<?php
		echo $seznamStranek[$stranka]->title;
		?> - Let the adventure begin!
	</title>
	<link rel="stylesheet" href="node_modules/lightbox2/dist/css/lightbox.min.css">
	<link rel="stylesheet" href="./css/styl.css">
	<link rel="stylesheet" href="./css/header.css">
	<link rel="stylesheet" href="./css/section.css">
	<link rel="stylesheet" href="./css/footer.css">
	<link rel="stylesheet" href="./css/galerie.css">
	<link rel="stylesheet" href="./css/reset.css">
	<link rel="shortcut icon" href="img/favicon.png.png">
	<link rel="stylesheet" href="fontawesome/fontawesome-free-6.4.2-web/css/all.min.css">

	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

</head>

<body>
	<header>
		<menu>
			<div class="container">
				<nav>
					<ul>
						<?php

						foreach ($seznamStranek as $idStranky => $instanceStranky) {
							if ($instanceStranky->menu != "") {
								echo "<li><a href='$idStranky'>$instanceStranky->menu</a></li>";
							}
						};
						?>


						<!-- PŮVODNÍ ZÁPIS MENU
						<li class="aktivni"><a href="?stranka=uvod">Domů</a></li>
						<li><a href="?stranka=omne">O mně</a></li>
						<li><a href="?stranka=galerie">Galerie</a></li>
						<li><a href="?stranka=blog">Blog</a></li>
						<li><a href="?stranka=reference">Reference</a></li>
						<li><a href="?stranka=kontakt">Kontakt</a></li> -->
					</ul>
				</nav>
			</div>
		</menu>

		<div class="nadpis">
			<h3>Adriana Jančičková</h3>
			<h2>Let the <span>adventure</span> begin!</h2>
			<div class="social">
				<a href="https://www.facebook.com" target="_blank"><i class="fa-brands fa-square-facebook"></i></i></i></a>
				<a href="https://www.instagram.com" target="_blank"><i class="fa-brands fa-instagram"></i></a>
				<a href="https://www.youtube.com" target="_blank"><i class="fa-brands fa-youtube"></i></a>
			</div>
		</div>
	</header>

	<section id="content">
		<?php
		// echo file_get_contents("$stranka.html");
		$obsah = $seznamStranek[$stranka]->get_obsah();
		echo primakurzy\Shortcode\Processor::process('shortcodes', $obsah);

		?>
	</section>

	<footer>
		<div class="container">
			<div id="adminCopy">
				<div id="admin"><a href="admin.php">Website administration</a></div>
				<div id="copyright">Copyright &copy 2024</div>
			</div>
		</div>
		<p>
			<img src="img/favicon.png.png" alt="ikona" width="22px">
			<span class="paticka_adventure">Let the adventure begin!</span><br>
			All website content (unless otherwise specified) is prohibited from copying.
		</p>
	</footer>

	<div id="nahoru"><i class="fa-solid fa-angle-up"></i></div>

	<script src="node_modules/lightbox2/dist/js/lightbox-plus-jquery.min.js"></script>
	<script src="./js/index.js"></script>
	<script src="./js/gallery.js"></script>
	<script src="./js/blog.js"></script>

	<script>
		document.addEventListener("DOMContentLoaded", function() {
			var zobrazitViceButtons = document.querySelectorAll(".zobrazitVice");

			zobrazitViceButtons.forEach(function(button) {
				button.addEventListener("click", function(event) {
					event.preventDefault();

					var textCast1 = this.previousElementSibling.querySelector(".text-cast1");
					var textCast2 = this.previousElementSibling.querySelector(".text-cast2");

					textCast1.style.display = "inline";
					textCast2.style.display = "inline";
					this.style.display = "none";


					// Přidáme tlačítko "Zobrazit méně" na konec spanu .text-cast2
					var zobrazitMeneButton = document.createElement("button");
					zobrazitMeneButton.type = "button";
					zobrazitMeneButton.classList.add("btn", "btn-light", "zobrazitMene");
					zobrazitMeneButton.innerText = "View less";
					textCast2.appendChild(zobrazitMeneButton);

					zobrazitMeneButton.addEventListener("click", function() {
						textCast1.style.display = "inline";
						textCast2.style.display = "none";
						button.style.display = "inline"; // Zobrazit původní tlačítko "Zobrazit více"
						this.style.display = "none"; // Skryt tlačítko "Zobrazit méně"
					});


				});
			});
		});
	</script>

</body>

</html>