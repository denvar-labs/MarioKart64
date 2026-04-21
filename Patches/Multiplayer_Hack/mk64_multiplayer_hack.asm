arch n64.cpu
endian msb
//output "", create

include "..\LIB\N64.inc"
include "..\LIB\functions.inc"
include "..\LIB\macros.inc"

origin 0x0
insert "..\LIB\Mario Kart 64 (U) [!].z64"

// change ROM name
origin  0x20
db  "MK64 NETPLAY"
fill 0x34 - origin(), 0x20

constant ModeSelection(0x800DC53C)
constant CourseSelection1(0x800DC5A0)
constant CupSelection(0x8018EE09)
constant CourseSelection2(0x8018EE0B)
constant Options(0x80500000)

// Init
origin 0x0029F0
base 0x80001DF0
nop

origin 0x001E6C
base 0x8000126C
jal ResourceDisplay1
nop

origin 0x004704
base ResourceDisplay1
scope Init: {
  addiu sp, -0x18
  sw ra, 0x14 (sp)
  jal 0x800010CC
  nop
  DMA:
    la a0, 0x80400000
    li a1, 0x0BE9170
    li a2, 0x16E90
    jal DmaCopy
    nop
  Menu:
    la t0, Options
    addiu t1, t0, 0x10
    li t2, 0x01010101
    Loop:
      sw t2, 0 (t0)
      addiu t0, 0x04
      bne t0, t1, Loop
      nop
    Default:
      la t0, Options
      ori t1, r0, 0x02
      sb t1, 2 (t0)
      sb t1, 5 (t0)
      sb t1, 6 (t0)
      sb t1, 10 (t0)
      sb t1, 14 (t0)
      sb t1, 15 (t0)
  lw ra, 0x14 (sp)
  jr ra
  addiu sp, 0x18
}

// Menu Strings - solo KA y VA
MenuStrings:
dd 0x00000002 // Character Stats
dd MenuEntry1
dd MenuEntry1Setting1, MenuEntry1Setting2, 0x00000000

dd 0x00000003 // Scaling
dd MenuEntry2
dd MenuEntry2Setting1, MenuEntry2Setting2, MenuEntry2Setting3, 0x00000000

dd 0x00000002 // Tracks (KA Rules, VA Rules)
dd MenuEntry3
dd MenuEntry3Setting1, MenuEntry3Setting2, 0x00000000

dd 0x00000002 // Widescreen
dd MenuEntry4
dd MenuEntry4Setting1, MenuEntry4Setting2, 0x00000000

dd 0x00000002 // Trophies
dd MenuEntry5
dd MenuEntry5Setting1, MenuEntry5Setting2, 0x00000000

dd 0x00000002 // Multiplayer Music
dd MenuEntry6
dd MenuEntry6Setting1, MenuEntry6Setting2, 0x00000000

dd 0x00000002 // Multiplayer KD Train
dd MenuEntry7
dd MenuEntry7Setting1, MenuEntry7Setting2, 0x00000000

dd 0x00000002 // Multiplayer DKJP Boat
dd MenuEntry8
dd MenuEntry8Setting1, MenuEntry8Setting2, 0x00000000

dd 0x00000002 // Versus Bomb Karts
dd MenuEntry9
dd MenuEntry9Setting1, MenuEntry9Setting2, 0x00000000

dd 0x00000002 // Versus Tracks
dd MenuEntry10
dd MenuEntry10Setting1, MenuEntry10Setting2, 0x00000000

dd 0x00000002 // Versus Timer
dd MenuEntry11
dd MenuEntry11Setting1, MenuEntry11Setting2, 0x00000000

dd 0x00000003 // Gold Mushroom
dd MenuEntry12
dd MenuEntry12Setting1, MenuEntry12Setting2, MenuEntry12Setting3, 0x00000000

dd 0x00000009 // Items
dd MenuEntry13
dd MenuEntry13Setting1, MenuEntry13Setting2, MenuEntry13Setting3, MenuEntry13Setting4
dd MenuEntry13Setting5, MenuEntry13Setting6, MenuEntry13Setting7, MenuEntry13Setting8
dd MenuEntry13Setting9, 0x00000000

dd 0x00000002 // Versus Scores
dd MenuEntry14
dd MenuEntry14Setting1, MenuEntry14Setting2, 0x00000000

dd 0x00000002 // Polling Rate Fix
dd MenuEntry15
dd MenuEntry15Setting1, MenuEntry15Setting2, 0x00000000

dd 0x00000000, 0x00000000

MenuEntry1:
Asciiz("stats")
MenuEntry1Setting1:
Asciiz("default")
MenuEntry1Setting2:
Asciiz("all yoshi")

MenuEntry2:
Asciiz("scaling")
MenuEntry2Setting1:
Asciiz("default")
MenuEntry2Setting2:
Asciiz("30 fps")
MenuEntry2Setting3:
Asciiz("60 fps")

