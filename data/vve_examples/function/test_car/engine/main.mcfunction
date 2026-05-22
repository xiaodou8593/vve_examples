#vve_examples:test_car/engine/main
# vve_examples:test_car/main_c调用

function math:damp/_iter

# 判定迭代终止
function math:damp/_energy
scoreboard players operation temp_e int = res int
function math:damp/_threshold
scoreboard players operation res int *= 10 int
execute if score temp_e int <= res int run function math:damp/_converge

# 获取发动机功率
scoreboard players operation temp_p int = target_power int
scoreboard players operation temp_p int += damp_x int

# 推进速度
execute if entity @s[tag=vve_surface] run function vve_examples:test_car/engine/gain_velocity