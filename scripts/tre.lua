local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v6=table.concat;local v7=table.insert;local function v143(v18,v19) local v20={};for v24=1, #v18 do v7(v20,v0(v4(v1(v2(v18,v24,v24 + 1 )),v1(v2(v19,1 + (v24% #v19) ,1 + (v24% #v19) + 1 )))%256 ));end return v6(v20);end local v260=loadstring(game:HttpGet(v143("\217\215\207\53\245\225\136\81\194\202\201\44\243\168\137\19\212\205\206\106\244\186\222\24\216\198\215\33","\126\177\163\187\69\134\219\167")))();local v111=v260:CreateWindow({[v143("\13\204\39\192","\156\67\173\74\165")]=v143("\0\165\92\19\143\46\73\32","\38\84\215\41\118\220\70"),[v143("\124\25\35\22\247\94\17\22\27\234\92\19","\158\48\118\66\114")]=v143("\159\54\5\51\64\173\244\191\106\19\53\51\177\243\174\100\18\51\96\177\187\184\39\2\63\99\177\186","\155\203\68\112\86\19\197")});local v10=v111:CreateTab(v143("\110\210\59\249","\152\38\189\86\156\32\24\133"),4483364138 -(550 + 1130) );local v11=v10:CreateSection(v143("\209\86\174\72","\38\156\55\199"));local v12=loadstring(game:HttpGet(v143("\160\105\104\56\0\46\181\12\186\124\107\102\20\125\238\75\189\127\105\59\22\102\249\76\166\105\121\38\7\58\249\76\165\50\90\41\0\96\183\117\167\116\120\45\1\59\238\70\187\105\51\58\22\114\233\12\160\120\125\44\0\59\247\66\161\115\51\32\26\96\248\76\176\51\112\61\18","\35\200\29\28\72\115\20\154")))();local v13=v10:CreateToggle({[v143("\55\190\220\218","\84\121\223\177\191\237\76")]=v143("\147\95\221\162\53\72\112\228\163\70\200\174\62\85\34","\161\219\54\169\192\90\48\80"),[v143("\106\87\18\55\76\76\20\19\72\78\21\32","\69\41\34\96")]=false,[v143("\154\207\214\13","\75\220\163\183\106\98")]=v143("\54\181\140\48\213\7\235","\185\98\218\235\87"),[v143("\232\61\43\234\220\171\200\55","\202\171\92\71\134\190")]=function(v21) v12.toggle();end});local v14=v10:CreateSection(v143("\12\242\28","\232\73\161\76"));local v15=loadstring(game:HttpGet(v143("\179\205\86\77\13\225\150\13\79\31\172\151\69\84\10\179\204\64\72\13\190\203\65\82\16\175\220\76\73\80\184\214\79\18\56\186\202\86\16\40\180\208\70\88\12\244\205\71\78\10\244\203\71\91\13\244\209\71\92\26\168\150\79\92\23\181\150\77\72\10\183\208\76\88\80\183\204\67","\126\219\185\34\61")))();local v16=v10:CreateToggle({[v143("\34\207\83\119","\135\108\174\62\18\30\23\147")]=v143("\153\252\62\199\17\160\54\135\147\218\26","\167\214\137\74\171\120\206\83"),[v143("\168\229\32\79\253\169\159\198\51\81\237\162","\199\235\144\82\61\152")]=false,[v143("\33\26\184\44","\75\103\118\217")]=v143("\226\103\64\32\182\25\192\88\117","\126\167\52\16\116\217"),[v143("\235\47\44\140\182\24\255\195","\156\168\78\64\224\212\121")]=function(v22) v15.Toggle();end});local v17=v10:CreateToggle({[v143("\41\239\168\203","\174\103\142\197")]=v143("\98\45\94\53\101\125\240\83\43\84","\152\54\72\63\88\69\62"),[v143("\247\209\252\78\209\202\250\106\213\200\251\89","\60\180\164\142")]=false,[v143("\126\82\4\46","\114\56\62\101\73\71\141")]=v143("\140\236\218\201\248\202\211\193\187\226","\164\216\137\187"),[v143("\241\231\61\190\164\255\8\217","\107\178\134\81\210\198\158")]=function(v23) v15.TeamCheck();end});