MenuEntry3:
Asciiz("tracks")
MenuEntry3Setting1:
Asciiz("KA Rules")
MenuEntry3Setting2:
Asciiz("VA Rules")

MenuEntry4:
Asciiz("widescreen")
MenuEntry4Setting1:
Asciiz("default")
MenuEntry4Setting2:
Asciiz("enabled")

MenuEntry5:
Asciiz("trophies")
MenuEntry5Setting1:
Asciiz("default")
MenuEntry5Setting2:
Asciiz("skip")

MenuEntry6:
Asciiz("mp music")
MenuEntry6Setting1:
Asciiz("default")
MenuEntry6Setting2:
Asciiz("enabled")

MenuEntry7:
Asciiz("mp train")
MenuEntry7Setting1:
Asciiz("default")
MenuEntry7Setting2:
Asciiz("full")

MenuEntry8:
Asciiz("mp boat")
MenuEntry8Setting1:
Asciiz("default")
MenuEntry8Setting2:
Asciiz("enabled")

MenuEntry9:
Asciiz("vs bombs")
MenuEntry9Setting1:
Asciiz("default")
MenuEntry9Setting2:
Asciiz("disabled")

MenuEntry10:
Asciiz("vs tracks")
MenuEntry10Setting1:
Asciiz("default")
MenuEntry10Setting2:
Asciiz("all cups")

MenuEntry11:
Asciiz("vs timer")
MenuEntry11Setting1:
Asciiz("default")
MenuEntry11Setting2:
Asciiz("enabled")

MenuEntry12:
Asciiz("gold shroom")
MenuEntry12Setting1:
Asciiz("default")
MenuEntry12Setting2:
Asciiz("feather small")
MenuEntry12Setting3:
Asciiz("feather big")

MenuEntry13:
Asciiz("items")
MenuEntry13Setting1:
Asciiz("default")
MenuEntry13Setting2:
Asciiz("player 1")
MenuEntry13Setting3:
Asciiz("player 2")
MenuEntry13Setting4:
Asciiz("player 3")
MenuEntry13Setting5:
Asciiz("player 4")
MenuEntry13Setting6:
Asciiz("player 5")
MenuEntry13Setting7:
Asciiz("player 6")
MenuEntry13Setting8:
Asciiz("player 7")
MenuEntry13Setting9:
Asciiz("player 8")

MenuEntry14:
Asciiz("vs scores")
MenuEntry14Setting1:
Asciiz("default")
MenuEntry14Setting2:
Asciiz("enabled")

MenuEntry15:
Asciiz("polling")
MenuEntry15Setting1:
Asciiz("default")
MenuEntry15Setting2:
Asciiz("30hz")

TitleString:
Asciiz("abitalive  weatherton  abney  sully")

NetplayString:
Asciiz(" fray's emulator/netplay by Denvar ")

Align(4)
fill 0x800040C0 - pc()

// Menu
origin 0x0957D0
base 0x80094BD0
jal 0x80400000
nop

origin 0x0BE9170
base 0x80400000
addiu sp, -0x30
sw ra, 0x14 (sp)
jal 0x800A8230
nop
jal LoadDebugFont
nop
Title:
  ori a0, r0, 0x00
  ori a1, r0, -0x08
  la a2, TitleString
  jal DebugPrintStringCoord
  nop
  ori a0, r0, 0x00
  ori a1, r0, 0x08
  la a2, NetplayString
  jal DebugPrintStringCoord
  nop

la t0, MenuStrings
addiu t1, r0, 0x01
addiu a1, r0, 0x38
MenuArrayLoop:
  lw t2, 0x04 (t0)
  beq t2, r0, MenuInput
  nop
  lui t3, 0x8050
  addu t3, t3, t1
  lb t3, 0 (t3)
  sll t3, 0x02
  addiu t3, 0x04
  addu t3, t0, t3
  lw t3, 0 (t3)
  sw t0, 0x18 (sp)
  sw t1, 0x1C (sp)
  sw a1, 0x20 (sp)
  sw t2, 0x24 (sp)
  sw t3, 0x28 (sp)
  PrintCursor:
    lui t4, 0x8050
    lb t4, 0 (t4)
    bne t1, t4, PrintEntry
    nop
    addiu a0, r0, 0x46
    la a2, 0x800F0B64
    jal DebugPrintStringCoord
    nop
    lw a1, 0x20 (sp)
    lw t2, 0x24 (sp)
  PrintEntry:
    addiu a0, r0, 0x50
    addu a2, t2, r0
    jal DebugPrintStringCoord
    nop
  PrintSetting:
    addiu a0, r0, 0xB0
    lw a1, 0x20 (sp)
    lw a2, 0x28 (sp)
    jal DebugPrintStringCoord
    nop
  lw t0, 0x18 (sp)
  MenuEntryLoop:
    lw t2, 0 (t0)
    addiu t0, 0x04
    beq t2, r0, MenuEntryLoopEnd
    nop
    b MenuEntryLoop
    nop
  MenuEntryLoopEnd:
  lw t1, 0x1C (sp)
  addiu t1, 0x01
  lw a1, 0x20 (sp)
  addiu a1, 0x0A
  b MenuArrayLoop
  nop
