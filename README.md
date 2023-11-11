# Amai

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview

### Description

Amai is a health tracker app aimed to help people who struggle with health problems keep track of their wellbeing. It is specifically aimed at those who struggle with diabetic symptoms (Pre-Diabetes, Diabetes I, Diabetes II) and need help tracking their food intake and glucose levels, hence the name "Amai", the romanization of the Japanese word あまい, meaning sweet. While the goal is to keep track of details such as blood sugar levels, there is also features like a heart rate tracker, a mood tracker, and a recipes section. This allows the app to also provide a general outlet for the users thoughts and emotions, or to just find inspiration for their next meal. This project was inspired by my mother who struggles with health issues.

### App Evaluation

[Evaluation of your app across the following attributes]
- **Category:** Health / Lifestyle
- **Mobile:** Mobile allows for easy tracking throughout the day, no login required, without the need of opening a browser. 
- **Story:** Encourages physical and mental wellbeing. User will be more aware of their health and it will motivate them to take control of what they can, such as their diet.
- **Market:** To all who wish to start taking control of their health, but more specifically geared those who suffer from diabetes and heart related issues.
- **Habit:** Users who are most active, or have the severe need to track multiple times, are using this throughout the day. The average user will probably make one daily entry in the diary section. The recipe section will be used on occassion by all users.
- **Scope:** The current goal is a stripped down version of my vision for this app. Therefore, it should be achieveable for the most part with my current skillset. However, the current implementation wouldn't be some stagnant idea. There are many more possibilities to add further down the line.  

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can choose between their Diary and Recipe library
* User can make a Diary Entry
* User can specify their blood sugar level, heart rate, and mood level
* User can see all their past entries
* User can see a catalouge of Recipes
* User can check details of each Recipe

**Optional Nice-to-have Stories**

* User can view graph of their sugar and heart record history
* User can see health attribute categories for each recipe (low-carb, vegan, gluten-free, etc)

### 2. Screen Archetypes

- [ ] Launch Screen
* User can choose between their Diary and Recipe library
- [ ] Diary Stream
* User can see all their past entries
* User can make a Diary Entry
- [ ] Diary Creation
* User can make a Diary Entry
* User can specify their blood sugar level, heart rate, and mood level
- [ ] Recipe Stream
* User can see a catalouge of Recipes
- [ ] Recipe Detail
* User can check details of each Recipe

### 3. Navigation

**Tab Navigation** (Optional Feature)
 
* Diary
    * Diary Stream
    * Diary Graph/Table Data View

* Recipe
    * All Recipes
    * Favorites

**Flow Navigation** (Screen to Screen)

- [ ] Launch Screen
* -> Diary Stream
* -> Recipe Stream
- [ ] Diary Stream
* -> Diary Creation
- [ ] Recipe Stream
* -> Recipe Detail
- [ ] Diary Creation
* -> none for this version
- [ ] Recipe Detail
* -> none for this version

## Wireframe(s)

<img src="https://github.com/natalie-gallo/amai-app/blob/3bac97c1be8df1c84802bacac7a2941de6377b66/amai-app-v1-wireframe.png" width=600>

## Schema 

[This section will be completed in Unit 9]

### Models

[Add table of models]

### Networking

- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
