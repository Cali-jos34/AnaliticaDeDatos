SELECT CategoryID, CategoryName
FROM Northwind.dbo.Categories;

SELECT * FROM stage_northwind.dbo.categorias

SELECT CustomerID, CompanyName, isnull(City, 'SCI') as City, isnull (Region, 'SR') as Region,
isnull (PostalCode, 'SPC') as PostalCode, isnull (Country, 'SCO') as Country
FROM Northwind.dbo.Customers;

SELECT * FROM stage_northwind.dbo.clientes

SELECT C.CustomerID, E.EmployeeID, P.ProductID, O.OrderDate,
(OD.Quantity * OD.UnitPrice + (1 - OD.Discount)) AS Monto, OD.Quantity, OD.UnitPrice, OD.Discount
FROM Northwind.dbo.Customers AS C
INNER JOIN Northwind.dbo.Orders AS O
ON C.CustomerID = O.CustomerID
INNER JOIN Northwind.dbo.Employees AS E
ON E.EmployeeID = O.EmployeeID 
INNER JOIN Northwind.dbo.[Order Details] AS OD
ON O.OrderID = OD.OrderID
INNER JOIN Northwind.dbo.Products AS P
ON OD.ProductID = P.ProductID

SELECT * FROM
stage_northwind.dbo.ventas;

SELECT ProductID, ProductName, UnitPrice
FROM Northwind.dbo.Products;

SELECT * FROM
stage_northwind.dbo.producto;

SELECT SupplierID, CompanyName, City, isnull (Region, 'SR') AS Region, Country
FROM Northwind.dbo.Suppliers

SELECT * FROM
stage_northwind.dbo.proveedor;

SELECT * FROM
stage_northwind.dbo.Stage_Tiempo;




Truncate table [dbo].[categorias];

Truncate table [dbo].[clientes];

Truncate table [dbo].[empleados];

Truncate table [dbo].[producto];

Truncate table [dbo].[proveedor];

Truncate table [dbo].[ventas];

Truncate table [dbo].[Stage_Tiempo];


CREATE TABLE [dbo].[Stage_Tiempo](
	[Tiempo_Skey] [int] IDENTITY(1,1) NOT NULL,
	[Tiempo_FechaActual] [datetime] NOT NULL,
	[Tiempo_Anio] [int] NOT NULL,
	[Tiempo_Trimestre] [int] NOT NULL,
	[Tiempo_Mes] [int] NOT NULL,
	[Tiempo_Semana] [int] NOT NULL,
	[Tiempo_DiaDeAnio] [int] NOT NULL,
	[Tiempo_DiaDeMes] [int] NOT NULL
	);

	SELECT Distinct(OrderDate),
		YEAR(OrderDate) AS Anio,
		DATEPART(QUARTER,OrderDate) as Trimestre,
		DATEPART(MONTH,OrderDate) as Mes,
		DATEPART(WEEK,OrderDate) as Semana,
		DATEPART(DAYOFYEAR,OrderDate) as DiaDeAnio,
		DATEPART(DAY,OrderDate) as DiaDeMes,
		DATEPART(WEEKDAY,OrderDate-1) as DiaDeSemana
		FROM Northwind.dbo.Orders;


SELECT *
FROM producto;

SELECT *
FROM categorias;

SELECT *
FROM cliente;

SELECT *
FROM empleado;

SELECT *
FROM proovedor;

SELECT *
FROM ventas;

SELECT *
FROM stage_tiempo;


SELECT p.productoid,p.nombreproducto,c.nombrecategoria
FROM  stage_northwind.dbo.categorias as c 
left join datamart_northwind.dbo.producto as p 
on p.categoriaid = c.categoriaid;

select ProductID, ProductName, UnitPrice, c.CategoryID
from Northwind.dbo.Products as p
inner join Northwind.dbo.Categories as c
on p.CategoryID = c.CategoryID;


SELECT dc.cliente_Skey, de.empleado_Skey, dp.producto_Skey, 
dt.tiempo_Skey, (1) as norden, sv.ventasmonto, sv.ventasunidades, 
sv.ventaspreciounitario, sv.ventasdescuento
FROM stage_northwind.dbo.ventas as sv
inner join datamart_northwind.dbo.dim_cliente as dc
on sv.clienteid = dc.cliente_codigoBKey
inner join datamart_northwind.dbo.dim_empleado as de 
on sv.empleadocodigo = de.empleado_codigoBKey
inner join datamart_northwind.dbo.dim_producto as dp
on sv.productocodigo = dp.producto_CoidgoBKey
inner join datamart_northwind.dbo.dim_tiempo as dt 
on sv.ventasorden = dt.tiempo_fechaActual


select tiempo_fechaActual, tiempo_anio, tiempo_trimestre, tiempo_mes, tiempo_semana,
tiempo_diadeanio, tiempo_diademes, Tiempo_DiaDeSemana from stage_northwind.dbo.Stage_Tiempo;

ALTER TABLE stage_northwind.dbo.categorias
ALTER COLUMN nombrecategoria Varchar(15) NOT NULL;


select * from stage_northwind.dbo.producto

Truncate table [dbo].[empleados];

SELECT p.productoid,p.nombreproducto,c.nombrecategoria
FROM  stage_northwind.dbo.categorias as c 
right join stage_northwind.dbo.producto as p 
on p.categoriaid = c.categoriaid

SELECT dc.cliente_Skey, de.empleado_Skey, dp.producto_Skey, 
dt.tiempo_Skey, (1) as norden, sv.ventasmonto, sv.ventasunidades, 
sv.ventaspreciounitario, sv.ventasdescuento
FROM stage_northwind.dbo.ventas as sv
inner join datamart_northwind.dbo.dim_cliente as dc
on sv.clienteid = dc.cliente_codigoBKey
inner join datamart_northwind.dbo.dim_empleado as de 
on sv.empleadocodigo = de.empleado_codigoBKey
inner join datamart_northwind.dbo.dim_producto as dp
on sv.productocodigo = dp.producto_CodigoBKey
inner join datamart_northwind.dbo.dim_tiempo as dt 
on sv.ventasorden = dt.tiempo_fechaActual