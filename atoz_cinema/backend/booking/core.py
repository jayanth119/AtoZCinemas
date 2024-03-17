import requests
import bs4
import json

headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',
}

class BookingMovies:
    def BookingResponse(self):
        url = "https://www.imdb.com/showtimes/"
        res = requests.get(url, headers=headers)
        res.raise_for_status()
        html = res.text
        soup = bs4.BeautifulSoup(html, "html.parser")    

        # Find all img tags
        elements = soup.find_all("img")       
        # Find all anchor tags with class 'title'
        anchor_tags = soup.find_all('a')        
        # Create a set to keep track of encountered titles
        titles_set = set()
        movies_list = []
        c = 0 
        # Loop through each element and extract src and title attributes
        for element, anchor in zip(elements, anchor_tags):
            if c == 3:  # Limiting to 3 movies for demonstration purposes
                break 

            src = element.get('src')
            title = element.get('title')
            href = anchor.get('href')

            # Check if src, title, and href are not None
            if src and title and href:
                # Check if title is not already present in the set
                if title not in titles_set and href.startswith("/showtimes/title/"):
                    href = href[10:]  # Removing "/showtimes/title/" part from the href
                    # Create a dictionary for movie information
                    if("?" in href):
                        i = href.index("?")
                        href = href[0:i]
                    movie_dict = {
                        "Title": title,
                        "Image": src,
                        "IMDb_link": href
                    }
                    
                    # Fetch movie details
                    other = self.moviedetail("https://www.imdb.com" + href)
                    movie_dict.update({
                        "Rating": other[0],
                        "Cast": other[1],
                        "Description": other[2],
                        "Genres": other[3],
                        "Director": other[4],
                        "Release": other[5]
                    })

                    # Fetch reviews
                    reviews = self.reviews("https://www.imdb.com" + href + "/reviews")
                    # Add reviews to the movie dictionary
                    movie_dict.update({
                        "Reviews": reviews
                    })

                    # Append the movie dictionary to the list
                    movies_list.append(movie_dict)
                    # Add the title to the set
                    titles_set.add(title)
                    c += 1 

        # Convert the list of dictionaries to a JSON string
        json_response = json.dumps(movies_list, indent=4)
        print(json_response)
        return json_response 

    def moviedetail(self, id):
        res = requests.get(url=id, headers=headers)
        res.raise_for_status()  # Raise an exception for HTTP errors
        html = res.text 
        soup = bs4.BeautifulSoup(html, "html.parser")       

        # Find the rating element
        rating = soup.find("span", class_="sc-bde20123-1 cMEQkK")
        # Check if rating is found
        if rating:
            rate = rating.text 
        else:
            rate = "N/A"

        # Extract cast details
        cast_divs = soup.find_all('div', class_='ipc-media ipc-media--avatar ipc-image-media-ratio--avatar ipc-media--base ipc-media--avatar-m ipc-media--avatar-circle ipc-avatar__avatar-image ipc-media__img')
        cast = {}
        for div in cast_divs:
            img_tag = div.find('img')
            if img_tag:
                image_src = img_tag['src']
                alt_text = img_tag.get('alt', '')
                cast[alt_text] = image_src

        # Extract movie description
        description = soup.find("span", class_="sc-466bb6c-0 hlbAws").text.strip()

        # Extract genres
        genres = [genre.text for genre in soup.find_all('a', class_='ipc-chip ipc-chip--on-baseAlt')]

        # Extract director and release details
        rel = soup.find_all('a', class_="ipc-metadata-list-item__list-content-item ipc-metadata-list-item__list-content-item--link")
        if len(rel) >= 19:
            director = rel[0].text.strip()
            release = rel[18].text.strip()
        else:
            director = "N/A"
            release = "N/A"

        return [rate, cast, description, genres, director, release]

    def reviews(self, id):
        res = requests.get(url=id, headers=headers)
        res.raise_for_status()  # Raise an exception for HTTP errors
        html = res.text 
        soup = bs4.BeautifulSoup(html, "html.parser")  

        # Extract reviewers' names
        reviews = soup.find_all("a", class_="title")
        reviewers = [review.text.strip() for review in reviews]

        # Extract reviewers' reviews
        users = soup.find_all("div", class_="display-name-date")
        usersers = [user.text.strip() for user in users]

        # Extract reviewers' ratings
        userratings = soup.find_all("span", class_="rating-other-user-rating")

        result = []

        # Verify lengths are consistent and create result dictionary
        for i in range(min(len(userratings), len(reviewers), len(usersers))):
            result.append({
                "name": usersers[i],
                "review": reviewers[i],
                "rating": userratings[i].find("span").text.strip() if i < len(userratings) else "N/A"  # Extracting rating text or setting to "N/A" if not found
            })

        return result

