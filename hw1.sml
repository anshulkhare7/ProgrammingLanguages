(* It evaluates to true if the first argument is a date that comes before the second argument. (If the two dates are the same, the result is false.) *)
fun is_before(day1 : int*int*int, day2 : int*int*int, pos : int) =
    if pos = 1
    then #1 day1 < #1 day2
    else
        if pos = 2
        then #2 day1 < #2 day2
        else 
            if pos = 3
            then #3 day1 < #3 day2
            else false

fun is_after(day1 : int*int*int, day2 : int*int*int, pos : int) =
    if pos = 1
    then #1 day1 > #1 day2
    else
        if pos = 2
        then #2 day1 > #2 day2
        else 
            if pos = 3
            then #3 day1 > #3 day2
            else false

fun is_year_before (day1 : int*int*int, day2 : int*int*int) = 
    is_before(day1, day2, 1)

fun is_year_after (day1 : int*int*int, day2 : int*int*int) = 
    is_after(day1, day2, 1)

fun is_month_before (day1 : int*int*int, day2 : int*int*int) = 
    is_before(day1, day2, 2)

fun is_month_after (day1 : int*int*int, day2 : int*int*int) = 
    is_after(day1, day2, 2)

fun is_day_before (day1 : int*int*int, day2 : int*int*int) = 
    is_before(day1, day2, 3)


fun is_older (day1 : int*int*int, day2 : int*int*int) = 
    if is_year_before(day1, day2)
    then true
    else 
        if is_year_after(day1, day2)
        then false
        else
            if is_month_before(day1, day2)
            then true
            else
                if is_month_after(day1, day2)
                then false
                else 
                    is_day_before(day1, day2)
                    
fun number_in_month(dates : (int*int*int) list, mon : int) =
    if null dates
    then 0
    else
        let val num_month = number_in_month(tl dates, mon) 
        in
            if #2 (hd dates) = mon
            then 1 + num_month
            else num_month
        end

fun number_in_months(dates : (int*int*int) list, months : int list) =
    if null months
    then 0
    else        
        number_in_month(dates, hd months) + number_in_months(dates, tl months)

    
