#vve_examples:test_car/test/frame

$data modify storage vve_examples:io input set from storage vve_examples:io test_frames.$(frame)
function vve_examples:test_car/_new
scoreboard players set @e[tag=result,limit=1] killtime 50
execute as @e[tag=result,limit=1] run function vve_examples:test_car/main_c