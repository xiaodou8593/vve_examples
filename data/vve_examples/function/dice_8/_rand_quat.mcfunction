#vve_examples:dice_8/_rand_quat
# 生成骰子随机四元数姿态
# 需要传入世界实体为执行者

data modify storage vve_examples:io result set value [\
	[0.0d,0.5773d,-0.8165d],\
	[0.0d,0.5773d,0.8165d],\
	[-0.8165d,0.5773d,0.0d],\
	[0.8165d,0.5773d,0.0d],\
	[0.0d,-0.5773d,-0.8165d],\
	[0.0d,-0.5773d,0.8165d],\
	[-0.8165d,-0.5773d,0.0d],\
	[0.8165d,-0.5773d,0.0d]\
]
execute store result score loop int run random value 0..7
execute if score loop int matches 1.. run function vve_examples:dice_8/rand_quat_loop
data modify entity @s Pos set from storage vve_examples:io result[0]
execute store result score uvec_x int run data get storage vve_examples:io result[0][0] 10000
execute store result score uvec_y int run data get storage vve_examples:io result[0][1] 10000
execute store result score uvec_z int run data get storage vve_examples:io result[0][2] 10000
# 设置姿态与旋转
execute positioned 0.0 0.0 0.0 facing entity @s feet run function math:quat/_facing_to
function math:quat/_topose
function math:quat/axis/_uvecto
execute store result score quat_phi int run random value 0..359
scoreboard players operation quat_phi int /= 60 int
scoreboard players operation quat_phi int *= 600000 int
function math:quat/_xyzw
scoreboard players set angular_x int 0
scoreboard players set angular_y int 0
scoreboard players set angular_z int 0
function vve:object/_set_angular

function math:quat/_touvw