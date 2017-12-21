let rec mul x y =
if(x < 0.2) then y else mul (x -. 1.0) (x +. y) in
print_float (mul 10.0 0.0)
