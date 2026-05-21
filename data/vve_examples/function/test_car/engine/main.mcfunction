#vve_examples:test_car/engine/main
# vve_examples:test_car/main_c调用

function math:damp/_iter

# 判定迭代终止
function math:damp/_energy
scoreboard players operation temp_e int = res int
function math:damp/_threshold
execute if score temp_e int <= res int run function math:damp/_converge