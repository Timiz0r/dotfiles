function getBottomScreen() {
	return workspace.screens.reduce((bottom, screen) => {
		if (screen.geometry.y > bottom.geometry.y) return screen;
		if (screen.geometry.y === bottom.geometry.y && screen.geometry.x > bottom.geometry.x) return screen;
		return bottom;
	});
}

function movewindows() {
	const targetScreen = getBottomScreen();
	let clients = workspace.stackingOrder;
	for (client of clients) {
	    if (client.moveableAcrossScreens) {
		workspace.sendClientToScreen(client, targetScreen);
	    }
	}
}

registerShortcut("clearTopMonitor", "Clear top monitor", "", movewindows);
