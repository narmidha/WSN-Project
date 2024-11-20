

namespace eval md5pure {
   variable i
   variable t
   variable T
 
    set i 0
    foreach t {
	0xd76aa478 0xe8c7b756 0x242070db 0xc1bdceee 
	0xf57c0faf 0x4787c62a 0xa8304613 0xfd469501
	0x698098d8 0x8b44f7af 0xffff5bb1 0x895cd7be
	0x6b901122 0xfd987193 0xa679438e 0x49b40821

	0xf61e2562 0xc040b340 0x265e5a51 0xe9b6c7aa
	0xd62f105d 0x2441453  0xd8a1e681 0xe7d3fbc8
	0x21e1cde6 0xc33707d6 0xf4d50d87 0x455a14ed
	0xa9e3e905 0xfcefa3f8 0x676f02d9 0x8d2a4c8a

	0xfffa3942 0x8771f681 0x6d9d6122 0xfde5380c
	0xa4beea44 0x4bdecfa9 0xf6bb4b60 0xbebfbc70
	0x289b7ec6 0xeaa127fa 0xd4ef3085 0x4881d05
	0xd9d4d039 0xe6db99e5 0x1fa27cf8 0xc4ac5665

	0xf4292244 0x432aff97 0xab9423a7 0xfc93a039
	0x655b59c3 0x8f0ccc92 0xffeff47d 0x85845dd1
	0x6fa87e4f 0xfe2ce6e0 0xa3014314 0x4e0811a1
	0xf7537e82 0xbd3af235 0x2ad7d2bb 0xeb86d391
    } {
	incr i
	set T($i) [expr $t]
    }
}

