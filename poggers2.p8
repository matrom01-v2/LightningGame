pico-8 cartridge // http://www.pico-8.com
version 38
__lua__
--globals
test = 0
level = 1
map_x=0
building_x=0
skyscrp_x=0
map_speed=.5
bldng_speed=0.15
skyscrp_speed=0.05
deaths = 0
// higheest level allowed to be
// played
max_level = 3
-->8
--player
player = {
 landed = true,
 x = 0,
 y = 48,
 dy = 0,
 acc = 0.16,
 
 jump = function(player)
  player.dy = -2.7
  player.landed = false
  sfx(2)
 end,
 
 die = function(player)
  sfx(1)
  //run()
  deaths+=1
	 player:change_level()
 end,
 
 change_level = function(player)
		if (level == 1) then
		 player.x = 0
		 player.y = 48
		end
		if (level == 2) then
		 player.x = 0
		 player.y = 112
		end
		if (level == 3) then
			player.x = 0
			player.y = 176
		end
		if (level == 4) then
			player.x = 0
			player.y = 240
		end
		if (level == 5) then
			player.x = 0
			player.y = 304
		end
		if (level == 6) then
			player.x = 0
			player.y = 368
		end
		if (level == 7) then
			player.x = 0
			player.y = 432
		end
		if (level == 8) then
			player.x = 0
			player.y = 496
		end
	end,
	 
 move = function(player)
  player.x += player.acc
 end,
 
 yset = function(player)
  player.y += player.dy
  player.dy += 0.2
 end,
 
 dyset = function(player, set)
  player.dy = set
 end
}
-->8
--update function
function _update60()

	map_x-=map_speed
 if map_x<-255 then 
 	map_x=0
 end
 
 building_x-=bldng_speed
  if building_x<-255 then 
    	building_x=0
  end
		-- -254

    --skyscrap
  skyscrp_x-=skyscrp_speed
  if skyscrp_x<-255 then 
   skyscrp_x=0
  end

 grid_x = flr(player.x)
 grid_y = flr(player.y/8)
 
 if (btn(2)) then 
  if (mget(grid_x, grid_y+1) == 2) then
   player:jump()
  end
  
  if ((mget(grid_x, grid_y + 1) == 4 or mget(grid_x + 1, grid_y + 1) == 4 or mget(grid_x, grid_y) == 4) and player.landed) then
   player:orb()
  end
 end
 
 if (mget(grid_x+.8, grid_y) == 3 or mget(grid_x+1, grid_y) == 2 or mget(grid_x, grid_y) == 2 or mget(grid_x, grid_y) == 35) then
  player:die()
 end
 
 if ((mget(grid_x, grid_y+1) == 2 or mget(grid_x+1, grid_y+1) == 2) and not btn(2)) then
  player:dyset(0)
 end
 
 if (mget(grid_x, grid_y+1) == 2) then
  player.y = grid_y * 8 
 end
 
 if (mget(grid_x+1, grid_y) == 5 or mget(grid_x, grid_y) == 5) then
  player:pad()
 end
 
 if (mget(grid_x+1, grid_y) == 4) then
  if (level == max_level) then
   level = 1
   deaths = 0
   sfx(3)
  else
  	level += 1
  end
  sfx(0)
  player:change_level()
 end
 
 
 if (not btn(2)) then
  player.landed = true
 end
 
 player:move()
 player:yset()
