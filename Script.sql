create table if not exists inventary_products_supermarket (
	id_product INT primary key,
	product VARCHAR (250),
	category VARCHAR (100),
	subcategory VARCHAR (100),
	brand VARCHAR (100),
	sale_price numeric,
	market_price numeric,
	type VARCHAR (100),
	rating numeric,
	description TEXT
);
SET client_encoding = 'UTF8';
copy inventary_products_supermarket
from 'C:\Users\Public\Inventory_BigBasket_Products.csv'
with (format csv, header true, delimiter ';', ENCODING 'LATIN1');

select COUNT(*) 
from  inventary_products_supermarket
where rating is null;

select Category, COUNT (*) as total_productos
from inventary_products_supermarket
group by category 
order by total_productos desc;

select brand, ROUND(AVG(sale_price), 2) as precio_promedio,
count(*) as total_products
from inventary_products_supermarket
group by brand
order by precio_promedio desc
limit 20;

select product,
market_price,
sale_price,
(market_price - sale_price) as ahorro
from inventary_products_supermarket
where market_price > sale_price
limit 20;

select product, brand, rating
from inventary_products_supermarket
where rating >= 4.5
order by rating desc;

select product, brand, rating, category
from inventary_products_supermarket
where rating <= 1.5
order by rating desc
limit 10;

select brand, COUNT(*) as cantidad
from inventary_products_supermarket
where category = 'Beauty & Hygiene'
group by brand
order by cantidad desc
limit 10;

select brand, COUNT (*) as total_sku,
ROUND (AVG(market_price - sale_price), 2) as descuento_promedio_actual,
ROUND (AVG(rating), 1) as reputacion_marca
from inventary_products_supermarket
where brand in ('INATUR', 'Nike', 'BIOTIQUE', 'Aroma Magic', 'Himalaya', 'Colgate', 'Loreal paris', 'Dabur', 'StBotanica', 'Organic Harvest')
group by brand 
order by total_sku desc;

select brand, COUNT(*) as cantidad
from inventary_products_supermarket
where category = 'Eggs. Meat & Fish'
group by brand
order by cantidad desc
limit 10;

select brand, COUNT (*) as total_sku,
ROUND (AVG(market_price - sale_price), 2) as descuento_promedio_actual,
ROUND (AVG(rating), 1) as reputacion_marca
from inventary_products_supermarket
where brand in ('Fresho', 'Fresho Signature', 'La carne', 'Golden prize', 'Meatzza', 'Gadre', 'H.S Dry Fish', 'Seastar', 'QuickeeS', 'Ifb')
group by brand 
order by total_sku desc;

select brand, COUNT(*) as cantidad
from inventary_products_supermarket
where category = 'Fruits & Vegetables'
group by brand
order by cantidad desc
limit 10;

select brand, COUNT (*) as total_sku,
ROUND (AVG(market_price - sale_price), 2) as descuento_promedio_actual,
ROUND (AVG(rating), 1) as reputacion_marca
from inventary_products_supermarket
where brand in ('Fresho', 'Supa Corn', 'Tadaa', 'RoseBazaar', 'bb Combo')
group by brand 
order by total_sku desc;

select brand, COUNT (*) as cantidad
from inventary_products_supermarket
where category = 'Baby Care'
group by brand
order by cantidad desc
limit 10;

select brand, COUNT (*) as total_sku,
ROUND (AVG(market_price - sale_price), 2) as descuento_promedio_actual,
ROUND (AVG(rating), 1) as reputacion_marca
from inventary_products_supermarket
where brand in ('Huggies', 'Pampers', 'Mee Mee', 'Himalaya', 'The Moms Co', 'Mamaearth', 'Pigeon Baby', 'Himalaya Baby', 'Johnsons baby', 'Chicco')
group by brand
order by total_sku desc;

select brand, COUNT (*) as cantidad
from inventary_products_supermarket
where category = 'Bakery. Cakes & Dairy'
group by brand 
order by cantidad desc
limit 10;

select brand, COUNT (*) as total_sku,
ROUND (AVG(market_price - sale_price), 2) as descuento_promedio_actual,
ROUND (AVG(rating), 1) as reputacion_marca
from inventary_products_supermarket
where brand in ('Amul', 'Fresho Signature', 'Britannia', 'The Bakers Dozen', 'Milky Mist', 'BHealthy', 'Tasties', 'Nandini', 'Go', 'So Good')
group by category, brand
order by total_sku desc;

select brand, COUNT (*) as cantidad
from inventary_products_supermarket
where category = 'Beverages'
group by brand
order by cantidad desc
limit 10;

