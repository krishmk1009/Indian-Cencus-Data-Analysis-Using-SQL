Create database Census;
use Census;
show tables;
select * from data1;
select * from data2;

-- --------------------------------------------------------

-- dataset for jharkhand and bihar
select * from data1
where State in ('Bihar' , 'Jharkhand');

-- ----------------------------------------------------

-- total population
select sum(Population) as totalSum from data2;

-- -- ---------------------------------------------------------

-- avg growth rate 
select avg(Growth) as 'AvgGrowth(%)' from data1;

-- -------------------------------------------------------

-- avg growth rate for a particular state
select avg(Growth) as 'AvgGrowth (%) for state' from data1
where State = 'Maharashtra';

-- -----------------------------------------------------------------------

-- avg growth for particular 2 state with state columns and growth rate.
select State , avg(Growth) from data1 
Where State in ('Bihar' , 'Maharashtra')
group by state;

-- --------------------------------------------------------------------------

-- avg growth for all states with state name and avg growth columns
select state, avg(Growth) as 'AvgGrowth (%) for state' from data1
 group by state;

-- ----------------------------------------------------------------------------------

-- Q. avg sex ratio for all state with state name and ration column
select state , round(avg(sex_ratio),0) as 'avg_sex_ratio' from data1
 group by state;
 
 -- ---------------------------------------------------------------------------------------------------

-- -- Q. avg sex ratio for all state with state name and ration column in descending order
select state , round(avg(sex_ratio),0) as 'avg_sex_ratio' from data1
 group by state
 order by sex_ratio desc;
 
 -- -------------------------------------------------------------------------------------------------
 
 -- Q. avg literacy rate in descending order;
 select state , round(avg(literacy),0) as 'literacy rate' from data1
 group by state
 order by literacy desc;
 
 -- -----------------------------------------------------------

 
 -- Q avg literacy having greter than 90 
 select state , round(avg(literacy),0) as 'literacy rate' from data1
 group by state
 having round(avg(literacy),0)>90
 order by literacy desc;
 
 -- Note : WHERE clause is used to filter out the info 
 
 -- ----------------------------------------------------
 
 -- Q Top 3 state with highest growth rate
 select  state, avg(growth) as growth_rate from data1
 group by state
 order by avg(growth) desc
limit 3;

-- --------------------------------------------------------------
-- Q Botomm 3 state with highest growth rate
 select  state, avg(growth) as growth_rate from data1
 group by state
 order by avg(growth) 
limit 3;

-- --------------------------------------------------------------
-- Q Top and bottom 3 states in litercy ration

drop table if exists topState;
create table topState(
state varchar(255),
literacy_ratio float

);

INSERT into topState
select  state, round(avg(literacy),0) as literacy_rate from data1
group by state
order by round(avg(literacy),0) desc;

select * from topState;

drop table if exists bottomState;
create table bottomState(
state varchar(255),
literacy_ratio float
);


insert into bottomState
select  state, round(avg(literacy),0) as literacy_rate from data1
group by state
order by round(avg(literacy),0) ;

select * from bottomState;

select * from (select  * from topState order by literacy_ratio desc
limit 3) a 
union
select * from (select  * from bottomState order by literacy_ratio 
limit 3) b ;

-- ----------------------------------------------------------------------------

-- Q . state name starts with a 

select distinct state from data1 
where lower(state) like 'a%';

-- ----------------------------------------------------------------------------


-- Q . state name starts with a or b sorted in alphabetical

select distinct state from data1 
where lower(state) like 'a%' OR lower(state) like 'm%'
order by state;

-- ----------------------------------------------------------------------------


