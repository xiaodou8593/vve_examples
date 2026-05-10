#vve_examples:test_car/_regular
# 规整化姿态，消除法向角速度
# 输入nvec{...}
# 输入storage vve:io result
# 输入receiver{...}
# 需要传入世界实体为执行者

#execute if score test_n int matches 17 run function math:nvec/_print
#execute if score test_n int matches 17 run tellraw @a ["shift_points: ", {"nbt":"shift_points","storage":"vve:io"}]
# 叉乘计算表面法向量
execute store result score stemp_x int run data get storage vve:io shift_points[0][0] 10000
execute store result score stemp_y int run data get storage vve:io shift_points[0][1] 10000
execute store result score stemp_z int run data get storage vve:io shift_points[0][2] 10000
execute store result score vec_x int run data get storage vve:io shift_points[1][0] 10000
execute store result score vec_y int run data get storage vve:io shift_points[1][1] 10000
execute store result score vec_z int run data get storage vve:io shift_points[1][2] 10000
execute store result score fvec_x int run data get storage vve:io shift_points[2][0] 10000
execute store result score fvec_y int run data get storage vve:io shift_points[2][1] 10000
execute store result score fvec_z int run data get storage vve:io shift_points[2][2] 10000
scoreboard players operation vec_x int -= stemp_x int
scoreboard players operation vec_y int -= stemp_y int
scoreboard players operation vec_z int -= stemp_z int
scoreboard players operation fvec_x int -= stemp_x int
scoreboard players operation fvec_y int -= stemp_y int
scoreboard players operation fvec_z int -= stemp_z int
function math:vec/_cross_fvec_high
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players get vec_x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players get vec_y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players get vec_z int
data modify entity @s Pos set from storage math:io xyz
execute positioned 0.0 0.0 0.0 facing entity @s feet run tp @s ^ ^ ^1.0
data modify storage math:io xyz set from entity @s Pos
execute store result score vec_x int run data get storage math:io xyz[0] 10000
execute store result score vec_y int run data get storage math:io xyz[1] 10000
execute store result score vec_z int run data get storage math:io xyz[2] 10000
scoreboard players operation nvec_x int *= vec_x int
scoreboard players operation nvec_y int *= vec_y int
scoreboard players operation nvec_z int *= vec_z int
scoreboard players operation nvec_x int += nvec_y int
scoreboard players operation nvec_x int += nvec_z int
scoreboard players set stemp_s int 1
execute if score nvec_x int matches ..-1 run scoreboard players set stemp_s int -1
scoreboard players operation nvec_x int = vec_x int
scoreboard players operation nvec_y int = vec_y int
scoreboard players operation nvec_z int = vec_z int
scoreboard players operation nvec_x int *= stemp_s int
scoreboard players operation nvec_y int *= stemp_s int
scoreboard players operation nvec_z int *= stemp_s int

#execute if score test_n int matches 3 run scoreboard players set test int 1
#execute if score test_n int matches 3 run function math:nvec/_print

# 平面四元数
function math:iquat/_nvec_to

# 转换为相对四元数
function math:quat/_relative
function math:rquat/_to_quat

# 四元数规整化
function math:quat/_touvw
function math:quat/_regular
function math:rquat/_to_quat

# 转换为世界坐标系
function math:quat/_mult
function math:rquat/_to_quat
function math:quat/_touvw

scoreboard players operation angular_x int /= 100 int
scoreboard players operation angular_y int /= 100 int
scoreboard players operation angular_z int /= 100 int

scoreboard players operation angular_x int *= nvec_x int
scoreboard players operation angular_y int *= nvec_y int
scoreboard players operation angular_z int *= nvec_z int
scoreboard players operation angular_x int += angular_y int
scoreboard players operation angular_x int += angular_z int
execute store result score angular_y int store result score angular_z int run scoreboard players operation angular_x int /= 10000 int

scoreboard players operation angular_x int *= nvec_x int
scoreboard players operation angular_y int *= nvec_y int
scoreboard players operation angular_z int *= nvec_z int
scoreboard players operation angular_x int /= 100 int
scoreboard players operation angular_y int /= 100 int
scoreboard players operation angular_z int /= 100 int

function vve:object/_set_angular