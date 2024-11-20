source md5pure.tcl
set estimatedkey [md5pure::md5 192.26.2.27]
set keygot ""
append keygot $serkey(27)
append keygot $public(27)
append keygot $hidserkey(27)
if { $estimatedkey == $keygot } { 
set udp_(4) [new Agent/UDP]
$ns_ attach-agent $node_(27) $udp_(4)
set null1_(4) [new Agent/Null]
$ns_ attach-agent $node_(1) $null1_(4)
set cbr1_(4) [new Application/Traffic/CBR]
$cbr1_(4) set packetSize_ 1024
$cbr1_(4) set interval_ 0.1
$cbr1_(4) set maxpkts_ 1000
$cbr1_(4) attach-agent $udp_(4)
$ns_ connect $udp_(4) $null1_(4)
$ns_ at 2.0 "$cbr1_(4) start"
} else { 
$ns_ at 2.0 "$node_(27) label MALICIOUS"
}

#$ns_ at 2.5 "[$node_(11) set ragent_] malicious"

set X1(0) 559.029
set X1(1) 559.029
set X1(2) 672.46
set X1(3) 555.799
set X1(4) 436.528
set X1(5) 431.164
set X1(6) 493.702
set X1(7) 560.158
set X1(8) 680.993
set X1(9) 671.276
set X1(10) 392.589
set X1(11) 447.483
set X1(12) 350.843
set X1(13) 352.994
set X1(14) 869.755
set X1(15) 741.603
set X1(16) 752.107
set X1(17) 617.652
set X1(18) 434.443
set X1(19) 361.348
set X1(20) 468.492
set X1(21) 598.745
set X1(22) 701.687
set X1(23) 771.015
set X1(24) 815.133
set X1(25) 802.528
set X1(26) 731.098
set X1(27) 289.918
set X1(28) 237.397
set X1(29) 300.423
set X1(30) 329.835
set X1(31) 743.707
set X1(32) 829.839
set X1(33) 859.251
set X1(34) 611.35
set X1(35) 827.738
set X1(36) 533.618
set X1(37) 191.178
set X1(38) 178.573
set X1(39) 210.086


set Y1(0) 284.462
set Y1(1) 284.462
set Y1(2) 139.916
set Y1(3) 131.517
set Y1(4) 136.141
set Y1(5) 278.286
set Y1(6) 472.693
set Y1(7) 399.127
set Y1(8) 401.114
set Y1(9) 269.068
set Y1(10) 457.987
set Y1(11) 65.1266
set Y1(12) 159.665
set Y1(13) 266.809
set Y1(14) 239.498
set Y1(15) 220.59
set Y1(16) 361.348
set Y1(17) 474.974
set Y1(18) 399.836
set Y1(19) 352.994
set Y1(20) 554.627
set Y1(21) 546.223
set Y1(22) 502.105
set Y1(23) 422.272
set Y1(24) 294.12
set Y1(25) 155.464
set Y1(26) 73.5301
set Y1(27) 79.8326
set Y1(28) 300.423
set Y1(29) 483.197
set Y1(30) 563.03
set Y1(31) 558.828
set Y1(32) 491.601
set Y1(33) 367.65
set Y1(34) 79.8327
set Y1(35) 79.8327
set Y1(36) 31.5129
set Y1(37) 94.5387
set Y1(38) 239.498
set Y1(39) 439.079

for {set i 0} {$i < 40 } {incr i} {
	
	$node_($i) set X_ $X1($i)
        $node_($i) set Y_ $Y1($i)
        $node_($i) set Z_ 0.0
	
}

for {set i 1} {$i < 40 } {incr i} {
set k 0
for {set j 1} {$j < 40 } {incr j} {
set a [ expr $X1($j)-$X1($i)]
set b [ expr $a*$a]
set c [ expr $Y1($j)-$Y1($i)]
set d [ expr $c*$c]
set e [ expr $b+$d]
set f 0.5
set g [expr pow($e,$f)]
puts "Distance from node($i) --to--node($j)----------->$g"
}
}

