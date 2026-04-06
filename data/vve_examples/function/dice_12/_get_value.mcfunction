#vve_examples:dice_12/_get_value
# 获取骰子点数

scoreboard players set res int 0
scoreboard players set temp_max int 0
data modify storage vve_examples:io result set value [\
	[0.0d,0.8506d,0.5257d],\
	[0.8506d,0.5257d,0.0d],\
	[0.5257d,0.0d,0.8506d],\
	[0.0d,-0.8506d,0.5257d],\
	[-0.8506d,0.5257d,0.0d],\
	[0.5257d,0.0d,-0.8506d],\
	[0.0d,0.8506d,-0.5257d],\
	[0.8506d,-0.5257d,0.0d],\
	[-0.5257d,0.0d,0.8506d],\
	[0.0d,-0.8506d,-0.5257d],\
	[-0.8506d,-0.5257d,0.0d],\
	[-0.5257d,0.0d,-0.8506d]\
]
data modify storage vve_examples:io temp_values set value [\
	1,\
	5,\
	4,\
	9,\
	2,\
	7,\
	6,\
	8,\
	3,\
	12,\
	10,\
	11\
]
execute if data storage vve_examples:io result[0] run function vve_examples:dice_12/get_value_loop