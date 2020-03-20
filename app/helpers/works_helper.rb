module WorksHelper
    def year_month_date(d_date)
        r_date = d_date.strftime("%Y-%m-%d")
        return r_date
    end
end
