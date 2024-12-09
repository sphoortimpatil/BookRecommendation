# 📚 Readly (Book Recommendation App)

Welcome to the **Readly (Book Recommendation App)**, an iOS application built using **Swift** and **UIKit** that allows book enthusiasts to search, explore, and save their favorite books! This app integrates with the Open Library API to provide a rich database of books and ensures a smooth, responsive user experience.

## 📱 Features

- **Book Data Integration**: Fetch and display books from the Open Library API. The app retrieves key details such as:
  - Book Title
  - Author(s)
  - Cover Image
  - Genre
  - Publication Year
  - Description
  - Rating
  - Currently Reading Count

- **Search Functionality**: Effortlessly search for books by title using the Open Library search API for precise and relevant results.

- **Award-Winning Books**:
  - Fetch a curated list of award-winning books like those from the Booker Prize using predefined API queries.
    
- **Detailed Book View**: 
  - Each book displays its cover image, title, author(s), genre, description, publication year, rating, and currently reading count in a visually clear layout.
  - Smooth navigation transitions enhance the experience.

- **Favorite Books List**:
  - Add books to your personal favorites list for future reference.
  - View and manage your saved books with options to add or remove items.
  - Data stored locally within the app ensures your list is always accessible.

- **Interactive User Experience**:
  - Intuitive user interactions with smooth animations.

## 🛠️ Technical Details

- **API Integration**:
  - **Book Data**: Fetched using Open Library API ([example endpoint](https://openlibrary.org/subjects/sci-fi.json?details=true)).
  - **Search**: Integrated with the Open Library Search API for title-based searches.

- **Local Storage**:
  - UserDefaults for saving and managing the user's favorite book list

- **Architecture**:
  - MVVM (Model-View-ViewModel) for clear separation of concerns and maintainability

- **Networking using URLSession**: 
  The app uses **URLSession** to make network requests to the Open Library API. This is used for fetching book data, search results, and detailed information for individual books.
  - The app performs **asynchronous network calls** to fetch book data in the background, ensuring a smooth user experience.
  - **JSON data** from the API is decoded into Swift models using `Codable`.
  - The network manager handles all API requests and responses, providing a clean interface for fetching data.

## 📱 UIKit Elements Used

- **UIView**: Used for creating the structured layout and container views for various screens.
- **UITableView**: For vertical scrolling to display the list of books and favorites.
- **UITabBarController**: Used to handle different tabs seamlessly for navigating between sections like Search, Favorites, and Awards.
- **UINavigationController**: For seamless navigation between book list and book details screen.
- **UIImageView & UILabel**: To display book covers, titles, authors, and descriptions effectively.
- **UIButton**: For intuitive user interactions like adding/removing books from the favorites list.

## 📚 API References

### 1. Awarded Books
    GET https://openlibrary.org/search.json


| Parameter         | Type   | Description                          |
|-------------------|--------|--------------------------------------|
| `q`               | String | Query for specific award-winning books (e.g., "booker prize") |
| `limit`           | Int    | The maximum number of results to fetch |
| `details`         | Bool   | Fetch detailed book information     |

- **Description**: Retrieves a list of books based on specific award categories, like the Booker Prize.

---

### 2. Book Search
    GET https://openlibrary.org/search.json

| Parameter         | Type   | Description                          |
|-------------------|--------|--------------------------------------|
| `title`           | String | The title of the book to search for |
| `limit`           | Int    | The maximum number of results to fetch |
| `details`         | Bool   | Fetch detailed book information     |

- **Description**: Searches for books by their title and returns matching results with detailed information.

---
### 3. Book Details
    GET https://openlibrary.org/{bookKey}.json
| Parameter         | Type   | Description                          |
|-------------------|--------|--------------------------------------|
| `bookKey`         | String | The unique key of the book for detailed information |

- **Description**: Fetches detailed information about a specific book, including its metadata and additional attributes.

## 📸 Screenshots

<div align="center">
    <img src="./Screenshots/Search Screen.png" alt="Book Search" width="400" />
    <p><em>Search for books by title and explore detailed information.</em></p>
    <img src="./Screenshots/Home Screen.png" alt="Award Winning Books" width="400" />
    <p><em>Explore a curated list of award-winning books in the Home Screen. Each Iteam also conatins book details including title, author, genre, and description.</em></p>
    <img src="./Screenshots/Details Page.png" alt="Book Details" width="400" />
    <p><em>View book details including title, cover image, and description.</em></p>
    <img src="./Screenshots/Favourites Screen.png" alt="Favorite Books" width="400" />
    <p><em>Save your favorite books to access them anytime!</em></p>
</div>

## 🎥 Demo Video

Check out this video demonstration of the Book Recommendation App to see it in action!
<div align="center">
  
[Demo Video Link](https://github.com/user-attachments/assets/9ec4d4fd-4917-4d4b-a004-ff80c3269296)
</div>

### In this video, you will see:
- Searching for books by title and fetching accurate results.
- Viewing detailed book information, including cover, title, author(s), and description.
- Exploring a curated list of award-winning books (e.g., Booker Prize winners).
- Adding and removing books to/from the favorites list with ease.
- Smooth transitions and intuitive navigation across screens.
