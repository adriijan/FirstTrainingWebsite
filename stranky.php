<?php

$db = new PDO(
	"mysql:host=localhost;dbname=mujweb;charset=utf8",
	"root",
	"",
	array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION)
);

class Stranka
{
	public $id;
	public $title;
	public $menu;

	function __construct($id, $title, $menu)
	{
		$this->id = $id;
		$this->title = $title;
		$this->menu = $menu;
	}

	function get_obsah()
	{
		// return file_get_contents("$this->id.html");
		// chceme načíst obsah stránky z databáze:
		global $db;

		$dotaz = $db->prepare("SELECT obsah FROM stranka WHERE id = ?");
		$dotaz->execute([$this->id]);

		$vysledek = $dotaz->fetch();

		// pokud by databáze nic nevrátila, tak vrátíme prázdný obsah
		if ($vysledek == false) {
			return "";
		} else {
			return $vysledek["obsah"];
		}
	}

	function set_obsah($obsah)
	{
		// file_put_contents("$this->id.html", $obsah);
		// chceme ukládat obsah stránky do databáze

		global $db;

		$dotaz = $db->prepare("UPDATE stranka SET obsah = ? WHERE id = ?");
		$dotaz->execute([$obsah, $this->id]);
	}

	function ulozit($puvodniId)
	{
		global $db;

		if ($puvodniId != "") {
			// jde o aktualizaci stránky - UPDATE
			$dotaz = $db->prepare("UPDATE stranka SET id = ?, titulek = ?, menu = ? WHERE id = ?");
			$dotaz->execute([$this->id, $this->title, $this->menu, $puvodniId]);
		} else { // jde o novou stránku - INSERT INTO

			// zjištění maximálního pořadí
			$dotaz = $db->prepare("SELECT MAX(poradi) AS poradi FROM stranka");
			$dotaz->execute();
			$vysledek = $dotaz->fetch();
			// vezmeme nejvyšší pořadí, které je v tabulce, a navýšíme jej o 1
			$poradi = $vysledek["poradi"] + 1;

			$dotaz = $db->prepare("INSERT INTO stranka SET id = ?, titulek = ?, menu = ?, poradi = ?");
			$dotaz->execute([$this->id, $this->title, $this->menu, $poradi]);
		}
	}

	function smazat() 
	{
		global $db;

		$dotaz = $db->prepare("DELETE FROM stranka WHERE id = ?");
		$dotaz->execute([$this->id]);
	}
}

$seznamStranek = [];
$dotaz = $db->prepare("SELECT id, titulek, menu FROM stranka ORDER BY poradi");
$dotaz->execute();

$stranky = $dotaz->fetchAll();

// vezmeme pole řádek, které nám vrátila databáze, a postupně nakrmíme pole $seznamStránek jednotlivými instancemi třídy Stránka
foreach ($stranky as $stranka) {
	$idStranky = $stranka["id"];
	$seznamStranek[$idStranky] = new Stranka($idStranky, $stranka["titulek"], $stranka["menu"]);
}

/* $seznamStranek = [
	"uvod" => new Stranka("uvod", "Homepage", "Home"),
	"omne" => new Stranka("omne", "About me", "About me"),
	"galerie" => new Stranka("galerie", "Gallery", "Gallery"),
	"blog" => new Stranka("blog", "Blog", "Blog"),
	"reference" => new Stranka("reference", "Reference", "Reference"),
	"kontakt" => new Stranka("kontakt", "Contact", "Contact"),
	"404" => new Stranka("404", "Page Not Found", ""),
]; */
