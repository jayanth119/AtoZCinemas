import requests
import bs4

class Top250:
    def TvShowsMovies(self , url ):
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',
        }
        movies250 = []

        try:
            response1 = requests.get(url, headers=headers)
        

            if response1.status_code == 200 :
                html_content_movies = response1.text
                soup1 = bs4.BeautifulSoup(html_content_movies, "html.parser")
                movies = soup1.find_all('h3', class_='ipc-title__text')
                moviesimage = soup1.find_all("img", class_="ipc-image")


                # Extracting movie names and images
                c = 1 
                for i in range(1, 250):
                    movies250.append({
                        "Name": movies[i].text,
                        "Image_URL": moviesimage[c-1].get("src") if moviesimage[i].get("src") else None
                    })
                    c+= 1 

                # Extracting TV show names and images


                return movies250
            else:
                print(f"Error: {response1.status_code}")
        except requests.exceptions.RequestException as e:
            print(f"Error: {e}")


