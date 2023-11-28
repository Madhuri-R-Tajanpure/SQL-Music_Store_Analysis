
/* Q1: Who is the senior most employee based on job title? */

select * from  employee

select top 1 first_name ,title from employee
order by levels desc

/* Q2: Which countries have the most Invoices? */

select * from invoice

select top 1 count(invoice_id) as c,billing_country from invoice
group by billing_country order by c desc

/* Q3: What are top 3 values of total invoice? */

select top 3 total from invoice order by total desc

/* Q4: Which city has the best customers? We would like to throw a promotional Music Festival 
  in the city we made the most money. 
  Write a query that returns one city that has the highest sum of invoice totals. 
  Return both the city name & sum of all invoice totals */

  select * from invoice

  select top 1 billing_city,sum(total)as T from invoice
 group by billing_city order by T desc

 /* Q5: Who is the best customer? The customer who has spent the most money will be 
 declared the best customer. Write a query that returns the person who has spent the most money.*/

 select * from customer
  select * from invoice

 select top 1 customer.customer_id,customer.first_name,sum(invoice.total)as T
 from customer inner join invoice 
 on customer.customer_id = invoice.customer_id
 group by customer.customer_id,customer.first_name
 order by T desc

 /* Q6: Write query to return the email, first name, last name, & Genre of all Rock Music listeners.
Return your list ordered alphabetically by email starting with A. */

select * from genre
select * from customer

select distinct customer.email,customer.first_name,customer.last_name,genre.name
from customer 
join invoice on customer.customer_id= invoice.invoice_id
join invoice_line on invoice_line.invoice_id = invoice.invoice_id
join track on track.track_id = invoice_line.invoice_id
join genre on genre.genre_id = track.genre_id
where genre.name like 'Rock'
order by email

/* Q7: Let's invite the artists who have written the most rock music in our dataset.
Write a query that returns the Artist name and total track count of the top 10 rock bands. */

select * from artist
select * from genre
select * from track

select top 10 artist.name as Artist_Name ,COUNT(track.track_id)as Total
from artist 
inner join album on artist.artist_id = album.artist_id
inner join track on track.album_id = album.album_id
inner join genre on genre.genre_id = track.genre_id
where genre.name like 'Rock'
group by artist.name,genre.name
order by Total desc

/* Q8: Return all the track names that have a song length longer than the average song length.
Return the Name and Milliseconds for each track. 
Order by the song length with the longest songs listed first. */

select * from track

select name as Track_name, milliseconds as Song_Length  from track
where milliseconds > (select avg(milliseconds) from track)
order by Song_Length desc

