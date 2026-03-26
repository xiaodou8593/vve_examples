#vve_examples:dice_12/test/cp/start

function vve:_init
function vve_examples:dice_12/init

kill @e[tag=test]

# 生成测试程序实体
data modify storage vve_examples:io input set from storage vve_examples:class dice_12_plate
function vve_examples:dice_12/_proj
execute positioned 193 -53 54 rotated 0.0 0.0 as @e[tag=math_marker,limit=1] run function vve:object/_anchor_to
function vve_examples:dice_12/_model
data modify storage vve_examples:io input set from storage vve_examples:io result
function vve_examples:dice_12/_new
item replace entity @e[tag=result,limit=1] container.0 with minecraft:clay_ball[minecraft:item_model="dice:dice4"]
tag @e[tag=result,limit=1] add test
tag @e[tag=result,limit=1] remove dice_12

execute as @e[tag=result,limit=1] run function marker_control:data/_get

# 设置测试程序主函数和销毁函数
data modify storage marker_control:io result.tick_func set value "vve_examples:dice_12/test/cp/main"
data modify storage marker_control:io result.del_func set value "vve_examples:dice_12/test/cp/end"

execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_ticked
tag @e[tag=result,limit=1] add entity_todel

# 设置测试程序运行时间
scoreboard players set @e[tag=result,limit=1] killtime 10
scoreboard players set test int -1

# 设置旋转
execute at @e[tag=result,limit=1] positioned ~5.0 ~5.0 ~5.0 run function vve_examples:dice_12/test/cp/rotate_here