end
-->8
--draw function
function _draw()
 cls()
 camera(player.x * 8 - 24, player.y - 64)
 if (level == 1) then
	map(80,49,skyscrp_x,0,16,16)
  map(80,49,skyscrp_x+128,0,16,16)
  map(80,49,skyscrp_x+256,0,16,16)
  map(80,49,skyscrp_x+320,0,16,16)
	map(80,49,skyscrp_x+384,0,16,16)
  map(72,49,building_x,0,16,16)
  map(72,49,building_x+200,0,16,16)
  map(72,49,building_x+400,0,16,16)
  map(72,49,building_x+600,0,16,16)
  map(72,48,building_x+800,0,16,16)
  map(0, 0, 0, 0, 128, 8)
 end
 if (level == 2) then
 	map(80,48,skyscrp_x,48,16,16)
  map(80,48,skyscrp_x+128,48,16,16)
  map(80,48,skyscrp_x+256,48,16,16)
  map(80,48,skyscrp_x+320,48,16,16)
	map(80,49,skyscrp_x+384,48,16,16)
  map(72,48,building_x,48,16,16)
  map(72,48,building_x+200,48,16,16)
  map(72,48,building_x+400,48,16,16)
  map(72,48,building_x+600,48,16,16)
  map(72,48,building_x+800,48,16,16)
 	map(0, 8, 0, 64, 128, 8)
 end
 if (level == 3) then
 	map(80,48,skyscrp_x,112,16,16)
  map(80,48,skyscrp_x+128,112,16,16)
  map(80,48,skyscrp_x+256,112,16,16)
  map(80,48,skyscrp_x+320,112,16,16)
	map(80,49,skyscrp_x+384,112,16,16)
  map(72,48,building_x,112,16,16)
  map(72,48,building_x+200,112,16,16)
  map(72,48,building_x+400,112,16,16)
  map(72,48,building_x+600,112,16,16)
  map(72,48,building_x+800,112,16,16)
 	map(0, 16, 0, 128, 128, 8)
 end
 if (level == 4) then
 	map(80,48,skyscrp_x,176,16,16)
  map(80,48,skyscrp_x+128,176,16,16)
  map(80,48,skyscrp_x+256,176,16,16)
  map(80,48,skyscrp_x+320,176,16,16)
	map(80,49,skyscrp_x+384,176,16,16)
  map(72,48,building_x,176,16,16)
  map(72,48,building_x+200,176,16,16)
  map(72,48,building_x+400,176,16,16)
  map(72,48,building_x+600,176,16,16)
  map(72,48,building_x+800,176,16,16)
 	map(0, 24, 0, 192, 128, 8)

 end
 if (level == 5) then
 	map(80,48,skyscrp_x,240,16,16)
  map(80,48,skyscrp_x+128,240,16,16)
  map(80,48,skyscrp_x+256,240,16,16)
  map(80,48,skyscrp_x+320,240,16,16)
	map(80,49,skyscrp_x+384,240,16,16)
  map(72,48,building_x,240,16,16)
  map(72,48,building_x+200,240,16,16)
  map(72,48,building_x+400,240,16,16)
  map(72,48,building_x+600,240,16,16)
  map(72,48,building_x+800,240,16,16)
 	map(0, 32, 0, 256, 128, 8)
 end
 if (level == 6) then
 	map(80,48,skyscrp_x,304,16,16)
  map(80,48,skyscrp_x+128,304,16,16)
  map(80,48,skyscrp_x+256,304,16,16)
  map(80,48,skyscrp_x+320,304,16,16)
	map(80,49,skyscrp_x+384,304,16,16)
  map(72,48,building_x,304,16,16)
  map(72,48,building_x+200,304,16,16)
  map(72,48,building_x+400,304,16,16)
  map(72,48,building_x+600,304,16,16)
  map(72,48,building_x+800,304,16,16)
 	map(0, 40, 0, 320, 128, 8)
 end
 if (level == 7) then
 	map(80,48,skyscrp_x,368,16,16)
  map(80,48,skyscrp_x+128,368,16,16)
  map(80,48,skyscrp_x+256,368,16,16)
  map(80,48,skyscrp_x+320,368,16,16)
	map(80,49,skyscrp_x+384,368,16,16)
  map(72,48,building_x,368,16,16)
  map(72,48,building_x+200,368,16,16)
  map(72,48,building_x+400,368,16,16)
  map(72,48,building_x+600,368,16,16)
  map(72,48,building_x+800,368,16,16)
 	map(0, 48, 0, 384, 128, 8)
 end
 if (level == 8) then
 	map(80,48,skyscrp_x,432,16,16)
  map(80,48,skyscrp_x+128,432,16,16)
  map(80,48,skyscrp_x+256,432,16,16)
  map(80,48,skyscrp_x+320,432,16,16)
	map(80,49,skyscrp_x+384,432,16,16)
  map(72,48,building_x,432,16,16)
  map(72,48,building_x+200,432,16,16)
  map(72,48,building_x+400,432,16,16)
  map(72,48,building_x+600,432,16,16)
  map(72,48,building_x+800,432,16,16)
 	map(0, 56, 0, 448, 128, 8)
 end
 spr(1, player.x * 8, player.y)
 print("deaths:"..deaths, player.x * 8 - 24, player.y - 64)
 --debug--print("x:"..player.x, player.x * 8 - 24, player.y - 54)
 --debug--print("y:"..player.y, player.x * 8 - 24, player.y - 44)
 print("level:"..level, player.x * 8 - 24, player.y - 58)
