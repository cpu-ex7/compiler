let rec f x y =
  x + y in
let rec g x y =
  let z = f x y in
  f z z in
let rec h x y =
  let z = g x y in
  g z z in
print_int (h 2 3)
