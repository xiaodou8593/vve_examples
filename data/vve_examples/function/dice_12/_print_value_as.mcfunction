#vve_examples:dice_12/_print_value_as
# 打印骰子点数
# 传入实例为执行者

function vve_examples:dice_12/_get
function vve_examples:dice_12/_get_value
tellraw @a ["roll_value: ", {"score":{"name":"res","objective":"int"}}]