MenuInput:
  lui t0, 0x8050
  la t1, 0x800F6910
  MenuInputLoop:
    lh t2, 0x06 (t1)
    lb t3, 0 (t0)
    MenuInputUp:
      addiu t4, r0, 0x0800
      bne t2, t4, MenuInputDown
      nop
      addiu t3, -0x01
      beq t3, r0, MenuInputLoopEnd
      nop
      sb t3, 0 (t0)
    MenuInputDown:
      addiu t4, r0, 0x0400
      bne t2, t4, MenuInputLeft
      nop
      la t4, MenuStrings
      addu t5, r0, r0
      MenuInputDownLoop:
        lw t6, 0 (t4)
        beq t6, r0, MenuInputDownLoopEnd
        nop
        addiu t5, 0x01
        MenuInputDownLoopLoop:
          lw t8, 0 (t4)
          addiu t4, 0x04
          beq t8, r0, MenuInputDownLoopLoopEnd
          nop
          b MenuInputDownLoopLoop
          nop
        MenuInputDownLoopLoopEnd:
        b MenuInputDownLoop
        nop
      MenuInputDownLoopEnd:
      beq t3, t5, MenuInputLoopEnd
      nop
      addiu t3, 0x01
      sb t3, 0 (t0)
    MenuInputLeft:
      addiu t4, r0, 0x0200
      bne t2, t4, MenuInputRight
      nop
      addu t4, t0, t3
      lb t5, 0 (t4)
      addiu t5, -0x01
      beq t5, r0, MenuInputLoopEnd
      nop
      sb t5, 0 (t4)
    MenuInputRight:
      addiu t4, r0, 0x0100
      bne t2, t4, MenuInputLoopEnd
      nop
      addu t4, t0, t3
      lb t5, 0 (t4)
      addiu t6, r0, 0x01
      la t7, MenuStrings
      MenuInputRightLoop:
        beq t3, t6, MenuInputRightLoopEnd
        nop
        addiu t6, 0x01
        MenuInputRightLoopLoop:
          lw t8, 0 (t7)
          addiu t7, 0x04
          beq t8, r0, MenuInputRightLoopLoopEnd
          nop
          b MenuInputRightLoopLoop
          nop
        MenuInputRightLoopLoopEnd:
        b MenuInputRightLoop
        nop
      MenuInputRightLoopEnd:
      lw t7, 0 (t7)
      beq t7, t5, MenuInputLoopEnd
      nop
      addiu t5, 0x01
      sb t5, 0 (t4)
    MenuInputLoopEnd:
  la t4, 0x800F6940
  beq t1, t4, MenuEnd
  nop
  addiu t1, 0x10
  b MenuInputLoop
  nop
MenuEnd:
  lw ra, 0x14 (sp)
  jr ra
  addiu sp, 0x30

// Same Character
scope SameCharacter: {
  sb s0, 0 (t9)
  beq v0, r0, End
  nop
  li a0, 0x49008000
  jal PlaySound2
  nop
End:
  j 0x800B3A50
  nop
}

// Character Stats
scope CharacterStats: {
  addiu sp, -0x18
  sw ra, 0x14 (sp)
  jal 0x800010CC
  nop
  LuiLb(t0, Options+1)
  Disabled:
    OriBne(t0, 0x01, t1, Yoshi)
    la a0, 0x800E2360
    li a1, 0x0E2F60
    li a2, 0x14B0
    jal DmaCopy
    nop
    b End
    nop
  Yoshi:
    OriBne(t0, 0x02, t1, End)
    li a0, YoshiMain
    la a1, 0x800E2360
    li a2, 0x14B0
    jal BCopy
    nop
    li a0, YoshiWeight
    la a1, 0x802B8790
    li a2, 0x20
    jal BCopy
    nop
End:
  lw ra, 0x14 (sp)
  jr ra
  addiu sp, 0x18
}

