#vve_examples:dice_4/_trans_nvec
# 变换姿态修正法向量

function math:uvw/_nvec_to
# 变换{<u,int,1w>,<v,int,1w>,<w,int,1w>}
tellraw @a ["xyz: ",{"score":{"name":"u","objective":"int"}},", ",{"score":{"name":"v","objective":"int"}},", ",{"score":{"name":"w","objective":"int"}}]
function math:uvw/_to_nvec