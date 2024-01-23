<?php

require "stranky.php";
session_start();
$chyba = "";

// zpracování formuláře:
if (array_key_exists("prihlasit", $_POST)) {
	$jmeno = $_POST["jmeno"];
	$heslo = $_POST["heslo"];

	if ($jmeno == "admin" && $heslo == "12345") {
		$_SESSION["prihlasenyUser"] = $jmeno;
	} else {
		$chyba = "Nesprávné přihlašovací údaje.";
	}
}

// zpracování tlačítka "odhlásit":
if (array_key_exists("odhlasit", $_POST)) {
	unset($_SESSION["prihlasenyUser"]);
	header("Location:?");
}

// zpracování administrace pro přihlášené
if (array_key_exists("prihlasenyUser", $_SESSION)) {
	$instanceAktualniStranky = null;

	// zpracování výběru aktuální stránky:
	if (array_key_exists("stranka", $_GET)) {
		$idStranky = $_GET["stranka"];
		$instanceAktualniStranky = $seznamStranek[$idStranky];
	}

	// zpracování tlačítka pro přidání nové stránky
	if (array_key_exists("pridat", $_GET)) {
		$instanceAktualniStranky = new Stranka("", "", "");
	}

	// zpracování mazání stránek
	if (array_key_exists("smazat", $_GET)) {
		$instanceAktualniStranky->smazat();
		header("Location: ?");
	}

	// zpracování formuláře pro uložení změn
	if (array_key_exists("ulozit", $_POST)) {

		// původní ID pro pozdější změny
		$puvodniId = $instanceAktualniStranky->id;

		// ukládání změny id, titulku a menu
		$instanceAktualniStranky->id = $_POST["upravit-id"];
		$instanceAktualniStranky->title = $_POST["upravit-titulek"];
		$instanceAktualniStranky->menu = $_POST["upravit-menu"];

		// zavoláme funkci pro uložení změněných hodnot do DB
		$instanceAktualniStranky->ulozit($puvodniId);


		// ukládání obsahu
		$obsah = $_POST["obsah"]; // textarea má name="obsah"
		$instanceAktualniStranky->set_obsah($obsah);

		// přesměrujeme se na url s editací stránky s novým ID (když se ID změní, nesmíme zůstat na původí url)
		header("Location: ?stranka=" . urlencode($instanceAktualniStranky->id));
	}

	// zpracování požadavku změny pořadí stránek z JavaScriptu:
	if (array_key_exists("poradi", $_GET)) {
		$poradi = $_GET["poradi"]; // $poradi = pole IDs

		// zavolání funkce pro nastavení pořadí a uložení do DB
		Stranka::nastavitPoradi($poradi);

		echo "OK"; // odpovíme JS, že je to OK
		exit; // script ukončíme, aby se do JS negeneroval zbytek stránky

	}
}
?>



<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="fontawesome/fontawesome-free-6.4.2-web/css/all.min.css">
	<link rel="stylesheet" href="css/admin.css">

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

	<title>Administrace</title>
</head>

