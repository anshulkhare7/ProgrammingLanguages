(* It evaluates to true if the first argument is a date that comes before the second argument. (If the two dates are the same, the result is false.) *)
fun is_older (date1 : int*int*int, date2 : int*int*int) =             
        (#1 date1 < #1 date2) orelse
        (#1 date1 = #1 date2 andalso #2 date1 < #2 date2) orelse
        (#1 date1 = #1 date2 andalso #2 date1 = #2 date2 andalso #3 date1 < #3 date2)
    

fun number_in_month(dates : (int*int*int) list, mon : int) =    
    if null dates
    then 0
    else
        let 
            val num_month = number_in_month(tl dates, mon) 
            val this_month = #2 (hd dates)
        in
            if  this_month = mon
            then 1 + num_month
            else num_month
        end

fun number_in_months(dates : (int*int*int) list, months : int list) =
    if null months
    then 0
    else        
        number_in_month(dates, hd months) + number_in_months(dates, tl months)

(* Takes a list of dates and a month (i.e., an int) and returns a list holding the dates from the argument list of dates that are in the month. The returned list should contain dates in the order they were originally given. *)
fun dates_in_month(dates : (int*int*int) list, monthNum : int) =
    if null dates
    then []
    else 
        if #2 (hd dates) = monthNum
        then hd dates :: dates_in_month(tl dates, monthNum)
        else dates_in_month(tl dates, monthNum)
    
fun dates_in_months(dates : (int*int*int) list, months : int list) =
    if null dates orelse null months
    then []
    else 
        let val dim = dates_in_month(dates, hd months) 
        in 
            dim @ dates_in_months(dates, tl months)
        end

fun get_nth(strings : string list, nth : int) =
    let fun recurse(ctr:int, mystrings: string list) =         
        if null mystrings
        then ""
        else 
            if ctr = nth 
            then hd mystrings        
            else recurse(ctr+1, tl mystrings)
    in        
        recurse(1, strings)
    end