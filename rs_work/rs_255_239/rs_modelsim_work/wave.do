onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /top/message
add wave -noupdate -radix unsigned /top/error
add wave -noupdate -radix unsigned /top/clk
add wave -noupdate -radix unsigned /top/clrn
add wave -noupdate -radix unsigned /top/k
add wave -noupdate -radix unsigned /top/encoded
add wave -noupdate -radix unsigned /top/valid
add wave -noupdate -radix unsigned /top/dec_ena
add wave -noupdate -radix unsigned /top/enc_ena
add wave -noupdate -radix unsigned /top/data_present
add wave -noupdate -radix unsigned /top/noise
add wave -noupdate -radix unsigned /top/received
add wave -noupdate -radix unsigned /top/address
add wave -noupdate -radix unsigned /top/count
add wave -noupdate -radix unsigned /top/position
add wave -noupdate -radix unsigned /top/dec_trigger
add wave -noupdate -radix unsigned /top/enc_trigger
add wave -noupdate -radix unsigned /top/with_error
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {74250 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
configure wave -timelineunits ps
update
WaveRestoreZoom {71553 ps} {76333 ps}