select brand, COUNT (*) as total_sku,
ROUND (AVG(market_price - sale_price), 2) as descuento_promedio_actual,
ROUND (AVG(rating), 1) as reputacion_marca
from inventary_products_supermarket
where brand in ('VAHDAM', 'Teamonk', 'Real', 'Kapiva Ayurveda', '18 Herbs', 'Paper Boat', 'Nescafe', 'Tropicana', 'Typhoo', 'Octavius')
group by category, brand
order by total_sku desc;

select brand, COUNT (*) as cantidad
from inventary_products_supermarket
where category = 'Cleaning & Household'
group by brand
order by cantidad
limit 10;

select brand, COUNT (*) as total_sku,
ROUND (AVG(market_price - sale_price), 2) as descuento_promedio_actual,
ROUND (AVG(rating), 1) as reputacion_marca
from inventary_products_supermarket
where brand in ('Solo', 'Febreze', 'Ego of Paris', 'Homey Home Fresh', 'Panasonic', 'Clean & Fresh', 'Post-It', 'GOPURAM', 'Nimeasy')
group by category, brand
order by total_sku desc;

select brand, COUNT (*) as cantidad
from inventary_products_supermarket
where category = 'Foodgrains. Oil & Masala'
group by brand
order by cantidad
limit 10;

select brand, COUNT (*) as total_sku,
ROUND (AVG(market_price - sale_price), 2) as descuento_promedio_actual,
ROUND (AVG(rating), 1) as reputacion_marca
from inventary_products_supermarket
where brand in ('Ogara', 'Orino',' DIVING DUCK', 'Satvik Organic', 'The Earth Reserve', 'Tree Grab', 'Sri Sri Tattva', 'Orysa', 'Nature Fresh', 'Vivatta')
group by category, brand
order by total_sku desc;

select brand, COUNT (*) as cantidad
from inventary_products_supermarket
where category = 'Snacks & Branded Foods'
group by brand
order by cantidad
limit 10;

select brand, COUNT (*) as total_sku,
ROUND (AVG(market_price - sale_price), 2) as descuento_promedio_actual,
ROUND (AVG(rating), 1) as reputacion_marca
from inventary_products_supermarket
where brand in ('Healthy Gut', 'DIVING DUCK', 'Bhikhaaram Chandmal', 'Lawrence Mills', 'Meatzza', 'Kopiko', 'Fazlani', 'bb Popular', 'Turn Organic' , 'Bon curry')
group by category, brand
order by total_sku desc;

select brand, COUNT (*) as cantidad
from inventary_products_supermarket
where category = 'Kitchen. Garden & Pets'
group by brand
order by cantidad
limit 10;

select brand, COUNT (*) as total_sku,
ROUND (AVG(market_price - sale_price), 2) as descuento_promedio_actual,
ROUND (AVG(rating), 1) as reputacion_marca
from inventary_products_supermarket
where brand in ('Cerbiatto', 'Kittos', 'Green apple', 'Gnawlers', 'Leo Natura', 'Cosmo', 'NSH', 'NNF', 'Wood & Kemp', 'Companian Pets')
group by category, brand
order by total_sku desc;

select brand, COUNT (*) as cantidad
from inventary_products_supermarket
where category = 'Gourmet & World Food'
group by brand
order by cantidad
limit 10;

select brand, COUNT (*) as total_sku,
ROUND (AVG(market_price - sale_price), 2) as descuento_promedio_actual,
ROUND (AVG(rating), 1) as reputacion_marca
from inventary_products_supermarket
where brand in ('Van Pur', 'Fusen', 'Ice Berg', 'Rodolfi', 'The Butternut Co.', 'Gullon', 'Sri Sri Tattva', 'Eco Pack', 'The Bridge Bio', 'Vochelle')
group by category, brand
order by total_sku desc;

alter table inventary_products_supermarket 
add column stock_quantity INT default 0;

update inventary_products_supermarket
set stock_quantity = FLOOR (RANDOM () * (500 - 200 + 1) +200)
where category = 'Beauty & Hygiene';

UPDATE inventary_products_supermarket
SET stock_quantity = FLOOR(RANDOM() * (300 - 50 + 1) + 50)
WHERE category = 'Gourmet & World Food';

UPDATE inventary_products_supermarket
SET stock_quantity = FLOOR(RANDOM() * (400 - 100 + 1) + 100)
WHERE category = 'Kitchen. Garden & Pets';

UPDATE inventary_products_supermarket
SET stock_quantity = FLOOR(RANDOM() * (500 - 150 + 1) + 150)
WHERE category = 'Snacks & Branded Foods';

UPDATE inventary_products_supermarket
SET stock_quantity = FLOOR(RANDOM() * (350 - 80 + 1) + 80)
WHERE category = 'Foodgrains. Oil & Masala';