proc md5pure::md5 {msg} {
    variable T

    

    set msgLen [string length $msg]

   set padLen [expr {56 - $msgLen%64}]
    if {$msgLen % 64 > 56} {
	incr padLen 64
   }

    
    if {$padLen == 0} {
	incr padLen 64
    }

    
    append msg [binary format "a$padLen" \200]

    
    append msg [binary format "i1i1" [expr {8*$msgLen}] 0]
    
    

    set A [expr 0x67452301]
    set B [expr 0xefcdab89]
    set C [expr 0x98badcfe]
    set D [expr 0x10325476]

    
    binary scan $msg i* blocks
    set i 0
    foreach b $blocks {
	set M($i) $b
	incr i
    }

    set blockLen [array size M]

    for {set i 0} {$i < $blockLen/16} {incr i} {
	
	for {set j 0} {$j<16} {incr j} {
	    set X($j) $M([expr {$i*16+$j}])
	}

	
	set AA $A
	set BB $B
	set CC $C
	set DD $D

	set A [expr {$B + [<<< [expr {$A + [F $B $C $D] + $X(0)  + $T(1) }]  7]}]
	set D [expr {$A + [<<< [expr {$D + [F $A $B $C] + $X(1)  + $T(2) }] 12]}]
	set C [expr {$D + [<<< [expr {$C + [F $D $A $B] + $X(2)  + $T(3) }] 17]}]
	set B [expr {$C + [<<< [expr {$B + [F $C $D $A] + $X(3)  + $T(4) }] 22]}]
	
	set A [expr {$B + [<<< [expr {$A + [F $B $C $D] + $X(4)  + $T(5) }]  7]}]
	set D [expr {$A + [<<< [expr {$D + [F $A $B $C] + $X(5)  + $T(6) }] 12]}]
	set C [expr {$D + [<<< [expr {$C + [F $D $A $B] + $X(6)  + $T(7) }] 17]}]
	set B [expr {$C + [<<< [expr {$B + [F $C $D $A] + $X(7)  + $T(8) }] 22]}]
	
	set A [expr {$B + [<<< [expr {$A + [F $B $C $D] + $X(8)  + $T(9) }]  7]}]
	set D [expr {$A + [<<< [expr {$D + [F $A $B $C] + $X(9)  + $T(10)}] 12]}]
	set C [expr {$D + [<<< [expr {$C + [F $D $A $B] + $X(10) + $T(11)}] 17]}]
	set B [expr {$C + [<<< [expr {$B + [F $C $D $A] + $X(11) + $T(12)}] 22]}]
	
	set A [expr {$B + [<<< [expr {$A + [F $B $C $D] + $X(12) + $T(13)}]  7]}]
	set D [expr {$A + [<<< [expr {$D + [F $A $B $C] + $X(13) + $T(14)}] 12]}]
	set C [expr {$D + [<<< [expr {$C + [F $D $A $B] + $X(14) + $T(15)}] 17]}]
	set B [expr {$C + [<<< [expr {$B + [F $C $D $A] + $X(15) + $T(16)}] 22]}]
	
	set A [expr {$B + [<<< [expr {$A + [G $B $C $D] + $X(1)  + $T(17)}]  5]}]
	set D [expr {$A + [<<< [expr {$D + [G $A $B $C] + $X(6)  + $T(18)}]  9]}]
	set C [expr {$D + [<<< [expr {$C + [G $D $A $B] + $X(11) + $T(19)}] 14]}]
	set B [expr {$C + [<<< [expr {$B + [G $C $D $A] + $X(0)  + $T(20)}] 20]}]
	
	set A [expr {$B + [<<< [expr {$A + [G $B $C $D] + $X(5)  + $T(21)}]  5]}]
	set D [expr {$A + [<<< [expr {$D + [G $A $B $C] + $X(10) + $T(22)}]  9]}]
	set C [expr {$D + [<<< [expr {$C + [G $D $A $B] + $X(15) + $T(23)}] 14]}]
	set B [expr {$C + [<<< [expr {$B + [G $C $D $A] + $X(4)  + $T(24)}] 20]}]

	set A [expr {$B + [<<< [expr {$A + [G $B $C $D] + $X(9)  + $T(25)}]  5]}]
	set D [expr {$A + [<<< [expr {$D + [G $A $B $C] + $X(14) + $T(26)}]  9]}]
	set C [expr {$D + [<<< [expr {$C + [G $D $A $B] + $X(3)  + $T(27)}] 14]}]
	set B [expr {$C + [<<< [expr {$B + [G $C $D $A] + $X(8)  + $T(28)}] 20]}]
	
	set A [expr {$B + [<<< [expr {$A + [G $B $C $D] + $X(13) + $T(29)}]  5]}]
	set D [expr {$A + [<<< [expr {$D + [G $A $B $C] + $X(2)  + $T(30)}]  9]}]
	set C [expr {$D + [<<< [expr {$C + [G $D $A $B] + $X(7)  + $T(31)}] 14]}]
	set B [expr {$C + [<<< [expr {$B + [G $C $D $A] + $X(12) + $T(32)}] 20]}]

	
	set A [expr {$B + [<<< [expr {$A + [H $B $C $D] + $X(5)  + $T(33)}]  4]}]
	set D [expr {$A + [<<< [expr {$D + [H $A $B $C] + $X(8)  + $T(34)}] 11]}]
	set C [expr {$D + [<<< [expr {$C + [H $D $A $B] + $X(11) + $T(35)}] 16]}]
	set B [expr {$C + [<<< [expr {$B + [H $C $D $A] + $X(14) + $T(36)}] 23]}]
	
	set A [expr {$B + [<<< [expr {$A + [H $B $C $D] + $X(1)  + $T(37)}]  4]}]
	set D [expr {$A + [<<< [expr {$D + [H $A $B $C] + $X(4)  + $T(38)}] 11]}]
	set C [expr {$D + [<<< [expr {$C + [H $D $A $B] + $X(7)  + $T(39)}] 16]}]
	set B [expr {$C + [<<< [expr {$B + [H $C $D $A] + $X(10) + $T(40)}] 23]}]
	
	set A [expr {$B + [<<< [expr {$A + [H $B $C $D] + $X(13) + $T(41)}]  4]}]
	set D [expr {$A + [<<< [expr {$D + [H $A $B $C] + $X(0)  + $T(42)}] 11]}]
	set C [expr {$D + [<<< [expr {$C + [H $D $A $B] + $X(3)  + $T(43)}] 16]}]
	set B [expr {$C + [<<< [expr {$B + [H $C $D $A] + $X(6)  + $T(44)}] 23]}]
	
	set A [expr {$B + [<<< [expr {$A + [H $B $C $D] + $X(9)  + $T(45)}]  4]}]
	set D [expr {$A + [<<< [expr {$D + [H $A $B $C] + $X(12) + $T(46)}] 11]}]
	set C [expr {$D + [<<< [expr {$C + [H $D $A $B] + $X(15) + $T(47)}] 16]}]
	set B [expr {$C + [<<< [expr {$B + [H $C $D $A] + $X(2)  + $T(48)}] 23]}]

	
	set A [expr {$B + [<<< [expr {$A + [I $B $C $D] + $X(0)  + $T(49)}]  6]}]
	set D [expr {$A + [<<< [expr {$D + [I $A $B $C] + $X(7)  + $T(50)}] 10]}]
	set C [expr {$D + [<<< [expr {$C + [I $D $A $B] + $X(14) + $T(51)}] 15]}]
	set B [expr {$C + [<<< [expr {$B + [I $C $D $A] + $X(5)  + $T(52)}] 21]}]
	
	set A [expr {$B + [<<< [expr {$A + [I $B $C $D] + $X(12) + $T(53)}]  6]}]
	set D [expr {$A + [<<< [expr {$D + [I $A $B $C] + $X(3)  + $T(54)}] 10]}]
	set C [expr {$D + [<<< [expr {$C + [I $D $A $B] + $X(10) + $T(55)}] 15]}]
	set B [expr {$C + [<<< [expr {$B + [I $C $D $A] + $X(1)  + $T(56)}] 21]}]
	
	set A [expr {$B + [<<< [expr {$A + [I $B $C $D] + $X(8)  + $T(57)}]  6]}]
	set D [expr {$A + [<<< [expr {$D + [I $A $B $C] + $X(15) + $T(58)}] 10]}]
	set C [expr {$D + [<<< [expr {$C + [I $D $A $B] + $X(6)  + $T(59)}] 15]}]
	set B [expr {$C + [<<< [expr {$B + [I $C $D $A] + $X(13) + $T(60)}] 21]}]	
	set A [expr {$B + [<<< [expr {$A + [I $B $C $D] + $X(4)  + $T(61)}]  6]}]
	set D [expr {$A + [<<< [expr {$D + [I $A $B $C] + $X(11) + $T(62)}] 10]}]
	set C [expr {$D + [<<< [expr {$C + [I $D $A $B] + $X(2)  + $T(63)}] 15]}]
	set B [expr {$C + [<<< [expr {$B + [I $C $D $A] + $X(9)  + $T(64)}] 21]}]

	
	incr A $AA
	incr B $BB
	incr C $CC
	incr D $DD
    }
    

    return [bytes $A][bytes $B][bytes $C][bytes $D]
}



