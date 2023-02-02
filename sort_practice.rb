array = ['g', 'a', 'k','e', 'a']
p array
p array[0].object_id
p array[1].object_id # 80
p array[2].object_id
p array[3].object_id
p array[4].object_id # 140

arr2 = array.sort # [a,a,e,g,k]
p arr2
p arr2[0].object_id # 80
p arr2[1].object_id # 140
p arr2[2].object_id
p arr2[3].object_id
p arr2[4].object_id