class TopMovies:
    def TopMovieResponse(self):
        url = "https://www.imdb.com/list/ls522436510/"
        res = requests.get(url, headers=headers)
        res.raise_for_status()
        html = res.text
        soup = bs4.BeautifulSoup(html, "html.parser")    

        # Find all img tags
        elements = soup.find_all("img" , class_ = "loadlate")       
        # Find all anchor tags with class 'title'      
        # Create a set to keep track of encountered titles
        titles_set = set()
        movies_list = []
        c = 0 
        # Loop through each element and extract src and title attributes
        for element in elements:
            if c == 3:  # Limiting to 3 movies for demonstration purposes
                break 

            src = element.get('loadlate')
            title = element.get('alt')
            href = element.get('data-tconst')
            # Check if src, title, and href are not None
            if src and title and href:
                # Check if title is not already present in the set
                if title not in titles_set:
                    # Create a dictionary for movie information
                    movie_dict = {
                        "Title": title,
                        "Image": src,
                        "IMDb_link": f"https://www.imdb.com/title/{href}"
                    }
                    
                    # Fetch movie details
                    model = BookingMovies()
                    other = model.moviedetail(f"https://www.imdb.com/title/{href}")
                    movie_dict.update({
                        "Rating": other[0],
                        "Cast": other[1],
                        "Description": other[2],
                        "Genres": other[3],
                        "Director": other[4],
                        "Release": other[5]
                    })

                    # Fetch reviews
                    reviews = model.reviews(f"https://www.imdb.com/title/{href}/reviews")
                    # Add reviews to the movie dictionary
                    movie_dict.update({
                        "Reviews": reviews
                    })

                    #Append the movie dictionary to the list
                    movies_list.append(movie_dict)
                    # Add the title to the set
                    titles_set.add(title)
                    c += 1 

        # Convert the list of dictionaries to a JSON string
        json_response = json.dumps(movies_list, indent=4)
        return json_response 
    def CommingSoon(self):
        url = "https://www.imdb.com/calendar/?region=IN"
        res = requests.get(url, headers=headers)
        res.raise_for_status()
        html = res.text
        soup = bs4.BeautifulSoup(html, "html.parser")    

        # Find all img tags
        elements = soup.find_all("img" , class_ = "ipc-image")       
        # Find all anchor tags with class 'title'      
        # Create a set to keep track of encountered titles
        titles_set = set()
        movies_list = []
        c = 0 
        # Loop through each element and extract src and title attributes
        for element in elements:
            if c == 3:  # Limiting to 3 movies for demonstration purposes
                break 

            src = element.get('src')
            title = element.get('alt')
            # Check if src, title, and href are not None
            if src and title :
                # Check if title is not already present in the set
                if title not in titles_set:
                    # Create a dictionary for movie information
                    movie_dict = {
                        "Title": title,
                        "Image": src,
                    }
                    

                    #Append the movie dictionary to the list
                    movies_list.append(movie_dict)
                    # Add the title to the set
                    titles_set.add(title)
                    c += 1 

        # Convert the list of dictionaries to a JSON string
        json_response = json.dumps(movies_list, indent=4)
        return json_response

