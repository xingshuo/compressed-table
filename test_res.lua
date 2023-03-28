local config = {
    ['battle_item'] = {
        [500001]={
            Arg={ 0, 0, 0 },
            BuyCostCnt=0,
            BuyCostId=0,
            CodeKey="BATTLE_COIN",
            HeapCount=1,
            Id=500001,
            MaxCount=999999,
            Name="FIBRE",
            Quality=1,
            SaleAward={  },
            ShowPriority=999,
            Subtype=0,
            Type=1 
          },
        [501001]={
            Arg={ 5001001, 1, 0 },
            BuyCostCnt=100,
            BuyCostId=500001,
            HeapCount=99,
            Id=501001,
            MaxCount=99,
            Name="BLOOD_BOTTLE_1",
            Quality=2,
            SaleAward={ [500001]=30 },
            ShowPriority=999,
            Subtype=1,
            Type=2 
          },
        [501002]={
            Arg={ 5001002, 1, 0 },
            BuyCostCnt=180,
            BuyCostId=500001,
            HeapCount=99,
            Id=501002,
            MaxCount=99,
            Name="BLOOD_BOTTLE_2",
            Quality=2,
            SaleAward={ [500001]=54 },
            ShowPriority=1000,
            Subtype=1,
            Type=2 
          },
        [501003]={
            Arg={ 5001003, 1, 0 },
            BuyCostCnt=250,
            BuyCostId=500001,
            HeapCount=99,
            Id=501003,
            MaxCount=99,
            Name="BLOOD_BOTTLE_3",
            Quality=3,
            SaleAward={ [500001]=75 },
            ShowPriority=1001,
            Subtype=1,
            Type=2 
          },
        [501004]={
            Arg={ 5001004, 2, 0 },
            BuyCostCnt=350,
            BuyCostId=500001,
            HeapCount=99,
            Id=501004,
            MaxCount=99,
            Name="BLOOD_BOTTLE_4",
            Quality=4,
            SaleAward={ [500001]=105 },
            ShowPriority=1002,
            Subtype=1,
            Type=2 
          },
        [501005]={
            Arg={ 0, 0, 0 },
            BuyCostCnt=1200,
            BuyCostId=500001,
            Name="SKILL_BOOK",
            HeapCount=99,
            Id=501005,
            MaxCount=99,
            Quality=5,
            SaleAward={ [500001]=1 },
            ShowPriority=1003,
            Subtype=6,
            Type=2
          },
    },

    ['break_cost'] = {
      {
        { BreakLv=1, Coin=20, Exp=100, Lv=1 },
        { BreakLv=1, Coin=23, Exp=120, Lv=2 },
        { BreakLv=1, Coin=26, Exp=140, Lv=3 },
        { BreakLv=1, Coin=29, Exp=160, Lv=4 },
        { BreakLv=1, Coin=32, Exp=180, Lv=5 },
        { BreakLv=1, Coin=36, Exp=201, Lv=6 },
        { BreakLv=1, Coin=40, Exp=222, Lv=7 },
        { BreakLv=1, Coin=44, Exp=243, Lv=8 },
        { BreakLv=1, Coin=48, Exp=264, Lv=9 },
        { BreakLv=1, Coin=52, Exp=285, Lv=10 },
        { BreakLv=1, Coin=57, Exp=307, Lv=11 },
        { BreakLv=1, Coin=62, Exp=329, Lv=12 },
        { BreakLv=1, Coin=67, Exp=351, Lv=13 },
        { BreakLv=1, Coin=72, Exp=373, Lv=14 },
        { BreakLv=1, Coin=77, Exp=395, Lv=15 },
        { BreakLv=1, Coin=83, Exp=418, Lv=16 },
        { BreakLv=1, Coin=89, Exp=441, Lv=17 },
        { BreakLv=1, Coin=95, Exp=464, Lv=18 },
        { BreakLv=1, Coin=101, Exp=487, Lv=19 },
        { BreakLv=1, Coin=107, Exp=511, Lv=20 },
        { BreakLv=1, Coin=114, Exp=536, Lv=21 },
        { BreakLv=1, Coin=121, Exp=561, Lv=22 },
      },
      {
        { BreakLv=2, Coin=25, Exp=150, Lv=1 },
        { BreakLv=2, Coin=29, Exp=175, Lv=2 },
        { BreakLv=2, Coin=33, Exp=200, Lv=3 },
        { BreakLv=2, Coin=37, Exp=225, Lv=4 },
        { BreakLv=2, Coin=41, Exp=250, Lv=5 },
        { BreakLv=2, Coin=46, Exp=276, Lv=6 },
        { BreakLv=2, Coin=51, Exp=302, Lv=7 },
        { BreakLv=2, Coin=56, Exp=328, Lv=8 },
        { BreakLv=2, Coin=61, Exp=354, Lv=9 },
        { BreakLv=2, Coin=66, Exp=380, Lv=10 },
        { BreakLv=2, Coin=72, Exp=407, Lv=11 },
        { BreakLv=2, Coin=78, Exp=434, Lv=12 },
        { BreakLv=2, Coin=84, Exp=461, Lv=13 },
        { BreakLv=2, Coin=90, Exp=488, Lv=14 },
        { BreakLv=2, Coin=96, Exp=515, Lv=15 },
        { BreakLv=2, Coin=103, Exp=543, Lv=16 },
        { BreakLv=2, Coin=110, Exp=571, Lv=17 },
        { BreakLv=2, Coin=117, Exp=599, Lv=18 },
        { BreakLv=2, Coin=124, Exp=627, Lv=19 },
        { BreakLv=2, Coin=131, Exp=655, Lv=20 },
        { BreakLv=2, Coin=139, Exp=684, Lv=21 },
        { BreakLv=2, Coin=147, Exp=713, Lv=22 },
        { BreakLv=2, Coin=155, Exp=742, Lv=23 },
        { BreakLv=2, Coin=163, Exp=771, Lv=24 },
        { BreakLv=2, Coin=171, Exp=800, Lv=25 },
        { BreakLv=2, Coin=180, Exp=831, Lv=26 },
        { BreakLv=2, Coin=189, Exp=862, Lv=27 },
        { BreakLv=2, Coin=198, Exp=893, Lv=28 },
        { BreakLv=2, Coin=207, Exp=924, Lv=29 },
        { BreakLv=2, Coin=216, Exp=955, Lv=30 },
        { BreakLv=2, Coin=226, Exp=988, Lv=31 },
        { BreakLv=2, Coin=236, Exp=1021, Lv=32 },
        { BreakLv=2, Coin=246, Exp=1054, Lv=33 },
        { BreakLv=2, Coin=256, Exp=1087, Lv=34 },
        { BreakLv=2, Coin=266, Exp=1120, Lv=35 },
        { BreakLv=2, Coin=277, Exp=1155, Lv=36 },
        { BreakLv=2, Coin=288, Exp=1190, Lv=37 },
        { BreakLv=2, Coin=299, Exp=1225, Lv=38 },
        { BreakLv=2, Coin=310, Exp=1260, Lv=39 },
        { BreakLv=2, Coin=321, Exp=1295, Lv=40 },
        { BreakLv=2, Coin=333, Exp=1332, Lv=41 },
        { BreakLv=2, Coin=345, Exp=1369, Lv=42 },
        { BreakLv=2, Coin=357, Exp=1406, Lv=43 },
        { BreakLv=2, Coin=369, Exp=1443, Lv=44 },
        { BreakLv=2, Coin=381, Exp=1480, Lv=45 },
        { BreakLv=2, Coin=394, Exp=1519, Lv=46 },
      },
      {
        { BreakLv=3, Coin=40, Exp=225, Lv=1 },
        { BreakLv=3, Coin=44, Exp=255, Lv=2 },
        { BreakLv=3, Coin=48, Exp=285, Lv=3 },
        { BreakLv=3, Coin=52, Exp=315, Lv=4 },
        { BreakLv=3, Coin=56, Exp=345, Lv=5 },
        { BreakLv=3, Coin=61, Exp=376, Lv=6 },
        { BreakLv=3, Coin=66, Exp=407, Lv=7 },
        { BreakLv=3, Coin=71, Exp=438, Lv=8 },
        { BreakLv=3, Coin=76, Exp=470, Lv=9 },
        { BreakLv=3, Coin=81, Exp=502, Lv=10 },
        { BreakLv=3, Coin=87, Exp=535, Lv=11 },
        { BreakLv=3, Coin=93, Exp=568, Lv=12 },
        { BreakLv=3, Coin=99, Exp=601, Lv=13 },
        { BreakLv=3, Coin=105, Exp=635, Lv=14 },
        { BreakLv=3, Coin=111, Exp=669, Lv=15 },
        { BreakLv=3, Coin=118, Exp=704, Lv=16 },
        { BreakLv=3, Coin=125, Exp=739, Lv=17 },
        { BreakLv=3, Coin=132, Exp=774, Lv=18 },
        { BreakLv=3, Coin=139, Exp=810, Lv=19 },
        { BreakLv=3, Coin=146, Exp=846, Lv=20 },
        { BreakLv=3, Coin=154, Exp=883, Lv=21 },
        { BreakLv=3, Coin=162, Exp=920, Lv=22 },
        { BreakLv=3, Coin=170, Exp=957, Lv=23 },
        { BreakLv=3, Coin=178, Exp=995, Lv=24 },
        { BreakLv=3, Coin=186, Exp=1033, Lv=25 },
        { BreakLv=3, Coin=195, Exp=1072, Lv=26 },
        { BreakLv=3, Coin=204, Exp=1111, Lv=27 },
        { BreakLv=3, Coin=213, Exp=1150, Lv=28 },
        { BreakLv=3, Coin=222, Exp=1190, Lv=29 },
        { BreakLv=3, Coin=231, Exp=1230, Lv=30 },
        { BreakLv=3, Coin=241, Exp=1272, Lv=31 },
        { BreakLv=3, Coin=251, Exp=1314, Lv=32 },
        { BreakLv=3, Coin=261, Exp=1356, Lv=33 },
        { BreakLv=3, Coin=271, Exp=1399, Lv=34 },
        { BreakLv=3, Coin=281, Exp=1442, Lv=35 },
        { BreakLv=3, Coin=292, Exp=1487, Lv=36 },
        { BreakLv=3, Coin=303, Exp=1532, Lv=37 },
        { BreakLv=3, Coin=314, Exp=1577, Lv=38 },
        { BreakLv=3, Coin=325, Exp=1623, Lv=39 },
        { BreakLv=3, Coin=336, Exp=1669, Lv=40 },
        { BreakLv=3, Coin=348, Exp=1717, Lv=41 },
        { BreakLv=3, Coin=360, Exp=1765, Lv=42 },
        { BreakLv=3, Coin=372, Exp=1813, Lv=43 },
        { BreakLv=3, Coin=384, Exp=1862, Lv=44 },
        { BreakLv=3, Coin=396, Exp=1911, Lv=45 },
        { BreakLv=3, Coin=409, Exp=1962, Lv=46 },
        { BreakLv=3, Coin=422, Exp=2013, Lv=47 },
        { BreakLv=3, Coin=435, Exp=2064, Lv=48 },
        { BreakLv=3, Coin=448, Exp=2116, Lv=49 },
        { BreakLv=3, Coin=461, Exp=2168, Lv=50 },
        { BreakLv=3, Coin=475, Exp=2223, Lv=51 },
      },
      {
        { BreakLv=4, Coin=45, Exp=301, Lv=1 },
        { BreakLv=4, Coin=50, Exp=335, Lv=2 },
        { BreakLv=4, Coin=55, Exp=372, Lv=3 },
        { BreakLv=4, Coin=60, Exp=405, Lv=4 },
        { BreakLv=4, Coin=65, Exp=440, Lv=5 },
        { BreakLv=4, Coin=71, Exp=476, Lv=6 },
        { BreakLv=4, Coin=77, Exp=513, Lv=7 },
        { BreakLv=4, Coin=83, Exp=550, Lv=8 },
        { BreakLv=4, Coin=89, Exp=589, Lv=9 },
        { BreakLv=4, Coin=95, Exp=624, Lv=10 },
        { BreakLv=4, Coin=102, Exp=662, Lv=11 },
        { BreakLv=4, Coin=109, Exp=701, Lv=12 },
        { BreakLv=4, Coin=116, Exp=740, Lv=13 },
        { BreakLv=4, Coin=123, Exp=779, Lv=14 },
        { BreakLv=4, Coin=130, Exp=818, Lv=15 },
        { BreakLv=4, Coin=138, Exp=858, Lv=16 },
        { BreakLv=4, Coin=146, Exp=899, Lv=17 },
        { BreakLv=4, Coin=154, Exp=940, Lv=18 },
        { BreakLv=4, Coin=162, Exp=981, Lv=19 },
        { BreakLv=4, Coin=170, Exp=1022, Lv=20 },
        { BreakLv=4, Coin=179, Exp=1064, Lv=21 },
        { BreakLv=4, Coin=188, Exp=1107, Lv=22 },
        { BreakLv=4, Coin=197, Exp=1150, Lv=23 },
        { BreakLv=4, Coin=206, Exp=1193, Lv=24 },
        { BreakLv=4, Coin=215, Exp=1237, Lv=25 },
        { BreakLv=4, Coin=225, Exp=1282, Lv=26 },
        { BreakLv=4, Coin=235, Exp=1328, Lv=27 },
        { BreakLv=4, Coin=245, Exp=1374, Lv=28 },
        { BreakLv=4, Coin=255, Exp=1420, Lv=29 },
        { BreakLv=4, Coin=265, Exp=1467, Lv=30 },
        { BreakLv=4, Coin=276, Exp=1515, Lv=31 },
        { BreakLv=4, Coin=287, Exp=1564, Lv=32 },
        { BreakLv=4, Coin=298, Exp=1613, Lv=33 },
        { BreakLv=4, Coin=309, Exp=1662, Lv=34 },
        { BreakLv=4, Coin=320, Exp=1712, Lv=35 },
        { BreakLv=4, Coin=332, Exp=1763, Lv=36 },
        { BreakLv=4, Coin=344, Exp=1815, Lv=37 },
        { BreakLv=4, Coin=356, Exp=1867, Lv=38 },
        { BreakLv=4, Coin=368, Exp=1919, Lv=39 },
        { BreakLv=4, Coin=380, Exp=1972, Lv=40 },
        { BreakLv=4, Coin=393, Exp=2026, Lv=41 },
        { BreakLv=4, Coin=406, Exp=2081, Lv=42 },
        { BreakLv=4, Coin=419, Exp=2136, Lv=43 },
        { BreakLv=4, Coin=432, Exp=2191, Lv=44 },
        { BreakLv=4, Coin=445, Exp=2248, Lv=45 },
        { BreakLv=4, Coin=459, Exp=2306, Lv=46 },
        { BreakLv=4, Coin=473, Exp=2365, Lv=47 },
        { BreakLv=4, Coin=487, Exp=2424, Lv=48 },
        { BreakLv=4, Coin=501, Exp=2483, Lv=49 },
        { BreakLv=4, Coin=515, Exp=2544, Lv=50 },
        { BreakLv=4, Coin=530, Exp=2606, Lv=51 },
        { BreakLv=4, Coin=545, Exp=2669, Lv=52 },
        { BreakLv=4, Coin=560, Exp=2732, Lv=53 },
        { BreakLv=4, Coin=575, Exp=2795, Lv=54 },
        { BreakLv=4, Coin=590, Exp=2860, Lv=55 },
        { BreakLv=4, Coin=606, Exp=2926, Lv=56 },
        { BreakLv=4, Coin=622, Exp=2993, Lv=57 },
        { BreakLv=4, Coin=638, Exp=3060, Lv=58 },
        { BreakLv=4, Coin=654, Exp=3127, Lv=59 },
      },
    }
}

return config