// Scaling Fix
scope ScalingFix1p: {
  LuiLb(t5, Options+2)
  Disabled:
    OriBne(t5, 0x01, at, Fps30)
    LuiLw(t7, 0x80150114)
    b End
    nop
  Fps30:
    OriBne(t5, 0x02, at, Fps60)
    ori t7, r0, 0x02
    b End
    nop
  Fps60:
    OriBne(t5, 0x03, at, End)
    ori t7, r0, 0x01
End:
  jr ra
  nop
}
scope ScalingFix2p: {
  LuiLb(t8, Options+2)
  Disabled:
    OriBne(t8, 0x01, at, Fps30)
    LuiLw(t1, 0x80150114)
    b End
    nop
  Fps30:
    OriBne(t8, 0x02, at, Fps60)
    ori t1, r0, 0x02
    b End
    nop
  Fps60:
    OriBne(t8, 0x03, at, End)
    ori t1, r0, 0x01
End:
  jr ra
  nop
}
scope ScalingFix3p: {
  LuiLb(t9, Options+2)
  Disabled:
    OriBne(t9, 0x01, at, Fps30)
    LuiLw(t2, 0x80150114)
    b End
    nop
  Fps30:
    OriBne(t9, 0x02, at, Fps60)
    ori t2, r0, 0x02
    b End
    nop
  Fps60:
    OriBne(t9, 0x03, at, End)
    ori t2, r0, 0x01
End:
  jr ra
  nop
}
scope ScalingFixPost: {
  LuiLb(t7, Options+2)
  Disabled:
    OriBne(t7, 0x01, at, Fps30)
    LuiLw(t9, 0x80150114)
    b End
    nop
  Fps30:
    OriBne(t7, 0x02, at, Fps60)
    ori t9, r0, 0x02
    b End
    nop
  Fps60:
    OriBne(t7, 0x03, at, End)
    ori t9, r0, 0x01
End:
  jr ra
  nop
}
scope Scaling60FpsFix1: {
  addiu sp, -0x18
  sw ra, 0x14 (sp)
  LuiLb(t6, Options+2)
  Disabled:
    OriBne(t6, 0x01, at, Fps30)
    addiu a2, r0, 0x0001
    b End
    nop
  Fps30:
    OriBne(t6, 0x02, at, Fps60)
    addiu a2, r0, 0x0001
    b End
    nop
  Fps60:
    OriBne(t6, 0x03, at, End)
    or a2, r0, r0
End:
  jal 0x800CD750
  nop
  lw ra, 0x14 (sp)
  jr ra
  addiu sp, 0x18
}
scope Scaling60FpsFix2: {
  LuiLb(t3, Options+2)
  Disabled:
    OriBne(t3, 0x01, t1, Fps30)
    addiu t1, r0, 0x0002
    b End
    nop
  Fps30:
    OriBne(t3, 0x02, t1, Fps60)
    addiu t1, r0, 0x0002
    b End
    nop
  Fps60:
    OriBne(t3, 0x03, t1, End)
    addiu t1, r0, 0x0001
End:
  jr ra
  nop
}
scope PollingFix: {
  LuiLb(t0, Options+15)
  Disabled:
    OriBne(t0, 0x01, at, Enabled)
    b End
    nop
  Enabled:
    OriBne(t0, 0x02, at, End)
    LuiLb(t0, Options+2)
    FpsDisabled:
        OriBne(t0, 0x01, at, Fps30)
        b End
        nop
    Fps30:
        OriBne(t0, 0x02, at, Fps60)
        b End
        nop
    Fps60:
        OriBne(t0, 0x03, at, End)
        li t0, Flag
        lbu at, 0x0003(t0)
        xori at, at, 0x0001
        bnez at, End
        sb at, 0x0003(t0)
        j 0x80000A50
        nop
End:
  jal 0x800CD4F0
  nop
  j 0x80000A3C
  nop
Flag:
  fill 0x4
}

// Tabla VA Rules con IDs INTERNOS CORRECTOS (orden personalizado)
VATable:
db 0x00, 0x08  // LR
db 0x00, 0x09  // MMF
db 0x00, 0x06  // KTB
db 0x00, 0x0B  // KD
db 0x00, 0x12  // DKJP
db 0x00, 0x04  // YV
db 0x00, 0x03  // BB
db 0x00, 0x0D  // RRD
db 0x00, 0x0E  // WS
db 0x00, 0x0C  // SL
db 0x00, 0x07  // RRY
db 0x00, 0x02  // BC
db 0x00, 0x0A  // TT
db 0x00, 0x05  // FS
db 0x00, 0x01  // CM
db 0x00, 0x00  // MR

VA_ContinueText:
    AsciizAlign("CONTINUE TO MMF", 0x14)
    AsciizAlign("CONTINUE TO KTB", 0x14)
    AsciizAlign("CONTINUE TO KD", 0x14)
    AsciizAlign("CONTINUE TO DKJP", 0x14)
    AsciizAlign("CONTINUE TO YV", 0x14)
    AsciizAlign("CONTINUE TO BB", 0x14)
    AsciizAlign("CONTINUE TO RRD", 0x14)
    AsciizAlign("CONTINUE TO WS", 0x14)
    AsciizAlign("CONTINUE TO SL", 0x14)
    AsciizAlign("CONTINUE TO RRY", 0x14)
    AsciizAlign("CONTINUE TO BC", 0x14)
    AsciizAlign("CONTINUE TO TT", 0x14)
    AsciizAlign("CONTINUE TO FS", 0x14)
    AsciizAlign("CONTINUE TO CM", 0x14)
    AsciizAlign("CONTINUE TO MR", 0x14)
    AsciizAlign("CONTINUE TO LR", 0x14)

