# ios-interview

## Cat Browser

Implement an iOS app that uses the API from https://cataas.com. 

Follow the design images in the repo for ideas on how to architect your app.

---
### Design

**Main Screen**
![Main Screen](/CatGallery/Design/First_Screen.png)

**Tag Screen**
![Tag Screen](/CatGallery/Design/Tags_Screen.png)

**Cat Images Screen**
![Cat Images Screen](/CatGallery/Design/Images_Screen.png)

The end points for each screen are:

### Tags:

**Request:**
https://cataas.com/api/tags

**Response:**
```json
[
  "",
  "#christmascat",
  "2cats",
  "3",
  "4",
  "@Beardlyness",
  "Beer",
  "Belfast",
  "BelfastMet",
  "Black",
  "Box",
  "Buckley",
  "Cat",
  "Cat in a faucet",
  "Catto",
  "Chair",
  "Christmas",
  "CryptoWorld Cat",
  "Curious",
  "Cute",
  "Dark",
  "FAT",
  "Female",
  "Friends",
  "Fulgencio",
  "Going shopping?",
  "Grumpy",
  "Hiding",
  "Lay",
  "Luz",
  "Maine Coon",
  "Maine coon"
]
```
### Cats with tag

**Request:**
https://cataas.com/api/cats?tags=tag1,tag2

**Response:**
```json
[
  {
    "id": "595f280e557291a9750ebfa0",
    "created_at": "2016-10-08T23:39:12.545Z",
    "tags": [
      "black",
      "beer"
    ]
  },
  {
    "id": "60e8414c586c1700189b3770",
    "created_at": "2021-07-09T12:30:04.146Z",
    "tags": [
      "Beer",
      "Cat",
      "Black",
      "Curious"
    ]
  }
]
```

### Cat Image Retrieval

**Request:**
https://cataas.com/cat/60e8414c586c1700189b3770

**Response:**

Image data
