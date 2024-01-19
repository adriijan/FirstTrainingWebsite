<?php

use PHPMailer\PHPMailer\PHPMailer;

$chyby = [];
$jmeno = "";
$telefon = "";
$email = "";
$zprava = "";
$odeslano = "";

if (array_key_exists("odeslat", $_POST)) {
	// formulář byl odeslán - vytáhnu si z něj údaje
	$jmeno = $_POST["jmeno"];
	$telefon = $_POST["telefon"];
	$email = $_POST["email"];
	$zprava = $_POST["zprava"];

	// validace hodnot

	if (mb_strlen($jmeno) < 5) {
		$chyby["jmeno"] = "Please, write your name.";
	}

	if (mb_strlen($telefon) < 9) {
		$chyby["telefon"] = "Invalid phone number";
	}

	if (!preg_match("/.@.+\\.+/", $email)) {
		$chyby["email"] = "Invalid e-mail address";
	}

	if (mb_strlen($zprava) < 5) {
		$chyby["zprava"] = "Please, write a message.";
	}

	// zkontrolujeme, zdali je pole s chybami prázdné
	if (count($chyby) == 0) {
		// vše je ok - místo formuláře chceme vypsat hlášku o odeslání
		$odeslano = true;

		// odešleme správci email, že mu někdo napsal přes kontaktní formulář
		$mail = new \PHPMailer\PHPMailer\PHPMailer(true);
		$mail->CharSet = "utf-8";

		$mail->setFrom('info@mujweb.com', "MůjWeb");
		$emailAddress = $shortcode->getParameter("email");
		$mail->addAddress($emailAddress);

		$mail->isHTML(true);
		$mail->Subject = "Contact form";
		$mail->Body = "
					<h1>Contact form</h1>
					<div><b>Name:</b> $jmeno </div>
					<div><b>Phone:</b> $telefon </div>
					<div><b>Email:</b> $email </div>
					<div><b>Message:</b> $zprava </div>
		";
		$mail->send();
	}
}

?>


<div class="formular">

	<?php if ($odeslano == false) { ?>
		<h2>If you require any further information, feel free to contact me.</h2>
		<div id="kontaktni-formular">
			<form method="post" action="#kontaktni-formular">
				<div class="radka">
					<input class="prvek" type="text" name="jmeno" id="jmeno" placeholder=" " value="<?php echo htmlspecialchars($jmeno); ?>" />
					<label for="jmeno">Name</label>
					<?php
					if (array_key_exists("jmeno", $chyby)) {
						echo "<div class='chyba'>{$chyby['jmeno']}</div>";
					}
					?>
				</div>

				<div class="radka">
					<input class="prvek" type="text" name="telefon" id="telefon" placeholder=" " value="<?php echo htmlspecialchars($telefon); ?>" />
					<label for="telefon">Phone number</label>
					<?php
					if (array_key_exists("telefon", $chyby)) {
						echo "<div class='chyba'>{$chyby['telefon']}</div>";
					}
					?>
				</div>

				<div class="radka">
					<input class="prvek" type="email" name="email" id="email" placeholder=" " value="<?php echo htmlspecialchars($email); ?>" />
					<label for="email">E-mail</label>
					<?php
					if (array_key_exists("email", $chyby)) {
						echo "<div class='chyba'>{$chyby['email']}</div>";
					}
					?>
				</div>

				<div class="radka">
					<textarea class="prvek" name="zprava" id="zprava" placeholder=" " rows="3"><?php echo htmlspecialchars($zprava); ?></textarea>
					<label for="zprava">Message</label>
					<?php
					if (array_key_exists("zprava", $chyby)) {
						echo "<div class='chyba'>{$chyby['zprava']}</div>";
					}
					?>
				</div>

				<div class="radka">
					<button name="odeslat">Send</button>
				</div>
			</form>
		</div>

	<?php } else { ?>
		<h2 id="submitted">Submitted successfully!</h2>
	<?php } ?>
</div>

<style>
	.chyba {
		color: red;
		font-weight: bold;
	}
</style>