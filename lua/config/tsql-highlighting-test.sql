-- t-sql syntax highlighting test file
-- this file intentionally includes common sql server constructs.

use [testdatabase];
go

/* variables and declarations */
declare @userid int = 1;
declare @username nvarchar(100);
declare @createdat datetime2 = sysdatetime();
declare @isactive bit = 1;

set @username = N'joshua';

-- conditional logic
if @isactive = 1
begin
    print N'user is active';
end
else
begin
    print N'user is inactive';
end;
go

-- temporary tables
if object_id('tempdb..#users') is not null
    drop table #users;

create table #users (
    userid int identity(1,1) not null,
    username nvarchar(100) not null,
    email nvarchar(255) null,
    isactive bit not null default (1),
    createdat datetime2 not null default (sysdatetime()),
    constraint pk_users primary key (userid),
    constraint uq_users_email unique (email)
);

-- insert and output
insert into #users (username, email)
output inserted.userid, inserted.username
values
    (N'alice', N'alice@example.com'),
    (N'bob', N'bob@example.com');

-- select, joins, aliases, functions, case, and window functions
select
    u.userid,
    u.username,
    u.email,
    count(*) over (partition by u.isactive) activecount,
    row_number() over (
        partition by u.isactive
        order by u.createdat desc
    ) rownumber,
    case
        when u.isactive = 1 then N'active'
        else N'inactive'
    end status,
    isnull(nullif(u.email, N''), N'no email') displayemail
from #users u
where u.userid >= @userid
  and (u.username like N'a%' or u.email is not null)
order by u.createdat desc
offset 0 rows fetch next 10 rows only;

-- cte and recursive cte
with activeusers as (
    select userid, username
    from #users
    where isactive = 1
),

numberseries (
    select 1 number
    union all
    select number + 1
    from numberseries
    where number < 5
)

select au.username, ns.number
from activeusers au
cross join numberseries ns
option (maxrecursion 100);

-- stored procedure
create or alter procedure dbo.getuserbyid
    @userid int,
    @includeinactive bit = 0
as
begin
    set nocount on;

    begin try
        select userid, username, email, isactive, createdat
        from dbo.users
        where userid = @userid
          and (@includeinactive = 1 or isactive = 1);
    end try
    begin catch
        throw;
    end catch;
end;
go

-- scalar function
create or alter function dbo.getdisplayname
(
    @firstname nvarchar(100),
    @lastname nvarchar(100)
)
returns nvarchar(201)
as
begin
    return concat(@firstname, N' ', @lastname);
end;
go

-- view
create or alter view dbo.activeusersummary
as
select
    userid,
    username,
    email,
    createdat
from dbo.users
where isactive = 1;
go

-- trigger
create or alter trigger dbo.trg_users_update
on dbo.users
after update
as
begin
    set nocount on;

    update u
    set updatedat = sysdatetime()
    from dbo.users u
    inner join inserted i on u.userid = i.userid;
end;
go

-- transaction, locking hints, merge, and dynamic sql
begin transaction;

update u with (rowlock, updlock)
set isactive = 0
from dbo.users u
where u.userid = @userid;

if @@rowcount = 0
begin
    rollback transaction;
end
else
begin
    commit transaction;
end;
go

declare @sql nvarchar(max);
set @sql = N'select * from dbo.users where userid = @id;';
exec sys.sp_executesql
    @sql,
    N'@id int',
    @id = @userid;
go

-- json, xml, date functions, and common built-ins
select
    json_value(N'{"name":"joshua"}', '$.name') jsonname,
    json_query(N'{"roles":["admin","user"]}', '$.roles') jsonroles,
    dateadd(day, 7, getdate()) nextweek,
    datediff(day, '2026-01-01', getdate()) dayssincenewyear,
    cast(123.45 as decimal(10,2)) amount,
    try_convert(int, N'42') safenumber,
    newid() uniqueId,
    suser_sname() currentlogin;

-- cleanup
drop table if exists #users;
go
