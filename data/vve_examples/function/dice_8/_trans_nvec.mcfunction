#vve_examples:dice_8/_trans_nvec
# 变换姿态修正法向量

function math:uvw/_nvec_to
# 变换{<u,int,1w>,<v,int,1w>,<w,int,1w>}
scoreboard players set u int 0
scoreboard players set w int 0
scoreboard players set v int 10000
execute if score v int matches ..0 run scoreboard players set v int -10000
function math:uvw/_to_nvec