// Random Tracks (CORREGIDA: omite KA y VA)
scope RandomTracks: {
  LuiLb(t0, Options+3)
  OriBeq(t0, 0x01, t1, End)
  OriBeq(t0, 0x02, t1, End)
  LuiLw(t0, ModeSelection)
  Versus:
    OriBne(t0, 0x02, t1, Battle)
    jal RandomInt
    ori a0, r0, 0x10
    OriBne(v0, 0x0F, t1, Store)
    ori v0, r0, 0x12
    b Store
    nop
  Battle:
    OriBne(t0, 0x03, t1, End)
    jal RandomInt
    ori a0, r0, 0x04
    addiu v0, 0x10
    OriBne(v0, 0x12, t1, Store)
    ori v0, r0, 0x0F
  Store:
    LuiSh(v0, CourseSelection1, t0)
End:
  lw ra, 0x14 (sp)
  jr ra
  addiu sp, 0x28
}

// Widescreen
scope Widescreen: {
  LuiLb(t0, Options+4)
  Disabled:
    OriBne(t0, 0x01, t1, Enabled)
    LuiLw(a3, 0x80150148)
    b End
    nop
  Enabled:
    OriBne(t0, 0x02, t1, End)
    Fullscreen:
      LuiLw(t0, 0x80150148)
      LiBne(t0, 0x3FAAAAAB, t1, Widescreen)
      li a3, 0x3FDFAAAB
      b End
      nop
    Widescreen:
      LuiLw(t0, 0x80150148)
      LiBne(t0, 0x402AAAAB, t1, Current)
      li a3, 0x4060AAAB
      b End
      nop
    Current:
      LuiLw(a3, 0x80150148)
End:
  jr ra
  nop
}

// Skip Trophy Ceremony
scope SkipTrophy: {
  LuiLb(t0, Options+5)
  Disabled:
    OriBne(t0, 0x01, t1, Enabled)
    addiu t7, r0, 0x05
    b End
    nop
  Enabled:
    OriBne(t0, 0x02, t1, End)
    ori t7, r0, 0x01
End:
  j 0x8028E3DC
  nop
}

// Multiplayer Music
scope MultiplayerMusic: {
  LuiLb(t0, Options+6)
  Disabled:
    OriBne(t0, 0x01, t1, Enabled)
    LuiLw(t6, 0x800DC530)
    b End
    nop
  Enabled:
    OriBne(t0, 0x02, t1, End)
    ori t6, r0, 0x01
End:
  j 0x8028ECA0
  nop
}
scope MultiplayerMusicL: {
  LuiLb(t0, Options+6)
  Disabled:
    OriBne(t0, 0x01, at, Enabled)
    LuiLw(t1, 0x800DC52C)
    b End
    nop
  Enabled:
    OriBne(t0, 0x02, at, End)
    ori t1, r0, 0x01
End:
  jr ra
  nop
}

// Multiplayer KD Train
scope MultiplayerTrain: {
  LuiLb(t5, Options+7)
  Disabled:
    OriBne(t5, 0x01, a2, Enabled)
    LuiLw(v0, 0x800DC530)
    b End
    nop
  Enabled:
    OriBne(t5, 0x02, a2, End)
    ori v0, r0, r0
End:
  jr ra
  nop
}

// Multiplayer DKJP Boat
scope MultiplayerBoat: {
  LuiLb(at, Options+8)
  Disabled:
    OriBne(at, 0x01, a0, Enabled)
    lb t7, 0 (t2)
    b End
    nop
  Enabled:
    OriBne(at, 0x02, a0, End)
    ori t7, r0, 0x01
End:
  j 0x80013354
  nop
}

// Versus Bomb Karts
scope VersusBomb: {
  LuiLb(t5, Options+9)
  Enabled:
    OriBne(t5, 0x01, t6, Disabled)
    addiu at, r0, 0x0002
    b End
    nop
  Disabled:
    OriBne(t5, 0x02, t6, End)
    addiu at, r0, 0x0005
End:
  jr ra
  nop
}