end
__gfx__
00000000777777771111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000700000071bbbbbb100000000000500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070070888807bbccccbb00011000000477000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000708bb807cc1771cc00111100000f77770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000708bb807cc1771cc00111100000f00770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070070888807bbccccbb01111110000f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000700000071bbbbbb101111110000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000777777771111111111111111000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000006006600600000800656565650000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000006006600600000500656565650000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000066666666000005006c6c6c6c0000000000000000
000000000000000000000070000007700000077000000700000007770000077000000777000007770000000066666666000005006c6c6c6c0000000000000000
00000000000000000000077000000007000000070000070700000700000007000000000700000707000000005555555500005500666666660000000000000000
00000000000000000000007000000070000000770000077700000070000007770000000700000777000000006cc66cc6000066006c6c6c6c0000000000000000
00000000000000000000007000000700000000070000000700000007000007070000000700000707000000006cc66cc6000055006c6c6c6c0000000000000000
00000000000000000000077700000777000007700000000700000770000007770000000700000777000000005555555500055500656565650000000000000000
00000000000000000000000011111111000000000000000000000000000000000000000000000000000000006666666600055500555555550000000000000000
00000000000000000000000001111110000000000000000000000000000000000000000000000000000000005555555500066600555555550000000000000000
00000000000000000000000001111110000000000000000000000000000000000000000000000000000000005555555500855500555555550000000000000000
00000000000000000000000000111100000000000000000000000000000000000000000000000000000000006cc66cc600555500555555550000000000000000
00000000000000000000000000111100000000000000000000000000000000000000000000000000000000006cc66cc600555500555555550000000000000000
00000000000000000000000000011000000000000000000000000000000000000000000000000000000000005555555505555500555555550000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000005555555505555555555555550000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000006666666655555555555555550000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000061000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000300000402000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
20202020202020202020202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000071000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000300000402000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
20202020202020202020202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000c10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000c20000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000d20000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000d2c200000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000081000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000b100b1b100000000000000d2d200000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000b200b2b20000d1d1000000d2d200000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000300000402000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000b200b2b20000d1d1000000d2d200000000000000000000000000000000000000000000000000000000000000000000000000000000000000
20202020202020202020202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000b200b2b20000d1d1000000d2d200000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000b2d2b2b2d2d2d1d1000000d2d200000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000091000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000300000402000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
20202020202020202020202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020000000000000000000000002300000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000230000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000001200000000000000000000000000020200000000000000000000000000000000020202000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000200230000000000000000000000000000000000232323000000000002000000000000000200000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000003000000020000000000000000000203000000030300000003030000000000000000000003030303030303030300000003000000000200000000000004000302000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000001300000000000000000000000000000002020000000000000000000000020000000000000202020000000000000200000000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000002000000000000000000000202000000000000000000002323230000000000002300000000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000002000000000023000303030300000002030303030303030303030300000000000000030300000000000303000000000004000302000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000030000002300000300000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000001400000000000000000000000000000000000000000000000200000000020200000000000200000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000002300000000000200000002000000000200000000020000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000300000003000000030000000300000200030303000000000000000000000000000003030303030303030303030303030303030303000000000400030200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000001500000000000000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000003000004020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
0001000000250052500f25013550155501755018550185501855018550165501455013010110201302014020177501675014750137501275011750117501175011750107500e7500775004750000000000000000
000200000000002050050200603010030105500a550095500d550102100d7200c7200b72009730000500005000000000000000000000000000000000000000000000000000000000000000000000000000000000
000100000000006150076500b1500c1500d150041500a150000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60040000000001a7501d7501a05021050280502b0502d750154501345013450191501a1501e15027150144501b1501d15020150261502915010050110501105011050130501505024250272502d2503425039250
