<h1>Battleship</h1>
<hr>
<ul>
  <b>Areas of focus</b>
  <li>Object oriented Programming</li>
</ul>
This is a playable game of battleship
with a command line and web base version of the game.
<ul> <b>Levels of play</b>
  <li> Beginner = 12x12 grid, 2-unit boat, 3-unit boat, 4-unit boat, 5-unit boat</li>
<li>Intermediate = 24x24 grid, 2-unit boat, 3-unit boat, 4-unit boat, 5-unit boat</li>
<li>Advanced = 36x36 grid, 2-unit boat, 3-unit boat, 4-unit boat, 5-unit boat</li>
</ul>
You start by picking your board size.
Then you will place your ships. 
<ul><b>Note</b>
  <li>Ships cannot wrap around the board</li>
  <li>Ships cannot overlap</li>
  <li>Ships can be laid horizontally or vertically</li>
<li>Coordinates must correspond to the first and last units of the ship. (IE: You can’t place a two unit ship at "A1 A3")</li>
  </ul>
<b>Game flow</b>
Once ships are laid out it is time to move on to the player shoot sequence
you will see two  maps with coordinates listed on top and side of grid.

<ul><b>Your Shot</b>
  <li>If the coordinate has already been shot at, reject the shot and try to shoot again</li>
  <li>If the coordinate misses the opponent ships, it will be marked with an O on the map.</li>
  <li>If the coordinate "hits" an opponent ship, it will be marked with an X on the map.</li>
</ul>

<b>More Notes</b>
* The computer player randomly selects a location which has not been shot at and shoots at it.
* If the shot misses the player ships, mark it with a O on theier map.
* If the shot "hits" a player ship, it'll be marked with an X on Thier map.
<b>Hit Ship Sequence</b>
* If your hit did not sink the ship, you will just hit an enemy ship
* If the hit sunk the ship, you will be told the ship was sunk.
* If the hit sunk the ship and it was the last enemy ship, You will be redirected to a Winning scene.(Web Based Version)

<b>WWhether you win or lose…</b>
* You will get a sorry/congratulations message
