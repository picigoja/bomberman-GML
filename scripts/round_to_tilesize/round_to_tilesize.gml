function round_to_tilesize(int) {
	return int div TILE_SIZE * TILE_SIZE;
}

function round_to_tilesize_centered(int) {
	return (int div TILE_SIZE * TILE_SIZE) + TILE_SIZE * .5;
}