$ns_ at 0.0 "$node_(0) setdest 559.029 284.462 0.0"
$ns_ at 0.0 "$node_(1) setdest 559.029 284.462 0.0"
$ns_ at 0.0 "$node_(2) setdest 672.46 139.916 0.0"
$ns_ at 0.0 "$node_(3) setdest 555.799 131.517 0.0"
$ns_ at 0.0 "$node_(4) setdest 436.528 136.141 0.0"
$ns_ at 0.0 "$node_(5) setdest 431.164 278.286 0.0"
$ns_ at 0.0 "$node_(6) setdest 434.443 399.836 0.0"
$ns_ at 0.0 "$node_(7) setdest 560.058 399.127 0.0"
$ns_ at 0.0 "$node_(8) setdest 680.993 401.114 0.0"
$ns_ at 0.0 "$node_(9) setdest 671.276 269.068 0.0"
$ns_ at 0.0 "$node_(10) setdest 554.029 284.462 0.0"
$ns_ at 0.0 "$node_(11) setdest 553.029 284.462 0.0"
$ns_ at 0.0 "$node_(12) setdest 672.46 139.916 0.0"
$ns_ at 0.0 "$node_(13) setdest 559.799 131.517 0.0"
$ns_ at 0.0 "$node_(14) setdest 433.528 136.141 0.0"
$ns_ at 0.0 "$node_(15) setdest 438.164 278.286 0.0"
$ns_ at 0.0 "$node_(16) setdest 434.443 399.836 0.0"
$ns_ at 0.0 "$node_(17) setdest 567.158 399.127 0.0"
$ns_ at 0.0 "$node_(18) setdest 686.993 401.114 0.0"
$ns_ at 0.0 "$node_(19) setdest 675.276 269.068 0.0"
$ns_ at 0.0 "$node_(20) setdest 554.029 284.462 0.0"
$ns_ at 0.0 "$node_(21) setdest 558.029 284.462 0.0"
$ns_ at 0.0 "$node_(22) setdest 673.46 139.916 0.0"
$ns_ at 0.0 "$node_(23) setdest 551.799 131.517 0.0"
$ns_ at 0.0 "$node_(24) setdest 434.528 136.141 0.0"
$ns_ at 0.0 "$node_(25) setdest 430.064 278.286 0.0"
$ns_ at 0.0 "$node_(26) setdest 433.443 399.836 0.0"
$ns_ at 0.0 "$node_(27) setdest 566.158 399.127 0.0"
$ns_ at 0.0 "$node_(28) setdest 686.993 401.114 0.0"
$ns_ at 0.0 "$node_(29) setdest 674.276 269.068 0.0"
$ns_ at 0.0 "$node_(30) setdest 554.029 284.462 0.0"
$ns_ at 0.0 "$node_(31) setdest 558.029 284.462 0.0"
$ns_ at 0.0 "$node_(32) setdest 673.46 139.916 0.0"
$ns_ at 0.0 "$node_(33) setdest 551.799 131.517 0.0"
$ns_ at 0.0 "$node_(34) setdest 434.528 136.141 0.0"
$ns_ at 0.0 "$node_(35) setdest 430.064 278.286 0.0"
$ns_ at 0.0 "$node_(36) setdest 433.443 399.836 0.0"
$ns_ at 0.0 "$node_(37) setdest 566.158 399.127 0.0"
$ns_ at 0.0 "$node_(38) setdest 686.993 401.114 0.0"
$ns_ at 0.0 "$node_(39) setdest 674.276 269.068 0.0"

$ns_ at 0.5 "$node_(0) label BS"
$ns_ at 0.5 "$node_(0) add-mark m red square"


$ns_ at 1.2 "$node_(12) label CH"
$ns_ at 1.2 "$node_(14) label CH"
$ns_ at 1.2 "$node_(6) label CH"
$ns_ at 1.2 "$node_(13) label G"
$ns_ at 1.2 "$node_(9) label G"
$ns_ at 1.2 "$node_(17) label G"

