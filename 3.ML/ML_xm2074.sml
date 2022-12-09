Control.Print.printDepth := 100;
Control.Print.printLength := 100;

(* Author: Xiao Ma, NetID: xm2074*)

(* Question 1: *)

fun insert x [] = [x]
 |  insert x (z::zs) = 
 	if x < z then (x::(z::zs))
 	else (z::insert x zs)

(* Question 2: *)

fun sort [] = []  
 |  sort (z::zs) = insert (hd (z::zs)) (sort (tl (z::zs)))

(* Question 3: *)

fun polySort (op <) [] = []
|	polySort (op <) (z::zs) = 
	let fun helper x [] = [x]
		| helper x (l::ls) = 
			if x < l then (x::(l::ls))
			else (l::helper x ls) 
		in 
			helper z (polySort (op <) zs)
		end


(* Question 4: *)

fun fold f [] b = b
 | fold f (z::zs) b = f(z,(fold f zs b))


(* Question 5: *)

datatype 'a tree = leaf of 'a | node of 'a tree list

(* Question 6: *)

fun fringe (leaf x) = [x]
| fringe (node []) = []
| fringe (node y) = fold (op @) (map fringe y) []

(* Question 7: *)

fun mapTree f (leaf x) = leaf (f x)
| mapTree f (node []) = node []
| mapTree f (node y) = node (map (mapTree f) y)

(* Question 8: *)

fun sortTree (op <) (leaf x) = leaf (polySort (op <) x)
    | sortTree (op <) (node L) = node (map (sortTree (op <)) L)

(* Question 9: *)

fun mergeList (op <) [] [] = []
| mergeList (op <) (z::zs) [] = (z::zs)
| mergeList (op <) [] (z::zs) = (z::zs)
| mergeList (op <) (z::zs) (l::ls) = 
	if z < l then z::(mergeList (op <) zs (l::ls))
	else l::(mergeList (op <) (z::zs) ls)

(* Question 10: *)
				
fun mergeTree (op <) T = fold (fn (x,y) => mergeList (op <) x y) (fringe (sortTree (op <) T)) []

