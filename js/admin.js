// zavolání funkce sortable pro možnost přesouvání stránek
$("#stranky").sortable({
	update: () => {
		const sortedIDs = $("#stranky").sortable("toArray");
		console.log(sortedIDs);

		$.ajax({
			url: "admin.php",
			data: {
				"poradi": sortedIDs,
			}
		})

	}
});


$("#stranky .smazat").click((event) => {

	if (confirm("Delete this page?") == false) {
		event.preventDefault(); // přeruším událost
	}

});	