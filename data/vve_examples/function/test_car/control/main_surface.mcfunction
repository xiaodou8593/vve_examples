#vve_examples:test_car/control/main_surface
# vve_examples:test_car/main_c调用

scoreboard players set inp int -8000
execute if score input_s int matches 1 run function vve_examples:test_car/engine/_set_power
scoreboard players set inp int 18000
execute if score input_w int matches 1 run function vve_examples:test_car/engine/_set_power
scoreboard players set inp int 0
execute if score input_w int matches 0 if score input_s int matches 0 run function vve_examples:test_car/engine/_set_power