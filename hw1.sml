(* Problem 1 *)
fun is_older (date1 : int*int*int, date2 : int*int*int) =             
        (#1 date1 < #1 date2) orelse
        (#1 date1 = #1 date2 andalso #2 date1 < #2 date2) orelse
        (#1 date1 = #1 date2 andalso #2 date1 = #2 date2 andalso #3 date1 < #3 date2)
    
(* Problem 2 *)
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

(* Problem 3 *)
fun number_in_months(dates : (int*int*int) list, months : int list) =
    if null months
    then 0
    else        
        number_in_month(dates, hd months) + number_in_months(dates, tl months)

(* Problem 4 *)
fun dates_in_month(dates : (int*int*int) list, monthNum : int) =
    if null dates
    then []
    else 
        if #2 (hd dates) = monthNum
        then hd dates :: dates_in_month(tl dates, monthNum)
        else dates_in_month(tl dates, monthNum)

(* Problem 5 *)    
fun dates_in_months(dates : (int*int*int) list, months : int list) =
    if null dates orelse null months
    then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)        

(* Problem 6 *)
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

(* Problem 7 *)
fun date_to_string(year : int, month : int, day : int) = 
    get_nth(["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"], month) ^ " " ^ Int.toString(day) ^ ", " ^ Int.toString(year)

(* Problem 8 *)
fun number_before_reaching_sum(sum : int, numbers : int list) =
    let fun recurse(tot : int, counter : int, xs : int list) =        
        if tot < sum 
        then recurse(tot + hd xs, counter + 1, tl xs)
        else counter - 1        
    in
        recurse(0,0,numbers)
    end

(* Problem 9 *)
fun what_month(month : int) = 
    let val days_in_month = [31,28,31,30,31,30,31,31,30,31,30,31]
    in
        number_before_reaching_sum(month,days_in_month) + 1
    end

(* Problem 10 *)
fun month_range(day1 : int, day2 : int) = 
    let fun recurse(day:int) = 
        if day > day2
        then []    
        else what_month(day) :: recurse(day+1)
    in
        recurse(day1)
    end

(* Problem 11 *)
fun oldest(dates : (int*int*int) list) =
    if null dates
    then NONE
    else if null (tl dates)
    then SOME (hd dates)
    else         
        let val odst = oldest(tl dates)
        in
            if isSome odst andalso is_older(hd dates, valOf odst)            
            then SOME (hd dates)
            else odst
        end

(* Helper function for Challenge Problem 11. Checks if a list contains a given element *)
fun contains(xs: int list, y: int) = 
    if null xs
    then false
    else if hd xs = y
    then true
    else contains(tl xs, y)

(* Helper function for Challenge Problem 11. Removes duplicates from a list of integers *)
fun remove_duplicates(xs : int list) = 
    if null xs
    then []
    else if null (tl xs)
    then hd xs :: []
    else         
        if contains(tl xs, hd xs)
        then remove_duplicates(tl xs)
        else hd xs :: remove_duplicates(tl xs)        
        
(* Challenge problem 11 - part 1*)
fun number_in_months_challenge(dates : (int*int*int) list, months : int list) =
    if null months
    then 0
    else 
        number_in_months(dates, remove_duplicates months)

(* Challenge problem 11 - part 2*)
fun dates_in_months_challenge(dates : (int*int*int) list, months : int list) =
    dates_in_months(dates, remove_duplicates months)

(* Helper function for Challenge Problem 12. Checks if a year is a leap year *)
fun is_leap_year(year : int) =
    (year mod 4 = 0 andalso year mod 100 <> 0) orelse (year mod 400 = 0)

(* Helper function for Challenge Problem 12. Checks if a month is valid *)
fun is_valid_month(month : int) =
    month >= 1 andalso month <= 12

(* Helper function for Challenge Problem 12. Returns the number of days in a given month *)
fun days_in_month(month : int, year : int) =
    if month < 1 orelse month > 12
    then 0
    else if month = 2 andalso is_leap_year(year)
    then 29
    else if month = 2
    then 28
    else if month = 4 orelse month = 6 orelse month = 9 orelse month = 11
    then 30
    else 31

(* Helper function for Challenge Problem 12. Checks if a day is valid for a given month *)
fun is_valid_day(date : int*int*int) =
    let 
        val day = #3 date
        val month = #2 date
        val year = #1 date
    in
        day >= 1 andalso day <= days_in_month(month, year)
    end

(* Challenge Problem 12.*)
fun reasonable_date(date : int*int*int) =
    let 
        val day = #3 date
        val month = #2 date
        val year = #1 date
    in
        year > 0 andalso is_valid_month(month) andalso is_valid_day(date)
    end
    
    