$ns_ at 2.0 "$node_(27) label SENDER"

$ns_ at 1.2 "$node_(12) add-mark m magenta hexagon"
$ns_ at 1.2 "$node_(14) add-mark m yellow hexagon"
$ns_ at 1.2 "$node_(6) add-mark m white hexagon"
$ns_ at 1.2 "$node_(13) add-mark m magenta square"
$ns_ at 1.2 "$node_(9) add-mark m yellow square"
$ns_ at 1.2 "$node_(17) add-mark m white square"


$ns_ at 1.2 "$node_(0) add-mark m white circle"
$ns_ at 1.2 "$node_(1) add-mark m white circle"
$ns_ at 1.2 "$node_(2) add-mark m yellow circle"
$ns_ at 1.2 "$node_(3) add-mark m magenta circle"
$ns_ at 1.2 "$node_(4) add-mark m magenta circle"
$ns_ at 1.2 "$node_(5) add-mark m magenta circle"
$ns_ at 1.2 "$node_(7) add-mark m white circle"
$ns_ at 1.2 "$node_(8) add-mark m white circle"
$ns_ at 1.2 "$node_(10) add-mark m white circle"
$ns_ at 2.6 "$node_(10) delete-mark m"
$ns_ at 2.6 "$node_(10) add-mark m red square"
$ns_ at 1.2 "$node_(11) add-mark m magenta circle"
$ns_ at 1.2 "$node_(15) add-mark m yellow circle"
$ns_ at 1.2 "$node_(16) add-mark m yellow circle"
$ns_ at 1.2 "$node_(18) add-mark m white circle"
$ns_ at 1.2 "$node_(19) add-mark m magenta circle"
$ns_ at 1.2 "$node_(20) add-mark m white circle"
$ns_ at 1.2 "$node_(21) add-mark m white circle"
$ns_ at 1.2 "$node_(22) add-mark m white circle"
$ns_ at 1.2 "$node_(23) add-mark m yellow circle"
$ns_ at 1.2 "$node_(24) add-mark m yellow circle"
$ns_ at 1.2 "$node_(25) add-mark m yellow circle"
$ns_ at 1.2 "$node_(26) add-mark m yellow circle"
$ns_ at 1.2 "$node_(27) add-mark m magenta circle"
$ns_ at 1.2 "$node_(28) add-mark m magenta circle"
$ns_ at 1.2 "$node_(29) add-mark m white circle"
$ns_ at 1.2 "$node_(30) add-mark m white circle"
$ns_ at 1.2 "$node_(31) add-mark m white circle"
$ns_ at 1.2 "$node_(32) add-mark m yellow circle"
$ns_ at 1.2 "$node_(33) add-mark m yellow circle"
$ns_ at 1.2 "$node_(34) add-mark m yellow circle"
$ns_ at 1.2 "$node_(35) add-mark m yellow circle"
$ns_ at 1.2 "$node_(36) add-mark m magenta circle"
$ns_ at 1.2 "$node_(37) add-mark m magenta circle"
$ns_ at 1.2 "$node_(38) add-mark m magenta circle"
$ns_ at 1.2 "$node_(39) add-mark m white circle"




$ns_ at 0.01 "$ns_ trace-annotate \"WSN deployed..\""
$ns_ at 0.1 "$ns_ trace-annotate \"BS continuoulsy sending PHENOM signals\""
$ns_ at 0.8 "$ns_ trace-annotate \"LEACH initiates the Clustering Process\""
$ns_ at 1.2 "$ns_ trace-annotate \"LEACH selects Node 12,14,6 as CH\""
$ns_ at 1.2 "$ns_ trace-annotate \"LEACH selects Node 13,9,17 as GateWay\""
$ns_ at 1.5 "$ns_ trace-annotate \"MSK, Secret Keys are Created\""
$ns_ at 1.8 "$ns_ trace-annotate \"Node 27 Communicates with BS \""
$ns_ at 2.05 "$ns_ trace-annotate \"Node 27 SIGNs the message and send to BS \""


