pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
#include animation.lua
#include player.lua
#include camera.lua
#include main.lua

__gfx__
00000000666666664444444444444444dddddddddddddddddddddddd000000000000000000000000000000000000000000000000000000000000000000000000
00000000666666660040000000000400d555555ddddddddddddddddd000000000000000000000000000000000000000000000000000000000000000000000000
00700700666666660040000000000400d577675ddddddddddddddddd000000000000000000000000000000000000000000000000000000000000000000000000
00077000555555550040000000000400d567765ddddddddddddddddd000000000000000000000000000000000000000000000000000000000000000000000000
00077000555555550040000000000400d576775ddddddddddddddddd000000000000000000000000000000000000000000000000000000000000000000000000
00700700555555550040000000000400d577675ddddddddddddddddd000000000000000000000000000000000000000000000000000000000000000000000000
00000000aaa5aaa50040000000000400d555555ddddddddddddddddd000000000000000000000000000000000000000000000000000000000000000000000000
00000000555555550040000000000400dddddddddddddddddddddddd000000000000000000000000000000000000000000000000000000000000000000000000
11111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
05555550077555500775555005555550055555500555557005555750055555705555570005555550055555700055555500000000000000000000000000000000
07777770555777505557775007777770077777700077775500777750507777550777755507777770077777550077777700000000000000000000000000000000
5555555504555575045555755555555555555555055555505555555005555550555cffc055555555555555500555555500000000000000000000000000000000
04fcffc004fcff5504fcff5504fcffcf04fcffc05044fcf00044fcf00044fcf054fffff0f44ffff0f44ffff0004fcffc00000000000000000000000000000000
0ffffff00ffffff00fffffff0fffffff0ffffff0004ffff0004ffff0004ffff00ffffff0f4fcffc0f4fcffc000ffffff00000000000000000000000000000000
55788755557887555578875f557887555578875f0f5557800f5557800f555780f578875055788755557887550057887500000000000000000000000000000000
ff5555ffff5555ffff555500ff555500ff5555000f5555500f5665500f566550f5555550005555ff005555ff0555555500000000000000000000000000000000
00600600006006000060060000600600006006000006000000000600000006000600600000600600006006000ff5660600000000000000000000000000000000
77555500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
45555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4fcffc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
578875f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
555555f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
06006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0001010000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
1000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1000000000000001010101010101011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1000000000000010000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1000000000000010000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1000000000000010000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1000000000020310000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1001010101010101010101010101011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