// Versus All Cups (LÓGICA ORIGINAL)
scope VersusAllCups: {
  addiu sp, -0x18
  sw ra, 0x14 (sp)
  jal 0x80290388
  nop
  LuiLb(t0, Options+10)
  OriBeq(t0, 0x01, t1, End)
  LuiLw(t0, ModeSelection)
  OriBne(t0, 0x02, t1, End)

  RainbowRoad:
    LuiLh(t0, CourseSelection1)
    OriBne(t0, 0x0D, t1, IncrementCup)
    LuiSb(r0, CupSelection, t1)
    LuiSb(r0, CourseSelection2, t1)
    b End
    nop
  IncrementCup:
    LuiLb(t0, CourseSelection2)
    OriBne(t0, 0x03, t1, IncrementCourse)
    LuiLb(t0, CupSelection)
    addiu t0, 0x01
    LuiSb(t0, CupSelection, t1)
    LuiSb(r0, CourseSelection2, t1)
    b End
    nop
  IncrementCourse:
    LuiLb(t0, CourseSelection2)
    addiu t0, 0x01
    LuiSb(t0, CourseSelection2, t1)

End:
  lw ra, 0x14 (sp)
  jr ra
  addiu sp, 0x18
}

// Versus Timer
scope VersusTimer: {
  LuiLb(t0, Options+11)
  Disabled:
    OriBne(t0, 0x01, t1, Enabled)
    LuiLw(v0, ModeSelection)
    b End
    nop
  Enabled:
    OriBne(t0, 0x02, t1, End)
    LuiLw(t0, ModeSelection)
    OriBne(t0, 0x02, t1, Current)
    Versus:
      ori v0, r0, r0
      b End
      nop
    Current:
      LuiLw(v0, ModeSelection)
End:
  j 0x8004FA84
  nop
}

// Gold Mushroom
scope GoldMushroom: {
  LuiLb(t0, Options+12)
  Disabled:
    OriBne(t0, 0x01, t1, FeatherSmall)
    ori t8, t7, 0x0200
    b End
    nop
  FeatherSmall:
    OriBne(t0, 0x02, t1, FeatherBig)
    ori t8, t7, 0x1000
    b End
    nop
  FeatherBig:
    OriBne(t0, 0x03, t1, End)
    lui t0, 0x02
    or t8, t0
End:
  j 0x802B30D4
  sw t8, 0x000C (a0)
}

// Player Items
scope PlayerItems: {
  addiu sp, -0x18
  sw ra, 0x14 (sp)
  LuiLb(t0, Options+13)
  OriBeq(t0, 0x01, t1, End)
  Enabled:
    SltiBeq(t0, 0x0A, t1, End)
    addiu a0, t0, -0x02
End:
  jal 0x8007ADA8
  nop
  lw ra, 0x14 (sp)
  jr ra
  addiu sp, 0x18
}

// Lap Fix
scope LapFix: {
  addiu sp, -0x18
  sw ra, 0x14 (sp)
  Lap3:
    OriBne(t3, 0x03, t0, DecrementLap)
    b End
    nop
  DecrementLap:
    addiu t4, t3, -0x01
    sw t4, 0 (v0)
End:
  jal 0x80008F38
  nop
  lw ra, 0x14 (sp)
  jr ra
  addiu sp, 0x18
}

// Versus Scores
scope VersusScores: {
  addiu sp, -0x28
  sw ra, 0x1C (sp)
  sw a0, 0 (sp)
  sw a1, 0x04 (sp)
  sw a2, 0x08 (sp)
  jal 0x800A6E94
  nop
  LuiLb(t0, Options+14)
  OriBeq(t0, 0x01, t1, End)
  Enabled:
    ori a0, r0, 0x03
    jal SetTextColor
    nop
    lw t0, 0 (sp)
    lw t1, 0x04 (sp)
    lw t2, 0x08 (sp)
    sll t3, t1, 0x1
    addu t3, t1
    addu t2, t2, t3
    addiu a1, sp, 0x20
    ori a2, r0, 0x08
    Score3p:
      OriBne(t0, 0x03, t3, Score4p)
      lbu t3, 0 (t2)
      sll t4, t3, 0x1
      lbu t3, 0x01 (t2)
      addu a0, t4, t3
      jal IntToAscii
      nop
      lw t0, 0x04 (sp)
      ori t1, r0, 0x4E
      multu t0, t1
      mflo t1
      ori a0, r0, 0x34
      addu a0, a0, t1
      b ScorePrint
      nop
    Score4p:
      OriBne(t0, 0x04, t3, End)
      lbu t3, 0 (t2)
      sll t4, t3, 0x1
      addu t5, t4, t3
      lbu t3, 0x01 (t2)
      sll t4, t3, 0x1
      addu t5, t4
      lbu t3, 0x02 (t2)
      addu a0, t5, t3
      jal IntToAscii
      nop
      lw t0, 0x04 (sp)
      ori t1, r0, 0x45
      multu t0, t1
      mflo t1
      ori a0, r0, 0x1A
      addu a0, a0, t1
    ScorePrint:
      ori a1, r0, 0x20
      or a2, r0, v0
      or a3, r0, r0
      li t0, 0x3F4CCCCD
      sw t0, 0x10 (sp)
      sw t0, 0x14 (sp)
      jal PrintText2Cord
      nop
End:
  lw ra, 0x1C (sp)
  jr ra
  addiu sp, 0x28
}

