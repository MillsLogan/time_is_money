pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
#include animation.lua
#include player.lua
#include world_object.lua
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
05555550077555500775555005555550055555500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07777770555777505557775007777770077777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555045555750455557555555555555555550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04fcffc004fcff5504fcff5504fcffcf04fcffc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0ffffff00ffffff00fffffff0fffffff0ffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55788755557887555578875f557887555578875f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ff5555ffff5555ffff555500ff555500ff5555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00600600006006000060060000600600006006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555700555557000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07777555077775550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555550555555500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
54fcffc054fcffc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0ffffff00ffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f5788750f57887500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f5555560f55555500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00600000000006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
