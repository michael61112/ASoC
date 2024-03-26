bmpUtil: source code of bmp reader and writer
cmodel: reference model
hls_c: hls c++ code
bin: csim 
catapult_work: Catapult environment

Flows:
1. build c++ code
(1) make

2. run csim
cd bin; ./run.sh

3. run Catapult HLS synthesis
cd catapult_work; catapult -p ultra -f directives.tcl