// IntToAscii
scope IntToAscii: {
  addiu a3, r0, 0xa
  addiu t8, a1, -0x01
  addu  t6, a1, a2
  addiu t6, -0x02
  sb    r0, 0x01 (t6)
  Loop:
    divu  a0, a3
    mfhi  t7
    mflo  a0
    addiu t7, t7, 0x30
    beq   a0, r0, End
    sb    t7, 0 (t6)
    addiu t6, t6, -0x01
    bne   t6, t8, Loop
    nop
End:
  jr ra
  addu v0, t6, r0
}

// Versus All Cups Menu (CORREGIDA: VA Rules sin incremento)
scope VersusAllCupsMenu: {
  LuiLb(t0, Options+10)
  OriBne(t0, 0x02, t1, Disabled)
  LuiLw(t0, ModeSelection)
  OriBne(t0, 0x02, t1, Disabled)

  LuiLb(t0, Options+3)
  OriBeq(t0, 0x02, t1, VAMenu)

  // KA Rules: lógica original (basada en Cup/Course2)
  LuiLb(t0, CupSelection)
  sll t0, t0, 0x02
  LuiLb(t1, CourseSelection2)
  addu t1, t0
  ori t2, r0, 0x14
  multu t1, t2
  mflo t1
  la t0, KA_ContinueText
  b SetText
  nop

VAMenu:
  // VA Rules: buscar pista actual en VATable y usar el índice directamente
  LuiLh(t0, CourseSelection1)
  la t1, VATable
  li t2, 0
  li t3, 16
SearchVA:
  lh t4, 0 (t1)
  beq t0, t4, FoundVA
  nop
  addiu t1, 2
  addiu t2, 1
  bne t2, t3, SearchVA
  nop
  li t2, 0        // no encontrado -> índice 0
FoundVA:
  // t2 = índice de la pista actual en VATable
  ori t3, r0, 0x14
  multu t2, t3
  mflo t1
  la t0, VA_ContinueText

SetText:
  addu t0, t0, t1
  la t1, Strings
  sw t0, 4 (t1)
  la s2, Strings
  b End
  nop

Disabled:
  addiu s2, 0x775C
End:
  jr ra
  nop

Strings:
  dd 0x00000000
  dd 0x00000000
  dd Option2
  dd Option3
  dd Option4
KA_ContinueText:
  AsciizAlign("CONTINUE TO MMF", 0x14)
  AsciizAlign("CONTINUE TO KTB", 0x14)
  AsciizAlign("CONTINUE TO KD", 0x14)
  AsciizAlign("CONTINUE TO TT", 0x14)
  AsciizAlign("CONTINUE TO FS", 0x14)
  AsciizAlign("CONTINUE TO CM", 0x14)
  AsciizAlign("CONTINUE TO MR", 0x14)
  AsciizAlign("CONTINUE TO WS", 0x14)
  AsciizAlign("CONTINUE TO SL", 0x14)
  AsciizAlign("CONTINUE TO RRY", 0x14)
  AsciizAlign("CONTINUE TO BC", 0x14)
  AsciizAlign("CONTINUE TO DKJP", 0x14)
  AsciizAlign("CONTINUE TO YV", 0x14)
  AsciizAlign("CONTINUE TO BB", 0x14)
  AsciizAlign("CONTINUE TO RRD", 0x14)
  AsciizAlign("CONTINUE TO LR", 0x14)
Option2:
Asciiz("COURSE CHANGE")
Option3:
Asciiz("DRIVER CHANGE")
Option4:
Asciiz("RETRY")
Align(4)
}

