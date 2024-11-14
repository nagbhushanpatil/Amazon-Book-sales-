Create Database AmazonBooks
use AmazonBooks
select * from Amazon
/* 1)Categorize the 550 books into fiction and non-fiction.*/
select name as fictionBooks from Amazon where Genre = 'Fiction'
select Name as NonFictionBooks from Amazon where Genre = 'Non Fiction'

/* 3.Query the top 50 best sellers and show the following: 
a.	Title of Book 
b.	Author
c.	Year
d.	Review */
select distinct top 50 name,Author,Year,Reviews 
from Amazon order by reviews desc

/* 4)Query the books which have a rating greater than 4 released 
in 2019 */
select distinct name from Amazon where User_Rating>4

/* 5)Query the books which have a rating greater than 4.8 released 
in 2019.Mark those as best books of 2019*/
select distinct Name as Best_Books2019 from Amazon
where User_Rating >=4.8

/* 6)Query the books which have greater than 10k reviews in 2018 */
select distinct name from Amazon where Reviews>10000

/* 7)Query to find Top authors with books,genre and year.
Top authors are those whose Books Rating is greater than 4.5 */
select distinct name,Author as Top_Authors,genre,Year
from Amazon where User_Rating>4.5

/* 8)Query to find Top 5 authors, no: of books they have written
in 2019.Top authors are those whose Books Rating
is greater than 4.5 */
select Top 5 Author,count(distinct name) as number_of_Books
from Amazon where User_Rating>4.5 and year = '2019'
group by Author order by number_of_Books desc 

/* 9)What are the ratings most of the users given to the bestsellers*/
select Round(user_rating,2) as Rating,count(name) as number_of_Books
from Amazon where user_rating>=4.5 group by User_Rating 
order by Rating desc

/* 10)List the books which got greater than 4.8 user rating year wise*/
select name,round(User_Rating,2) rating,Year from Amazon
where round(User_Rating,2)=4.9 group by Year,name,round(User_Rating,2)

/* 11) Name the Book with highest and lowest reviews */
select name,reviews from amazon where reviews=(select Max(reviews)
from Amazon) union all
select name,reviews from amazon where reviews =(select min(reviews)
from Amazon)

/* 12)List the top 10 books which got high number of reviews */
select Top 10 name,reviews from Amazon order by reviews desc

/* 13)List the top 10 books which got least number of reviews */
select Top 10 name,reviews from Amazon order by reviews

/* 14)Maximum priced books from 2011 to 2019 */
select Top 5 name,Max(price) as Max_Price,Year from Amazon 
group by name,Year order by Max_Price desc

/* 15)Minimum priced books from 2011 to 2019 */
select Top 10 name,Min(price) as Min_Price,Year from Amazon 
group by name,Year order by Min_Price 