<body>
	<div class="admin-body">
		<?php
		// pokud není uživatel přihlášený, zobrazí se formulář - SEKCE PRO NEPŘIHLÁŠENÉ:
		if (array_key_exists("prihlasenyUser", $_SESSION) == false) { ?>
			<main class="form-signin w-100 m-auto">
				<form id="prihlaseni" method="post">
					<h1 class="h3 mb-3 fw-normal">Přihlašte se, prosím</h1>

					<?php // v případě nesprávných přihlašovacích údajů se zobrazí chybová hláška
					if ($chyba != "") { ?>
						<div class="alert alert-danger" role="alert">
							<?php echo $chyba; ?>
						</div>
					<?php } ?>

					<div class="form-floating">
						<input name="jmeno" type="text" class="form-control" id="floatingInput" placeholder="login">
						<label for="floatingInput">Přihlašovací jméno</label>
					</div>
					<div class="form-floating">
						<input name="heslo" type="password" class="form-control" id="floatingPassword" placeholder="Heslo">
						<label for="floatingPassword">Heslo</label>
					</div>

					<div class="form-check text-start my-3">
						<input class="form-check-input" type="checkbox" value="remember-me" id="flexCheckDefault">
						<label class="form-check-label" for="flexCheckDefault">
							Zapamatovat přihlašovací údaje
						</label>
					</div>
					<button name="prihlasit" class="btn btn-primary w-100 py-2" type="submit">Přihlásit</button>
				</form>
			</main>

		<?php
		} else { // pokud je  uživatel přihlášený, dostane se do SEKCE PRO PŘIHLÁŠENÉ
			echo "<main class='admin'>"; ?>

			<div class="container">
				<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
					<div>
						Přihlášený uživatel: <?php echo $_SESSION['prihlasenyUser']; ?>
					</div>

					<div class="col-md-3 text-end">
						<form method='post'>
							<button name='odhlasit' class="btn btn-outline-primary me-2">Odhlásit</button>
						</form>

					</div>
				</header>
			</div>

			<?php

			// seznam stránek s ikonkama upravit, náhled, smazat
			echo "<ul id='stranky' class='list-group'>";
			foreach ($seznamStranek as $idStranky => $instanceStranky) {

				$active = "";
				$buttonClass = "btn-primary";
				if ($instanceStranky == $instanceAktualniStranky) {
					$active = 'active';
					$buttonClass = "btn-light";
				}

				echo "<li class='list-group-item $active' id='$instanceStranky->id'>
			<a class='btn $buttonClass' href='?stranka=$instanceStranky->id'>
			<i class='fa-solid fa-pen-to-square'></i>
			</a>

			<a class='btn smazat 	$buttonClass' href='?stranka=$instanceStranky->id&smazat'>
			<i class='fa-solid fa-trash-can'></i>
			</a>

			<a class='btn $buttonClass' href='$instanceStranky->id' target='_blank'>
			<i class='fa-solid fa-eye'></i>
			</a>

			<span>$instanceStranky->id</span>
			</li>";
			}
			echo "</ul>";

			// přidání tlačítka pro přidávání nových stránek
			?>

			<div class="container">
				<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
					<div class="col-md-3 text-start">
						<form>
							<button name='pridat' class='btn btn-outline-primary me-2'>Přidat</button>
						</form>
					</div>
				</header>
			</div>

			<?php

			// editační formulář / přidávací formulář:
			if ($instanceAktualniStranky != null) {
				echo "<div class='alert alert-secondary' role='alert'>
			  <h1>";
				if ($instanceAktualniStranky->id == "") {
					echo "Přidávání nové stránky";
				} else {
					echo "Editace stránky: $instanceAktualniStranky->id";
				}
				echo "</h1></div>";
			?>
				<form method="post">

					<div class="form-floating">
						<input class="form-control" placeholder="ID" type="text" name="upravit-id" id="upravit-id" value="<?php echo  htmlspecialchars($instanceAktualniStranky->id) ?>">
						<label for="upravit-id">ID</label>
					</div>

					<div class="form-floating">
						<input class="form-control" placeholder="Titulek" type="text" name="upravit-titulek" id="upravit-titulek" value="<?php echo  htmlspecialchars($instanceAktualniStranky->title) ?>">
						<label for="upravit-titulek">Titulek</label>
					</div>

					<div class="form-floating">
						<input class="form-control" placeholder="Menu" type="text" name="upravit-menu" id="upravit-menu" value="<?php echo  htmlspecialchars($instanceAktualniStranky->menu) ?>">
						<label for="upravit-menu">Menu</label>
					</div>

					<textarea name="obsah" id="obsah" cols="80" rows="15">
				<?php
				echo htmlspecialchars($instanceAktualniStranky->get_obsah());
				?>
			</textarea>
					<br>
					<button class="btn btn-primary" name="ulozit"><i class="fa-solid fa-floppy-disk"></i> Uložit</button>
				</form>

				<script src="vendor/tinymce/tinymce/tinymce.min.js" referrerpolicy="origin"></script>
				<script>
					tinymce.init({
						selector: '#obsah',
						language: 'cs',
						language_url: '<?php echo dirname($_SERVER["PHP_SELF"]); ?>/vendor/tweeb/tinymce-i18n/langs/cs.js',
						height: '50vw',
						entity_encoding: 'raw',
						verify_html: false,
						content_css: [
							'css/reset.css',
							'css/styl.css',
							'css/section.css',
							'css/header.css',
							'css/footer.css',
							'css/galerie.css',
							'fontawesome/fontawesome-free-6.4.2-web/css/all.min.css',
							'fonts/borel-v2-latin_latin-ext-regular.woff2',
							'fonts/homemade-apple-v22-latin-regular.woff2',
							'fonts/love-ya-like-a-sister-v20-latin-regular.woff2',
							'fonts/pacifico-v22-latin_latin-ext-regular.woff2',
							'fonts/pangolin-v11-latin_latin-ext-regular.woff2',
							'fonts/poiret-one-v16-latin_latin-ext-regular.woff2',
							'fonts/satisfy-v21-latin-regular.woff2',
						],
						body_id: "content",
						plugins: 'advlist anchor autolink charmap code colorpicker contextmenu directionality emoticons fullscreen hr image imagetools insertdatetime link lists nonbreaking noneditable pagebreak paste preview print save searchreplace tabfocus table textcolor textpattern visualchars',
						toolbar1: "insertfile undo redo | styleselect | fontselect | fontsizeselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | forecolor backcolor",
						toolbar2: "link unlink anchor | fontawesome | image media | responsivefilemanager | preview code",
						external_plugins: {
							'responsivefilemanager': '<?php echo dirname($_SERVER['PHP_SELF']); ?>/vendor/primakurzy/responsivefilemanager/tinymce/plugins/responsivefilemanager/plugin.min.js',
						},
						external_filemanager_path: "<?php echo dirname($_SERVER['PHP_SELF']); ?>/vendor/primakurzy/responsivefilemanager/filemanager/",
						filemanager_title: "File manager",

					});
				</script>
		<?php
			}
			echo "</main>";
		} ?>
	</div>

	<script src="./js/admin.js"></script>
</body>

</html>