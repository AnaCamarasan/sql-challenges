use movielens;

-- 1. List the titles and release dates of movies released between 1983-1993 in reverse chronological order.
select title, release_date from movies
where release_date between '1983-01-01' and '1993-12-31'
order by release_date desc;

-- 2. Without using LIMIT, list the titles of the movies with the lowest average rating.
select avg(rating), movies.title from ratings
join movies on movies.id = ratings.movie_id
group by movie_id
having avg(ratings.rating) = (
	select min(avg_rating)
    from (
		select avg(ratings.rating) as avg_rating
        from ratings
        group by ratings.movie_id
    ) as subquery
);

-- 3. List the unique records for Sci-Fi movies where male 24-year-old students have given 5-star ratings.
select distinct title from movies
join genres_movies on movies.id = genres_movies.movie_id
join genres on genres_movies.genre_id = genres.id
join ratings on movies.id = ratings.movie_id
join users on ratings.user_id = users.id
join occupations on users.occupation_id = occupations.id
where genres.name = 'Sci-Fi' and users.gender = 'M' and users.age = 24 and occupations.name = 'Student' and ratings.rating = 5 ;

-- 4. List the unique titles of each of the movies released on the most popular release day.
select distinct title from movies
where release_date = (
	select release_date
	from (
		select release_date, count(release_date) as count from movies
		group by release_date
		order by count desc
		limit 1
	) as most_popular
);

-- 5. Find the total number of movies in each genre; list the results in ascending numeric order.
select genres.name, count(movies.id) as total_movies from genres
join genres_movies on genres.id = genres_movies.genre_id
join movies on genres_movies.movie_id = movies.id
group by genres.name
order by total_movies asc;


