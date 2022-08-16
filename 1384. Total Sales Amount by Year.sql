create table product (
	product_id int,
    product_name varchar(20)
);

insert into product values
(1,'LC Phone'),
(2,'LC T-shirt'),
(3,'LC Keychain');

create table sales (
	product_id int,
    period_start date,
    period_end date,
    average_daily_sales int
);

insert into sales values
(1,str_to_date('2019-01-25','%Y-%m-%d'),str_to_date('2019-02-28','%Y-%m-%d'),100),
(2,str_to_date('2018-12-01','%Y-%m-%d'),str_to_date('2020-01-01','%Y-%m-%d'),10),
(3,str_to_date('2019-12-01','%Y-%m-%d'),str_to_date('2020-01-31','%Y-%m-%d'),1);


#Solution:
       select s.product_id, product_name, '2018' as report_year, 
               case when year(period_end) = 2018 then average_daily_sales * (dayofyear(period_end)-dayofyear(period_start) + 1)
                    when year(period_end) >= 2019 then average_daily_sales * (365 - dayofyear(period_start) + 1)
                    end as total_amount
        from Sales s left join Product p on s.product_id = p.product_id
        where year(period_start) = 2018
        UNION ALL
        select s.product_id, product_name, '2019' as report_year, 
				case when year(period_start) = 2019 and year(period_end) = 2019 then average_daily_sales*(dayofyear(period_end)-dayofyear(period_start)+1)
					 when year(period_start) = 2019 and year(period_end) > 2019 then average_daily_sales*(365-dayofyear(period_start)+1)
					 when year(period_start) < 2019 and year(period_end) = 2019 then average_daily_sales*(dayofyear(period_end))
                     when year(period_start) < 2019 and year(period_end) > 2019 then average_daily_sales*365
                     end as total_amount
        from Sales s left join Product p on s.product_id = p.product_id
        where year(period_end) > 2018 and year(period_start) < 2020
        UNION ALL
        select s.product_id, product_name, '2020' as report_year, 
				case when year(period_start) = 2020 then average_daily_sales*(dayofyear(period_end)-dayofyear(period_start)+1)
					 when year(period_start) < 2020 then average_daily_sales*(dayofyear(period_end))
                     end as total_amount
        from Sales s left join Product p on s.product_id = p.product_id
        where year(period_end) = 2020
	    order by product_id, report_year
        