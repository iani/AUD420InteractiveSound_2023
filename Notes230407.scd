//: basic structure: framework to fill:

// A routine created with fork:
{
	// statement: do something
	"starting. This is part 1".postln;
	// waiting some time:
	1.wait;
	// next action;
	"part 2".postln;
	// wait again
	1.wait;
	// next action
	"part 3".postln;
	// last waiting time = till the end.
	1.wait;
	"This is the end. The piece ended.".postln;
}.fork;
//:
//==========================
// stepwise packing the above recipe into steps that can be reused.
//==========================
//: Pack the piece in a function so that you can restart it any time with fork.
~mypiece1 = {
	// statement: do something
	"starting. This is part 1".postln;
	// waiting some time:
	1.wait;
	// next action;
	"part 2".postln;
	// wait again
	1.wait;
	// next action
	"part 3".postln;
	// last waiting time = till the end.
	1.wait;
	"This is the end. The piece ended.".postln;
};
//:to start the piece, run this:
~mypiece1.fork;
//:Try out the sounds first and then pack them also into functions.
//:Phase 1: make a synth and store the synth so that you can stop it.
~sound1 = { SinOsc.ar(400, 0, 0.1).dup }.play;
//:stop the sound with a smooth fadeout of 5 seconds
~sound1 release: 5;
//:next pack those two actions into functions;
~startsound1 = { ~sound1 = { SinOsc.ar(400 rrand: 1200, 0, 0.1).dup }.play; };
~stopsound1 = { ~sound1 release: 0.05; };
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//:================  put the sound actions in your piece functiom
~mypiece2 = {
	~startsound1.value;
	0.3.wait;
	~stopsound1.value;
};
//:
~mypiece2.fork;
//
//
//