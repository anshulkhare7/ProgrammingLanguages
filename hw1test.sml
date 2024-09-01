(* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

(* Prob 1 *)
val test_is_older_1 = is_older ((1,2,3),(2,3,4)) = true
val test_is_older_2 = is_older ((1,2,3),(1,3,4)) = true
val test_is_older_3 = is_older ((1,2,3),(1,2,4)) = true
val test_is_older_4 = is_older ((1,2,4),(1,2,4)) = false
val test_is_older_5 = is_older ((2,3,4),(1,2,3)) = false
val test_is_older_6 = is_older ((2,3,4),(2,3,3)) = false

(* Prob 2 *)
val test_number_in_month_1 = number_in_month ([(2012,2,28),(2013,12,1)],2) = 1
val test_number_in_month_2 = number_in_month ([(2012,3,28),(2013,12,1)],2) = 0
val test_number_in_month_3 = number_in_month ([(2012,12,28),(2013,12,1),(2012,12,28),(2013,12,1)],12) = 4
val test_number_in_month_4 = number_in_month ([],2) = 0

(* Prob 3 *)
val test_number_in_months_1 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val test_number_in_months_2 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[1,5,11]) = 0

(* Prob 4 *)
val test_dates_in_month_1 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]
val test_dates_in_month_2 = dates_in_month ([(2012,2,28),(2013,12,1),(2014,2,17)],2) = [(2012,2,28), (2014,2,17)]

(* Prob 5 *)
val test_dates_in_months_1 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val test_dates_in_months_2 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = []

val test_get_nth_1 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"
val test_get_nth_2 = get_nth ([], 2) = ""

val test_date_to_string_1 = date_to_string (2013, 6, 1) = "June 1, 2013"

(* 
val test8 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3

val test9 = what_month 70 = 3

val test10 = month_range (31, 34) = [1,2,2,2]

val test11 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
*)