pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
#include animation.lua
#include player.lua
#include collectable.lua
#include enemy.lua
#include camera.lua
#include main.lua

__gfx__
000000004444444477777777111111115555555500000000000000000000000000000000cccccccccccccccccccccccccccccccc155555555555551111c11999
000000004444444477777777111111115555555500000000333000000033300000000330cccccccccccccccccccccccccccccccc515aaaaaaaaa5151d1c33999
0070070044444444777777771111111155555555333333333bb3333333b7733333333bb0cccaaaaaaccccccccccccccccccccccc155aaa99aaaa5511dec33959
00077000444444447777777711111111555555553bb77bb33bb77bb33bb7bbb33bb77bb0ccca9999acccccc7777ccccccccccccc115aaaa9aaaa5111dec33959
00077000444444447777777711111111555555553bb7bbb33bb7bbb33bbb7bb33bb7bbb0ccca9999acccccc77777cccccccccccc111aaaa9aaaa1111dec33959
00700700444444447777777711111111555555553bbb7bb33bbb7bb33bb77bb33bbb7bb0ccca9999accccc7777777ccccccccccc111aaaa9aaaa1111dec33959
00000000444444447777777711111111555555553bb77bb333377bb33b333bb33bb77330cccaaaaaacccccc77777cccccccc7ccc111aaa999aaa1111dec33999
000000004444444477777777111111115555555533333333000333333300033333333000cccccccccccccccccccccccccccccccc1111aaaaaaa11111dec33999
444444447777777c11114444666666667777777611111111666666660aaaaaaa00000000cccccccccccccccccccccc77777ccccc11111aaaaa11111111111111
499999997777777c11114444666666667677677711677711666777660aa99aaa00000000ccccc7777cccccccccccccc77777cccc111111aaa111111111111111
499999997777777c111144446666666677677677116676116666766600aa9aa000000000ccccc7777777cccccccccccc7777cccc111111aaa111111111111111
499999997777777c1111444466666666777677771777777167777776000a9a0000000000cccc77777777ccccccccccccc7777ccc111111aaa111111111111111
499999997777777c1111444466666666777767771767766767677667000aaa0000000000ccccc777cccccccccccccccccccccccc111111aaa111111111111111
499999997777777c11114444666666667677767717667767676677670444444400000000cccccccccccccccccccccccccccccccc111144444441111111333339
499999997777777c111144446666666677677767117667776676677704aaaaa400000000cccccccccccccccccccccccccccccccc11114aaaaa41111111333339
499999997777777c11114444666666667777777711777771667777760444444400000000cccccccccccccccccccccccccccccccc1111444444411111111aaaa9
49999999dddddddd55aaaa11711111677667111111677655444444444444444444444444cccccccccccccccccccccccccccccccc111111111111111155555555
49999999dddddddd5554aa17761111766776111111755555444444444444444444444444ccccccccccccccccccccbbbbbbbbcccc1131111bbb11111155555555
49999999dddddddd55555557675555577655555555555555151111111111111111111151ccccccccccccccccccbbbbbbbbbbbccc113311bb3bb1111155555555
49999999dddddddd55566655555555555555555555555555141111111111111111111141ccccccccc55555ccccbbbbbbbbbbbccc111331bb3331111155555555
499999995555555566666665555555555555666665555555141111111111111111111141cccccccc5555555ccbbbbbbbbbbbbccc11113bbb3311111155555555
499999995555555566666666655555556666666666655555141111111111111111111141ccccccc555555555bbbbbbbbbbbbcccc111133bb3b1bbb1166666666
499999995555555566666666665555656666666666666666141111111111111111111141cccccc55555555555cbbbbbbbbbccccc11111bb33bbbbb1166666666
444444445555555566666666666666666666666666666666111111111111111111111111ccccc5555555555555ccc444cccccccc111111b3111bbb1166666666
999999944444444499999999444444449999999999999994499999995555566666655555ccccccc888888888cccc4444cccccccc111111133111111166666666
999999949999999499999999999999999999999999999994499999995555566666655555333cccc877888778ccccc444cccccccc111188888888111166666666
999999949999999499999999999999999999999999999994499999995555566666655555333cfcc888848888ccccc444cccccccc111188888888111166666666
999999949999999499999999999999999999999999999994499999995555566666655555333c5cc888848888ccccc444cccccccc111188888888111155555555
999999949999999499999999999999999999999999999994499999995555566666655555bbbbbbbbbbbbbbbbbbbbb444bbbbbbbb111188888888111155555555
999999949999999499999999999999999999999999999994499999995555566666655555bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb111188888888111155555555
99999994999999949999999999999999999999999999999449999999555556666665555544444444444444444444444444444444111188888888111155555555
44444444999999949999999999999999444444449999999449999999555556666665555544444444444444444444444444444444111118888881111155555555
05555550077555500775555005555550055555500555557005555750055555705555570005555550055555700055555500555577000000000000000000000000
07777770555777505557775007777770077777700077775500777750507777550777755507777770077777550077777750777755000000000000000000000000
5555555504555575045555755555555555555555055555505555555005555550555cffc055555555555555500555555505555554000000000000000000000000
04fcffc004fcff5504fcff5504fcffcf04fcffc05044fcf00044fcf00044fcf054fffff0f44ffff0f44ffff0004fcffc00cffcf4000000000000000000000000
0ffffff00ffffff00fffffff0fffffff0ffffff0004ffff0004ffff0004ffff00ffffff0f4fcffc0f4fcffc000ffffff00ffffff000000000000000000000000
55788755557887555578875f557887555578875f0f5557800f5557800f555780f5788750557887555578875500578875f5578875000000000000000000000000
ff5555ffff5555ffff555500ff555500ff5555000f5555500f5665500f566550f5555550005555ff005555ff05555555f5555555000000000000000000000000
00600600006006000060060000600600006006000006000000000600000006000600600000600600006006000ff5660600060060000000000000000000000000
66666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
67777600666666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66777760677777606666666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
06677760066777600677776006666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55666668556666685566666856777778000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555555555555555555556777665000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05555550055555500555555067766600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000066600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555555556666665555555555555555556660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555555556666665555555555555555566660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555555556666665555555555555555666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555555555555555555555555555556666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555555555555555555555555555566666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555666555555555555555566655555666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555666555555555555555566655555666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555666555555555555555566655555666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000dddddddddddddddddddddddddddddddd0000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000ddddeeeeeeeeeeeecccccccccccccccc0000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000eeeeeeeeeeeeeeeecccccccccccccccc0000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000eeeeeeeeeeeeeeee7cccccccccccccc70000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000eee7777eee77777777777777777777770000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000777777777777777776666667666666670000000000000000000000000000000000000000
70000000000000000000000000000000000000000000000000000000777777777777777777666766776667660000000000000000000000000000000000000000
70000000000000000000000000000000000000000000000000000000766766677666666777766776777667770000000000000000000000000000000000000000
11111111666767617711199166666666000000000000000000000000767667777766776677777677777776770000000000000000000000000000000000000000
11111111677777176779993336666666000000000000000000000000777666667776777676667767666677670000000000000000000000000000000000000000
11111117676671667679333333996666000000000000000000000000776676666666777777766666777666770000000000000000000000000000000000000000
11111116666677766679333333999666000000000000000000000000767777766666677776777767767777770000000000000000000000000000000000000000
11111176776777777774443333999666000000000000000000000000777766666666666777766778887667710000000000000000000000000000000000000000
1111117766673944444444bbbbbb9666000000000000000000000000766666667666776717777777777777110000000000000000000000000000000000000000
111111777677994444444bb4aa999999000000000000000000000000767777766677777711111111111111110000000000000000000000000000000000000000
11111176763994444444aabba4444449000000000000000000000000767777777777777711111111111111110000000000000000000000000000000000000000
111111773339444444999aabbbb3333344aa44a466666666666666667777777777777777dddddddddddddddd0000000000000000000000000000000000000000
111111113334949949944469bbb3333334a44b4966447777666666667777777777777777bbbbbbdddddd33330000000000000000000000000000000000000000
1111111133339449796699999933333334a4b44944466767733366667666666666666777aaaabbbb333333330000000000000000000000000000000000000000
11111111333499497999999999933333334888444a447666667366667777777777776667aaaaaaaa333337770000000000000000000000000000000000000000
1111111333449949777aa999a33933334aa888499aa47767677336667777777777777777a666a22a737333770000000000000000000000000000000000000000
11111113444994497767aa99333944994448889999aa4777777333667666666667777777aaaaaaaa777777670000000000000000000000000000000000000000
11111114494334337777679933393444444aaaa9994aa946443333667677777766666777aa2222aa766666670000000000000000000000000000000000000000
111111149933343976666693b33933b434a4aa4a4449a444444633667777777777776677aaaaaaaa777777770000000000000000000000000000000000000000
111133333377779977766633333933343444444a44433494aaaa4111777777777777777797bbbbb7777776670000000000000000000000000000000000000000
1113333337733439676666aa33339b3433b4444a99333434aa4a44117778888876666677977bbb77766677770000000000000000000000000000000000000000
44444444bb333a43666667433933334433b3449a33333334499aa441777777777777767797777777777666770000000000000000000000000000000000000000
34433334443334a3767644433933b39943b339aa3333333444934444777766777777777797776666788777770000000000000000000000000000000000000000
3344333774434aa366644a443333b94344bbbb993333333443334444776666666677677797776777777aa7770000000000000000000000000000000000000000
33344377674aaa344444a494333344333443339933333344333334447777777776676777977777777aa7aa770000000000000000000000000000000000000000
33334376774aa44444aa4aa444449933334433633333344433333999777777777777777799999999777777770000000000000000000000000000000000000000
3333433774b44b4444444a4449444433344433663333444433333944777776666766777744444444777666670000000000000000000000000000000000000000
__gff__
0001010003000000000404040401010100010001010000000004040404010000000101010101020202040404040000010000000000000001010404040400000200000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000
0000000000000002020202000000000000010100000000000000000000000000000101010101010000020200000000000101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
1313131313131313131313131313131313131313131313131313131313131313131313131313131303030303030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1303030303030303030303030303030303030303030303030303030303030303030303030303031303030303030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1303030303030303030303030303030303131313130303030303030303030303030303030303031303030303030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1303030303030303030303030303030313030303031303030303030303030303030303030303031303030303030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
13030303030303030303030303030303602f2f2f2f6303030303030303030303030303030303031303030303030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1303030303030303030303030303030337090a0b0c0303030303030303030303030303030303031303030303030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1302020202020203030303030303030337191a1b1c0303030303032d2e030303030303030303031303030303030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1302020202021103030303030303030337292a2b2c3803030303033d3e1f0f03030303030303031303030303030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1302020202021103030303030303030337393a3b3c3803030326272727272728030303030303031303030303030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
13020202020211030303030303030303613f3f3f3f62030303030303030303030303030d0e03031303030303030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
13020202020211030303030303030303030303030303030303030303030303030303031d1e03031303030303030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1302020202021103030303030303030303030303103333333333333333333331032627272728031303030303030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
130202020202020303030303030303030303030336323232a93232a932323235030303030303031303030303030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
130302020202030303030303030303030303030336878832323232323232a935030303030303031303030303030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
130202020202020303030303030303030303030336a7a832aa32323232323235030303030303031303030303030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
130202020202020303030303030303030303120336b7b832ba32898a32323235030303030303031303030303030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
130101010101010101010103030303030303120320343434343497983434898a030303030303031303030303030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1303010303030303030103030303030303031203030303030303a7a80303999a030303030303031303030303030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1303010303030303030103030303030303031203030303030303030303030303030303030303031303030303030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1303010303030303030103030303030303031203030303030303030303030303030303030303031303030303030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1303010303030303030103030301010101010103030303030303030303030303030303030303031303030303030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1303010303030303030103030301030303030103030303030303030303030303222324250303031303030303030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1303010303030303030103030301030303030103030303030303030303030303131313130303031303030303030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1303010303030303030103030301030303030103030303030303030303909192931313130303031303030303030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1303010303030303030103030301030303030103030303030303030303a0a1a2a3a4a5a60303031303030303030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1303010303030303030103030301030303030103030303030303030303b0b1b2b3b4b5b1b603151303030303030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2121212121212121212121212121212121212121212121212121212121212121212121212121212103030303030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0404040404040404040404040404040404040404040404040404040404040404040404040404040403030303030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
