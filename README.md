# SciCards

`SciCards` is a SwiftUI flashcard app for University level science study. It combines a bundled SQLite question bank with a lightweight iOS interface so students can choose topics and work through randomized card sessions.

## Overview

The current app focuses on Biology topics and an early Computer Science path. Flashcards are stored in a bundled SQLite database and accessed through [GRDB.swift](https://github.com/groue/GRDB.swift).

## Features

- SwiftUI interface for iPhone and iPad
- Topic-based study flow for Biology
- Computer Science starter deck support
- Randomized flashcard sessions
- Self check questions to introduce more tools for students to practice active recall









  <img width="256" height="256" alt="IMG_0143" src="https://github.com/user-attachments/assets/fc843c64-c321-4569-956f-a3a81c82a19c" />
<img width="256" height="256" alt="IMG_0139" src="https://github.com/user-attachments/assets/089fab03-84a3-4c53-bae5-feae16953a0d" />
<img width="256" height="256" alt="IMG_0138" src="https://github.com/user-attachments/assets/2fcb93ec-90e5-431c-aee7-8defd7b9706c" />

## Tech Stack

- Swift
- SwiftUI
- GRDB.swift
- SQLite
- Xcode project-based iOS app

## Requirements

- Xcode with Swift Package Manager support
- iOS deployment target in the project is `17.3+`
- GRDB package resolution enabled through Xcode

## Run

1. Open `SciCards.xcodeproj` in Xcode.
2. Allow Xcode to resolve the `GRDB.swift` package dependency.
3. Build and run the app on an iOS simulator or device.

## Data Pipeline

The repository includes a `createdb.py` script that converts the source Excel workbook into a SQLite flashcard database. The app then bundles and copies that database locally on startup before reading cards through GRDB.

## Repository Layout

- `SciCardsApp.swift`: application entry point and database setup
- `Database/`: SQLite bootstrap and query helpers
- `Models/`: flashcard and learning session state
- `Views/`: home, topic selection, and study screens
- `Components/`: reusable SwiftUI UI pieces
- `Resources/flashcards-2.db`: bundled flashcard database

## Status

This project is an active educational app prototype. The current code already supports studying topic-based flashcards, while progress tracking and broader subject coverage are still being expanded.
Currently the app is not ready for production, but hope to be deployed on the IOS App store by Aug 2026.
