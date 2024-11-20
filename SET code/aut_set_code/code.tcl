
set val(chan)           Channel/WirelessChannel    
set val(prop)           Propagation/TwoRayGround   
set val(netif)          Phy/WirelessPhy            
set val(mac)            Mac/802_11                 
set val(ifq)            Queue/DropTail    
set val(ll)             LL                          
set val(ant)            Antenna/OmniAntenna        
set val(ifqlen)         1000                         
set val(nn)             40                          
set val(rp)             AODV
set val(x)	        1400
set val(y)	        1400

puts "This is a multi-channel sensor network test program."


set ns_		[new Simulator]
set tracefd [open out.tr w]
$ns_ trace-all $tracefd

set namtrace [open out.nam w]
$ns_ namtrace-all-wireless $namtrace $val(x) $val(y)


set topo       [new Topography]

$topo load_flatgrid $val(x) $val(y)

set myagent [new Agent/MyAgentOtcl]
$myagent call-my-priv-func
	
set god_ [create-god $val(nn)]
set chan_1_ [new $val(chan)]
set chan_2_ [new $val(chan)]


set val(rp) PHENOM                              ;
$ns_ node-config \
     -adhocRouting $val(rp) \
	 -llType $val(ll) \
	 -macType $val(mac) \
	 -ifqType $val(ifq) \
	 -ifqLen $val(ifqlen) \
	 -antType $val(ant) \
	 -propType $val(prop) \
	 -phyType $val(netif) \
	 -channel $chan_1_ \
	 -topoInstance $topo \
	 -energyModel EnergyModel \
	 -initialEnergy 100 \
	 -rxPower 0.3 \
	 -txPower 0.6 \
	 -agentTrace ON \
	 -routerTrace ON \
	 -macTrace ON \
	 -movementTrace ON

    set node_(0) [$ns_ node 0]
   
    $god_ new_node $node_(0)
    $node_(0) namattach $namtrace
    $ns_ initial_node_pos $node_(0) 30
    [$node_(0) set ragent_] pulserate .05      ;
    [$node_(0) set ragent_] phenomenon CO      ;

    


set val(rp) AODV                                ;
$ns_ node-config \
     -adhocRouting $val(rp) \
	 -channel $chan_2_ \
	   -PHENOMchannel $chan_1_ 
                        


for {set i 1} {$i < 40 } {incr i} {
	set node_($i) [$ns_ node]	
    	$god_ new_node $node_($i)
    $node_($i) namattach $namtrace
    $ns_ initial_node_pos $node_($i) 35
}



set sensor04 [new Agent/SensorAgent]
$ns_ attach-agent $node_(0) $sensor04
[$node_(5) set ll_(1)] up-target $sensor04
set src [new Agent/UDP]
set sink [new Agent/UDP]
$ns_ attach-agent $node_(1) $src
$ns_ attach-agent $node_(0) $sink
$ns_ connect $src $sink
$src set packetSize_ 1000
$src set interval_ 0.003
set app [new Application/SensorApp]
$app attach-agent $src
$ns_ at 1.9 "$app start $sensor04"

source link.tcl


$ns_ at 4.0 "stop"
$ns_ at 4.01 "puts \"NS EXITING...\" ; $ns_ halt"

proc stop {} {
    global ns_ tracefd namtrace
    $ns_ flush-trace
    close $tracefd
    close $namtrace
}


puts "Starting Simulation..."
$ns_ run
