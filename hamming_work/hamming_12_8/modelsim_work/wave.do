onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /hamming_tb/data_in
add wave -noupdate /hamming_tb/received_data
add wave -noupdate /hamming_tb/encoded_data
add wave -noupdate /hamming_tb/decoded_data
add wave -noupdate /hamming_tb/error_flag
add wave -noupdate /hamming_tb/correct_flag
add wave -noupdate /hamming_tb/sys_clk
add wave -noupdate /hamming_tb/rstn
add wave -noupdate /hamming_tb/bit_id
add wave -noupdate /hamming_tb/n
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1358 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 98
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {1335 ns} {1410 ns}
