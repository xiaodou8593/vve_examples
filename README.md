# vve_examples
examples for vve3.0



依次手动初始化：
function math:_init
function math:_init_la
function vve:_init
function vve_examples:_init


扔出一枚d4骰子：
execute anchored eyes positioned ^ ^ ^0.5 as @e[tag=math_marker,limit=1] run function vve_examples:dice_4/_roll

投出一枚d12骰子：
execute anchored eyes positioned ^ ^ ^0.5 as @e[tag=math_marker,limit=1] run function vve_examples:dice_12/_roll

骰子销毁时触发回调函数，生成一枚展示用骰子，拥有dice_display标签并将自身数据和UUID加入storage dice:temp dice_list，调用前需要先清理。(data modify storage dice:temp dice_list set value [])