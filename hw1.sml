(* It evaluates to true if the first argument is a date that comes before the second argument. (If the two dates are the same, the result is false.) *)
fun is_older (date1 : int*int*int, date2 : int*int*int) = 
    let
        val (year1, month1, day1) = date1
        val (year2, month2, day2) = date2
    in
        (year1 < year2) orelse
        (year1 = year2 andalso month1 < month2) orelse
        (year1 = year2 andalso month1 = month2 andalso day1 < day2)
    end

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

    