UPDATE inventary_products_supermarket
SET stock_quantity = FLOOR(RANDOM() * (400 - 100 + 1) + 100)
WHERE category = 'Cleaning & Household';

UPDATE inventary_products_supermarket
SET stock_quantity = FLOOR(RANDOM() * (600 - 200 + 1) + 200)
WHERE category = 'Beverages';

UPDATE inventary_products_supermarket
SET stock_quantity = FLOOR(RANDOM() * (250 - 50 + 1) + 50)
WHERE category = 'Bakery. Cakes & Dairy';

UPDATE inventary_products_supermarket
SET stock_quantity = FLOOR(RANDOM() * (300 - 80 + 1) + 80)
WHERE category = 'Baby Care';

UPDATE inventary_products_supermarket
SET stock_quantity = FLOOR(RANDOM() * (150 - 20 + 1) + 20)
WHERE category = 'Fruits & Vegetables';

UPDATE inventary_products_supermarket
SET stock_quantity = FLOOR(RANDOM() * (40 - 20 + 1) + 20)
WHERE category = 'Eggs. Meat & Fish';

select SUM(stock_quantity) as stock_total
from inventary_products_supermarket;

select round (SUM(sale_price * stock_quantity), 2) as valor_inventario
from inventary_products_supermarket;

select 
	id_product,
	product,
	category,
	stock_quantity,
	sale_price,
ROUND (stock_quantity * sale_price, 2) as valor_unitario
from inventary_products_supermarket
order by valor_unitario desc
limit 20;

with calculo_valor as (
select 
id_product,
product,
category, 
stock_quantity,
sale_price,
ROUND ((stock_quantity * sale_price),2) as valor_total_inventario
from inventary_products_supermarket
where stock_quantity is not null and sale_price is not null
),
with acumulados as (
select 
	*,
	SUM(valor_total_inventario) over(
	order by valor_total_inventario desc
	) as valor_acumulado,
	SUM(valor_total_inventario) over () as valor_total_global
	from calculo_valor
	),
porcentajes as (
	select
		*,
		ROUND(((valor_acumulado / nullif (valor_total_global, 0)) * 100), 2) as pct_acumulado
		from acumulados
	)
select
	id_product,
	product,
	category,
	stock_quantity,
	sale_price,
	valor_total_inventario,
	pct_acumulado,
	case
 		when pct_acumulado <= 80.00 then 'A (Inversion alta)'
 		when pct_acumulado <= 95.00 then 'B (Inversion media)'  
 		else 'C (Inversion baja)'
 end as clasificacion_abc
 from porcentajes
 order by valor_total_inventario DESC;
 
alter table inventary_products_supermarket
add column clasificacion_abc varchar(20)

with calculo_valor as (
select 
id_product,
stock_quantity * sale_price as valor_total_inventario
from inventary_products_supermarket
where stock_quantity is not null and sale_price is not null
),
acumulados as (
select 
id_product,
	SUM(valor_total_inventario) over(
	order by valor_total_inventario desc
	) as valor_acumulado,
	SUM(valor_total_inventario) over () as valor_total_global
	from calculo_valor
),
porcentajes as (
	select
		id_product,
		ROUND(((valor_acumulado / nullif (valor_total_global, 0)) * 100), 2) as pct_acumulado
		from acumulados
),
calculo_abc as (
select 
	id_product,
	case
 		when pct_acumulado <= 80.00 then 'A (Inversion alta)'
 		when pct_acumulado <= 95.00 then 'B (Inversion media)'  
 		else 'C (Inversion baja)'
end as clasificacion_abc
from porcentajes
)
update inventary_products_supermarket i
set clasificacion_abc = r.clasificacion_abc
from calculo_abc r
where i.id_product = r.id_product;

select 
	category,
	ROUND(AVG(rating), 2) as rating_promedio,
	COUNT (*) as total_productos
	from inventary_products_supermarket
	group by category
	order by rating_promedio desc;

select
	category, 
	COUNT (*) as productos_sobrestock
from inventary_products_supermarket
where stock_quantity > (
		select AVG(stock_quantity) * 1.5
		from inventary_products_supermarket
)
group by category
order by productos_sobrestock desc;

	select 
		clasificacion_abc,
		SUM(sale_price * stock_quantity) as valor_total_categoria,
		cast (ROUND (SUM(sale_price * stock_quantity)* 100 / SUM(SUM(sale_price * stock_quantity)) over(), 2) as VARCHAR) || '%' as porcentaje_representativo
		from inventary_products_supermarket
		group by clasificacion_abc
		order by valor_total_categoria desc;
	