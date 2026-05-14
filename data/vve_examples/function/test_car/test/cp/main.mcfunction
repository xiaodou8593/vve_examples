#vve_examples:test_car/test/cp/main

function vve:point/_get
data modify storage math:io render_command set from storage math:class particle_commands.red_dust
execute as 0-0-0-0-0 run function vve:point/_render_velocity

execute unless score test int matches -1 run return fail
scoreboard players set @s killtime 10

#tellraw @a "---"
#tellraw @a ["test_n: ", {"score":{"name":"test_n","objective":"int"}}]

function vve_examples:test_car/main

#scoreboard players set test int 1
scoreboard players add test_n int 1