proc md5pure::<<< {x i} {
    

    expr {($x << $i) | ((($x >> 1) & 0x7fffffff) >> (31-$i))}
}

proc md5pure::F {x y z} {expr {(($x & $y) | ((~$x) & $z))}}
proc md5pure::G {x y z} {expr {(($x & $z) | ($y & (~$z)))}}
proc md5pure::H {x y z} {expr {$x ^ $y ^ $z}}
proc md5pure::I {x y z} {expr {$y ^ ($x | (~$z))}}

proc md5pure::byte0 {i} {expr {0xff & $i}}
proc md5pure::byte1 {i} {expr {(0xff00 & $i) >> 8}}
proc md5pure::byte2 {i} {expr {(0xff0000 & $i) >> 16}}
proc md5pure::byte3 {i} {expr {((0xff000000 & $i) >> 24) & 0xff}}

proc md5pure::bytes {i} {
    format %0.2x%0.2x%0.2x%0.2x [byte0 $i] [byte1 $i] [byte2 $i] [byte3 $i]
}

set ip_node 192.26.2.1
set ip_node1 192.26.2.2
set ip_node2 192.26.2.3
set ip_node3 192.26.2.4
set ip_node4 192.26.2.5
set ip_node5 192.26.2.6
set ip_node6 192.26.2.7
set ip_node7 192.26.2.8
set ip_node8 192.26.2.1
set ip_node9 192.26.2.2
set ip_node10 192.26.2.10
set ip_node11 192.26.2.11
set ip_node12 192.26.2.12
set ip_node13 192.26.2.13
set ip_node14 192.26.2.14
set ip_node15 192.26.2.15
set ip_node16 192.26.2.16
set ip_node17 192.26.2.17
set ip_node18 192.26.2.18
set ip_node19 192.26.2.19
set ip_node20 192.26.2.20
set ip_node21 192.26.2.21
set ip_node22 192.26.2.22
set ip_node23 192.26.2.23
set ip_node24 192.26.2.24
set ip_node25 192.26.2.25
set ip_node26 192.26.2.26
set ip_node27 192.26.2.27
set ip_node28 192.26.2.28
set ip_node29 192.26.2.29
set ip_node30 192.26.2.30
set ip_node31 192.26.2.31
set ip_node32 192.26.2.32
set ip_node33 192.26.2.33
set ip_node34 192.26.2.34
set ip_node35 192.26.2.35
set ip_node36 192.26.2.36
set ip_node37 192.26.2.37
set ip_node38 192.26.2.38
set ip_node39 192.26.2.39


 
set message "$ip_node" 
set message1 "$ip_node1" 
set message2 "$ip_node2"
set message3 "$ip_node3" 
set message4 "$ip_node4" 
set message5 "$ip_node5" 
set message6 "$ip_node6" 
set message7 "$ip_node7" 
set message8 "$ip_node8" 
set message9 "$ip_node9" 
set message10 "$ip_node10" 
set message11 "$ip_node11"  
set message12 "$ip_node12" 
set message13 "$ip_node13" 
set message14 "$ip_node14" 
set message15 "$ip_node15" 
set message16 "$ip_node16" 
set message17 "$ip_node17" 
set message18 "$ip_node18" 
set message19 "$ip_node19" 
set message20 "$ip_node20" 
set message21 "$ip_node21" 
set message22 "$ip_node22"
set message23 "$ip_node23" 
set message24 "$ip_node24" 
set message25 "$ip_node25" 
set message26 "$ip_node26" 
set message27 "$ip_node27" 
set message28 "$ip_node28" 
set message29 "$ip_node29" 
set message30 "$ip_node30" 
set message31 "$ip_node31"  
set message32 "$ip_node32" 
set message33 "$ip_node33" 
set message34 "$ip_node34" 
set message35 "$ip_node35" 
set message36 "$ip_node36" 
set message37 "$ip_node37" 
set message38 "$ip_node38" 
set message39 "$ip_node39" 