// Versus All Cups Menu2 (CORREGIDA: VA Rules evita caso especial Rainbow Road)
scope VersusAllCupsMenu2: {
  LuiLb(t0, Options+10)
  Enabled:
    OriBne(t0, 0x02, t1, Disabled)
    LuiLw(t0, ModeSelection)
    OriBne(t0, 0x02, t1, Disabled)
    lw v1, 0x04 (v0)
    OriBeq(v1, 0x0A, at, Option1)
    OriBeq(v1, 0x0B, at, Option2)
    OriBeq(v1, 0x0C, at, Option3)
    OriBeq(v1, 0x0D, at, Option4)
    Option1:
      // Verificar primero si es VA Rules para evitar el caso especial de Rainbow Road
      LuiLb(t2, Options+3)
      OriBeq(t2, 0x02, t1, VARainbowSkip)
      // KA Rules: lógica original (con caso especial RRD -> LR)
      LuiLh(t0, CourseSelection1)
      RainbowRoad:
        OriBne(t0, 0x0D, t1, Lookup)
        ori t0, r0, 0x08
        LuiSh(t0, CourseSelection1, t1)
        LuiSb(r0, CupSelection, t1)
        LuiSb(r0, CourseSelection2, t1)
        j 0x8009CF94
        nop
      Lookup:
        la t1, 0x800F2BB4      // tabla original
        b Loop
        nop
      VARainbowSkip:
        // VA Rules: búsqueda directa en VATable sin caso especial
        LuiLh(t0, CourseSelection1)
        la t1, VATable
      Loop:
        lh t2, 0 (t1)
        beq t0, t2, Increment
        nop
        addiu t1, 0x02
        b Loop
        nop
      Increment:
        lh t1, 0x02 (t1)
        LuiSh(t1, CourseSelection1, t0)
        IncrementCup:
          LuiLb(t0, CourseSelection2)
          OriBne(t0, 0x03, t1, IncrementCourse)
          LuiLb(t0, CupSelection)
          addiu t0, 0x01
          LuiSb(t0, CupSelection, t1)
          LuiSb(r0, CourseSelection2, t1)
          j 0x8009CF94
          nop
        IncrementCourse:
          LuiLb(t0, CourseSelection2)
          addiu t0, 0x01
          LuiSb(t0, CourseSelection2, t1)
          j 0x8009CF94
          nop
    Option2:
      j 0x8009CFA4
      nop
    Option3:
      j 0x8009CFB4
      nop
    Option4:
      j 0x8009CF94
      nop
  Disabled:
    lw v1, 0x04 (v0)
End:
  j 0x8009CF6C
  nop
}

// Character Stats
include "stats_yoshi.asm"

fill 0xC00000 - origin()

// Hooks
origin 0x0B4524
base 0x800B3924
nop
origin 0x0B45A4
base 0x800B39A4
nop
origin 0x0B4638
base 0x800B3A38
j SameCharacter

origin 0x0B4B64
base 0x800B3F64
nop
nop
j RandomTracks

origin 0x0021C4
base 0x800015C4
jal ScalingFix1p
nop
origin 0x002638
base 0x80001A38
jal ScalingFix2p
nop
origin 0x002890
base 0x80001C90
jal ScalingFix3p
nop
origin 0x002490
base 0x80001890
jal ScalingFixPost
nop
origin 0x001BDC
base 0x80000FDC
jal Scaling60FpsFix1
nop
origin 0x0020CC
base 0x800014CC
jal Scaling60FpsFix2

origin 0x001634
base 0x80000A34
j PollingFix

origin 0x10E07C
base 0x802A4A6C
jal Widescreen
nop
origin 0x10F048
base 0x802A5A38
jal Widescreen
nop
origin 0x10F330
base 0x802A5D20
jal Widescreen
nop
origin 0x10F628
base 0x802A6018
jal Widescreen
nop
origin 0x10F93C
base 0x802A632C
jal Widescreen
nop
origin 0x10FC50
base 0x802A6640
jal Widescreen
nop
origin 0x10FF54
base 0x802A6944
jal Widescreen
nop
origin 0x110238
base 0x802A6C28
jal Widescreen
nop
origin 0x11051C
base 0x802A6F0C
jal Widescreen
nop
origin 0x11084C
base 0x802A723C
jal Widescreen
nop

origin 0x0F79E4
base 0x8028E3D4
j SkipTrophy

origin 0x0F82A8
base 0x8028EC98
j MultiplayerMusic
nop
origin 0x0F8FD0
base 0x8028F9C0
jal MultiplayerMusicL
nop

origin 0x01354C
base 0x8001294C
jal MultiplayerTrain
nop

origin 0x013F4C
base 0x8001334C
j MultiplayerBoat

origin 0x00A458
base 0x80009858
jal VersusBomb
origin 0x01D004
base 0x8001C404
jal VersusBomb
lw  t8, 0xC53C(t8)

origin 0x09DBA4
base 0x8009CFA4
jal VersusAllCups
nop

origin 0x05067C
base 0x8004FA7C
j VersusTimer
nop

origin 0x11C680
base 0x802B3070
nop
nop
j GoldMushroom

origin 0x07BB60
base 0x8007AF60
jal PlayerItems

origin 0x003314
base 0x80002714
jal CharacterStats
nop

origin 0x00A2A8
base 0x800096A8
nop
jal LapFix
nop

origin 0xA7864
base 0x800A6C64
jal VersusScores
origin 0x0A7938
base 0x800A6D38
jal VersusScores

origin 0x0A7220
base 0x800A6620
jal VersusAllCupsMenu
origin 0x09DB64
base 0x8009CF64
j VersusAllCupsMenu2
