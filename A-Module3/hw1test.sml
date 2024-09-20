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

(* Prob 6 *)
val test_get_nth_1 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"
val test_get_nth_2 = get_nth ([], 2) = ""

(* Prob 7 *)
val test_date_to_string_1 = date_to_string (2013, 6, 1) = "June 1, 2013"
val test_date_to_string_2 = date_to_string (1999, 2, 28) = "February 28, 1999"

(* Prob 8 *)
val test_number_before_reaching_sum_1 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3
val test_number_before_reaching_sum_2 = number_before_reaching_sum (1, [1,2,3,4,5]) = 0

val test_what_month_1 = what_month 70 = 3
val test_what_month_2 = what_month 5 = 1
val test_what_month_3 = what_month 360 = 12

val test_month_range_1 = month_range (31, 34) = [1,2,2,2]
val test_month_range_2 = month_range (31, 29) = []

val test_oldest_1 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
val test_oldest_2 = oldest([]) = NONE
val test_oldest_3 = oldest([(2012,2,28),(2011,3,31),(2011,4,28),(2012,2,28)]) = SOME (2011,3,31)

(* Helper function for Challenge Problem 11 *)
val test_contains_1 = contains([1,2,3,4,5], 3) = true
val test_contains_2 = contains([1,2,3,4,5], 6) = false
val test_contains_3 = contains([], 6) = false

(* Helper function for Challenge Problem 11 *)
val test_remove_duplicates_1 = remove_duplicates([1,2,3,4,5]) = [1,2,3,4,5]
val test_remove_duplicates_2 = remove_duplicates([1,2,2,3,4,5]) = [1,2,3,4,5]
val test_remove_duplicates_3 = remove_duplicates([1,2,3,4,5,5]) = [1,2,3,4,5]
val test_remove_duplicates_4 = remove_duplicates([]) = []

(* Challenge Problem 11 - Part 1*)
val test_number_in_months_challenge_1 = number_in_months_challenge ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4,2,2,3,4]) = 3
val test_number_in_months_challenge_2 = number_in_months_challenge ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[1,5,11]) = 0

(* Challenge Problem 11 - Part 2*)
val test_dates_in_months_challenge_1 = dates_in_months_challenge ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4,2,2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val test_dates_in_months_challenge_2 = dates_in_months_challenge ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[1,5,11]) = []

(* Helper function for Challenge Problem 12 *)
val test_is_leap_year_1 = is_leap_year(2000) = true
val test_is_leap_year_2 = is_leap_year(1) = false
val test_is_leap_year_3 = is_leap_year(4) = true
val test_is_leap_year_4 = is_leap_year(1000) = true
val test_is_leap_year_5 = is_leap_year(766) = false
val test_is_leap_year_7 = is_leap_year(2019) = false
val test_is_leap_year_8 = is_leap_year(2016) = true
val test_is_leap_year_1 = is_leap_year(1526) = false

(* Helper function for Challenge Problem 12 *)
val test_is_valid_month_1 = is_valid_month(1) = true
val test_is_valid_month_2 = is_valid_month(12) = true
val test_is_valid_month_3 = is_valid_month(13) = false
val test_is_valid_month_4 = is_valid_month(0) = false

(* Helper function for Challenge Problem 12 *)
val test_days_in_month_1 = days_in_month(2, 2012) = 29
val test_days_in_month_2 = days_in_month(2, 2013) = 28
val test_days_in_month_3 = days_in_month(4, 2013) = 30

(* Helper function for Challenge Problem 12 *)
val test_is_valid_day_1 = is_valid_day((2012,2,28)) = true
val test_is_valid_day_2 = is_valid_day((2013,2,29)) = false
val test_is_valid_day_3 = is_valid_day((2012,11,31)) = false
val test_is_valid_day_4 = is_valid_day((2012,8,32)) = false

(* Challenge Problem 12 *)
val test_reasonable_date_0 = reasonable_date((1,2,28)) = true
val test_reasonable_date_1 = reasonable_date((4,2,29)) = true
val test_reasonable_date_2 = reasonable_date((1501,2,29)) = false
val test_reasonable_date_3 = reasonable_date((2012,11,31)) = false
val test_reasonable_date_4 = reasonable_date((1900,8,32)) = false
val test_reasonable_date_5 = reasonable_date((2012,13,1)) = false
val test_reasonable_date_6 = reasonable_date((1001,7,0)) = false