set msg(0) [md5pure::md5 $message]
set msg(1) [md5pure::md5 $message1]
set msg(2) [md5pure::md5 $message2]
set msg(3) [md5pure::md5 $message3]
set msg(4) [md5pure::md5 $message4]
set msg(5) [md5pure::md5 $message5]
set msg(6) [md5pure::md5 $message6]
set msg(7) [md5pure::md5 $message7] 
set msg(8) [md5pure::md5 $message8]
set msg(9) [md5pure::md5 $message9]
set msg(10) [md5pure::md5 $message10]
set msg(11) [md5pure::md5 $message11]
set msg(12) [md5pure::md5 $message12]
set msg(13) [md5pure::md5 $message13]
set msg(14) [md5pure::md5 $message14]
set msg(15) [md5pure::md5 $message15]
set msg(16) [md5pure::md5 $message16]
set msg(17) [md5pure::md5 $message17]
set msg(18) [md5pure::md5 $message18]
set msg(19) [md5pure::md5 $message19]
set msg(20) [md5pure::md5 $message20]
set msg(21) [md5pure::md5 $message21]
set msg(22) [md5pure::md5 $message22]
set msg(23) [md5pure::md5 $message23]
set msg(24) [md5pure::md5 $message24]
set msg(25) [md5pure::md5 $message25]
set msg(26) [md5pure::md5 $message26]
set msg(27) [md5pure::md5 $message27] 
set msg(28) [md5pure::md5 $message28]
set msg(29) [md5pure::md5 $message29]
set msg(30) [md5pure::md5 $message30]
set msg(31) [md5pure::md5 $message31]
set msg(32) [md5pure::md5 $message32]
set msg(33) [md5pure::md5 $message33]
set msg(34) [md5pure::md5 $message34]
set msg(35) [md5pure::md5 $message35]
set msg(36) [md5pure::md5 $message36]
set msg(37) [md5pure::md5 $message37]
set msg(38) [md5pure::md5 $message38]
set msg(39) [md5pure::md5 $message39]



set se secret-key.tr
set c [open $se w]
for {set i 1} {$i < 40 } {incr i} {

set serkey($i) [string range $msg($i) 0 10]
puts $c "Node($i)  [string range $msg($i) 0 10]"


}

set pub public.tr
set c1 [open $pub w]
for {set i 1} {$i < 40 } {incr i} {

set public($i) [string range $msg($i) 11 25]
puts $c1 "Node($i)  [string range $msg($i) 11 25]"


}

set hidse SIGN.tr
set c1 [open $hidse w]
for {set i 27} {$i < 28 } {incr i} {

set hidserkey($i) [string range $msg($i) 26 32]
puts $c1 "Node($i)  [string range $msg($i) 26 32]"


}



set ke msk.tr
set c3 [open $ke w]
for {set i 1} {$i < 40 } {incr i} {

set key_($i) $msg($i)
puts $c3 "Node($i)  $msg($i)"


}
for {set i 1} {$i < 40 } {incr i} {
$ns_ at 1.5 "$ns_ trace-annotate \"MSK of Node($i)==$msg($i)\""
}
for {set i 1} {$i < 40 } {incr i} {


package provide md5pure 1.2
}
