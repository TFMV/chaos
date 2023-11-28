program discordian_calendar
    implicit none
    ! Variable declarations
    integer :: gregorianYear, gregorianMonth, gregorianDay
    integer :: discordianYear, dayOfYear, dayOfSeason, season, dayOfWeek
    character(len=10), dimension(5) :: seasons = (/ 'Chaos', 'Discord', 'Confusion', 'Bureaucracy', 'The Aftermath' /)
    character(len=12), dimension(5) :: daysOfWeek = (/ 'Sweetmorn', 'Boomtime', 'Pungenday', 'Prickle-Prickle', 'Setting Orange' /)

    ! Input the Gregorian date
    print *, 'Enter the Gregorian date (year, month, day):'
    read *, gregorianYear, gregorianMonth, gregorianDay

    ! Calculate the Discordian date
    call calculate_discordian_date(gregorianYear, gregorianMonth, gregorianDay, &
                                   discordianYear, dayOfYear, dayOfSeason, season, dayOfWeek)

    ! Output the Discordian date
    print *, 'Discordian Date:'
    print *, 'Year:', discordianYear
    print *, 'Season:', seasons(season)
    print *, 'Day:', dayOfSeason
    print *, 'Day of Week:', daysOfWeek(dayOfWeek)
end program discordian_calendar

subroutine calculate_discordian_date(gYear, gMonth, gDay, dYear, dayOfYear, dayOfSeason, season, dayOfWeek)
    implicit none
    ! Variable declarations
    integer, intent(in) :: gYear, gMonth, gDay
    integer, intent(out) :: dYear, dayOfYear, dayOfSeason, season, dayOfWeek
    integer :: totalDays

    ! Calculate total days since Discordian epoch
    ! (This is a simplified calculation; you'll need a proper Gregorian to Julian day number conversion)
    totalDays = (gYear - 1166) * 365 + gMonth * 30 + gDay

    ! Calculate the Discordian year and day of the year
    dYear = totalDays / 365
    dayOfYear = mod(totalDays, 365)

    ! Calculate the season and day of the season
    season = dayOfYear / 73 + 1
    dayOfSeason = mod(dayOfYear, 73) + 1

    ! Calculate the day of the week
    dayOfWeek = mod(dayOfYear, 5) + 1
end subroutine calculate_discordian_date
