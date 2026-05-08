#vve_examples:test_car/_class
# 生成预设静态数据模板

function vve_examples:test_car/_zero
execute positioned 0.0 0.0 0.0 rotated 0.0 0.0 as 0-0-0-0-0 run function vve:object/_anchor_to
scoreboard players set scale_u int 10000
scoreboard players set scale_v int 6000
scoreboard players set scale_w int 20000
scoreboard players set mass int 17
function vve:cubox/_calc_shift
function vve:cubox/_calc_tensor
function vve_examples:test_car/_model
data modify storage vve_examples:class test_car_plate set from storage vve_examples:io result