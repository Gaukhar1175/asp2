/*
Задание 1
*/
/*Пункт 1*/ /*Пункт 2*/
ALTER TABLE Servicebook /* что бы получилась нормализованная структура данных, поменяла на схему "снежинки"
удаляя 2 foreign key Servicebook и Rentbook */
DROP CONSTRAINT FK__ServiceBo__Detai__300424B4;

ALTER TABLE Servicebook DROP COLUMN DetailId;--удалить пустой столбец, который нынешне не играет роль связки

ALTER TABLE Rentbook
DROP CONSTRAINT FK__RentBook__StaffI__32E0915F;

ALTER TABLE Rentbook DROP COLUMN StaffId;--удалить пустой столбец, который нынешне не играет роль связки

ALTER TABLE Servicebook--дабы оптимизировать эту таблицу, следует добавить индексацию 
ADD Id int IDENTITY(1,1) NOT NULL ;

ALTER TABLE Servicebook ADD PRIMARY KEY (Id);--и сделать его primary key

ALTER TABLE Rentbook ADD PRIMARY KEY (Id);/*что бы и в этой таблице была своя индексация,
следует существующий столбец сохранить как primary key*/

/*Пункт 4*/
select [Measures].[Paid] on columns,
[BicycleId].Members on rows
from [Rentbook]
where [Date].[Date].&[01-01-2004]

SELECT [Measures].[Time] ON COLUMNS,
[Paid].[0] ON ROWS
FROM [RentBook]
WHERE [Country].[USA]

select [Measures].[Price] on columns,
[StaffId].Members on rows
from [ServiceBook]
where [Date].[Date].&[01-07-2004]

SELECT [Measures].[RentPrice] ON COLUMNS,
[BicycleId].Members ON ROWS
FROM [Bycicle]
WHERE [Type].[Ua]

SELECT [Measures].[RentPrice] ON COLUMNS,
[BycicleId].Members ON ROWS
FROM [Bycicle]
WHERE [Brand].[Aa]
