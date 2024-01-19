// zavolání funkce sortable pro možnost přesouvání stránek
$("#stranky").sortable({
	update: () => {
		const sortedIDs = $( "#stranky" ).sortable( "toArray" );
		console.log(sortedIDs );

		$.ajax({
			url: "admin.php",
			data: {
				"poradi" : sortedIDs,
			}
		})

	}
});

