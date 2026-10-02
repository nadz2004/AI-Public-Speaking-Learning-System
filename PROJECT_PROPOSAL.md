# AI-Driven Mobile Learning System for Public Speaking Skills
## Project Proposal: CEC HUMSS Students

---

## 1. PROJECT OVERVIEW

### 1.1 Project Title
**AI-Driven Mobile Learning System for Enhancing Public Speaking Skills Among HUMSS Students**

### 1.2 Institution
**Cebu Eastern College (CEC)**
- Target Department: Humanities and Social Sciences (HUMSS)
- Target Users: HUMSS Students (Grades 11-12)

### 1.3 Project Objective
To develop an innovative mobile learning application that leverages Artificial Intelligence to provide personalized, real-time feedback and guidance to HUMSS students, enabling them to improve their public speaking skills through interactive practice sessions, AI-powered speech evaluation, and progressive learning pathways.

### 1.4 Project Duration
**6-8 months** (Development: 4 months | Testing & Refinement: 2-3 months | Deployment: 1 month)

---

## 2. PROBLEM STATEMENT

### 2.1 Current Challenges
- **Limited Speaking Practice Opportunities**: Traditional classroom settings provide minimal individual practice time
- **Inconsistent Feedback**: Manual evaluation is subjective and time-consuming
- **Lack of Personalization**: One-size-fits-all teaching approaches don't address individual student needs
- **Anxiety & Confidence Issues**: Students lack a judgment-free environment to practice
- **Delayed Feedback Loop**: Students wait days/weeks for evaluation results
- **No Progress Tracking**: Difficult to visualize improvement over time

### 2.2 Target Problem
HUMSS students struggle to develop effective public speaking skills due to limited practice opportunities, inconsistent feedback mechanisms, and anxiety in traditional classroom settings.

---

## 3. PROPOSED SOLUTION

### 3.1 Application Name
**SpeakPro AI** - An AI-Powered Public Speaking Tutor

### 3.2 Platform
**Cross-Platform Mobile Application** (Flutter Framework)
- **Framework**: Flutter with Dart
- **IDE**: Android Studio with Flutter Plugin
- **Target Platforms**: Android (Primary) & iOS (Secondary)
- **Minimum SDK**: Android 26 (8.0), iOS 12.0
- **Target SDK**: Android 34 (14), iOS 16+

### 3.3 Core Features

#### 3.3.1 Speech Recognition & Analysis
- Real-time voice capture and processing
- Speech-to-text conversion using Google ML Kit & Firebase ML
- Pronunciation and accent analysis
- Pace and tempo evaluation
- Filler word detection (um, uh, like, you know)
- Confidence level assessment
- Audio quality monitoring

#### 3.3.2 AI-Powered Feedback Engine
- Automated speech evaluation based on multiple dimensions:
  - **Content Quality**: Message clarity, organization, relevance
  - **Delivery**: Tone, pacing, volume variation, articulation
  - **Non-verbal**: Suggested posture, eye contact (via video analysis)
  - **Confidence**: Speech hesitation patterns, filler usage
- Real-time performance scoring (0-100)
- Personalized improvement recommendations

#### 3.3.3 Interactive Learning Modules
- **Beginner Module**: Fundamentals of public speaking
- **Intermediate Module**: Presentation techniques and storytelling
- **Advanced Module**: Persuasion, debate, and critical thinking
- **Topic-Specific Training**: Speech types (impromptu, prepared, persuasive, informative)

#### 3.3.4 Practice Scenarios
- Simulated classroom presentations
- Job interview scenarios
- Debate competition simulations
- Science fair presentation practice
- Mock impromptu speaking challenges

#### 3.3.5 Progress Tracking & Analytics
- Individual performance dashboards
- Speech improvement metrics over time
- Comparison with peer averages (anonymized)
- Achievement badges and milestones
- Weekly/monthly progress reports

#### 3.3.6 Teacher Dashboard
- Class management and student grouping
- Monitor individual student progress
- Assign custom practice scenarios
- View detailed analytics for each student
- Provide written feedback on recorded speeches

#### 3.3.7 Student Companion Features
- Speech tips and best practices library
- Video tutorials from public speaking experts
- Vocabulary builder for presentation contexts
- Sample speeches for reference and study
- Peer comparison (anonymized leaderboards)

---

## 4. TECHNICAL ARCHITECTURE

### 4.1 Development Stack

#### Frontend (Mobile)
- **Framework**: Flutter (Dart language)
- **IDE**: Android Studio with Flutter & Dart plugins
- **State Management**: Provider, Riverpod, or GetX
- **Architecture**: Clean Architecture with MVVM/BLoC patterns
- **UI Libraries**:
  - Material Design 3
  - Cupertino widgets for iOS
  - Custom animations
- **Key Packages**:
  - `record` - Audio recording
  - `speech_to_text` - Google Speech API
  - `google_ml_kit` - ML Kit for Firebase
  - `video_player` & `camera` - Video capture
  - `firebase_core`, `firebase_auth`, `cloud_firestore` - Backend services
  - `provider` or `riverpod` - State management
  - `sqflite` - Local database
  - `http` & `dio` - API calls
  - `charts_flutter` - Analytics visualization
  - `flutter_local_notifications` - Push notifications

#### Backend Services
- **Server**: Node.js + Express.js or Python + FastAPI
- **Database**: Firebase Firestore (primary) with PostgreSQL option
- **Storage**: Firebase Storage for audio/video files
- **Authentication**: Firebase Authentication with custom backend
- **Real-time Updates**: Firestore listeners, WebSockets

#### AI/ML Services
- **Speech Recognition**: Google Cloud Speech-to-Text API
- **Text Analysis**: Google Cloud Natural Language API
- **Audio Analysis**: TensorFlow Lite for on-device processing
- **Video Analysis**: ML Kit Face Detection for posture insights
- **Custom Models**: TensorFlow for tone, confidence, pace analysis
- **Sentiment Analysis**: Firebase ML or custom models

#### Cloud Infrastructure
- **Platform**: Firebase (primary) with AWS/GCP options
- **Real-time Database**: Firestore
- **Authentication**: Firebase Auth + Custom Backend
- **File Storage**: Cloud Storage (Firestore)
- **Admin Dashboard**: Flutter Web or React

### 4.2 System Architecture Diagram
```
┌────────────────────────────────────────────────────────────────┐
│                    Flutter Mobile App                           │
│  ┌──────────────┬──────────────┬──────────────┬──────────────┐ │
│  │   Student    │   Learning   │   Practice   │   Teacher    │ │
│  │   Dashboard  │   Modules    │   Sessions   │   Dashboard  │ │
│  └──────────────┴──────────────┴──────────────┴──────────────┘ │
│                                                                  │
│  ┌──────────────┬──────────────┬──────────────┬──────────────┐ │
│  │   Profile    │   Analytics  │   Settings   │   Offline    │ │
│  │   Management │   & Progress │   & Prefs    │   Sync       │ │
│  └──────────────┴──────────────┴──────────────┴──────────────┘ │
└─────────────────────────────┬─────────────────────────────────┘
                              │ (REST API & WebSockets)
                ┌─────────────┴──────────────┐
                │                            │
           ┌────▼─────┐              ┌──────▼────┐
           │ Firebase  │              │   AI/ML   │
           │ Backend   │              │  Services │
           └────┬─────┘              └──────┬────┘
                │                           │
           ┌────▼───────────────────────────▼──────┐
           │     Google Cloud Platform              │
           │  ┌──────────────────────────────────┐ │
           │  │ Speech-to-Text API               │ │
           │  │ Natural Language API             │ │
           │  │ Cloud Vision API (optional)      │ │
           │  └──────────────────────────────────┘ │
           │                                       │
           │  ┌──────────────────────────────────┐ │
           │  │ Firebase Services                │ │
           │  │ - Firestore (Database)           │ │
           │  │ - Storage (Audio/Video)          │ │
           │  │ - Authentication                 │ │
           │  │ - Hosting (Admin Dashboard)      │ │
           │  └──────────────────────────────────┘ │
           └───────────────────────────────────────┘
```

### 4.3 Flutter Architecture Pattern

```
Presentation Layer (UI)
├── Screens
│   ├── AuthScreens (Login, Register)
│   ├── StudentScreens (Dashboard, Practice, Progress)
│   ├── LearningScreens (Modules, Content)
│   ├── PracticeScreens (Recording, Playback)
│   └── TeacherScreens (Dashboard, Analytics)
├── Widgets (Reusable Components)
└── State Management (Provider/BLoC)

Domain Layer (Business Logic)
├── Entities (Data Models)
├── Repositories (Abstract Interfaces)
└── Use Cases (Business Logic)

Data Layer (Data Management)
├── Repositories (Implementations)
├── Data Sources
│   ├── Remote (Firebase, APIs)
│   ├── Local (SQLite)
│   └── Cache (Hive/Shared Preferences)
└── Models (Data Classes)
```

---

## 5. KEY FEATURES BREAKDOWN

### 5.1 Speech Recording & Processing Flow
```
User Taps Record Button
    ↓
Request Audio Permissions (Android/iOS)
    ↓
Real-time Voice Capture (record package)
    ↓
Audio File Storage (Firebase Storage)
    ↓
Waveform Visualization (Real-time)
    ↓
Speech-to-Text Conversion (Google Speech API)
    ↓
Multi-dimensional AI Analysis
    ↓
Generate Evaluation Report
    ↓
Display Results & Recommendations to User
    ↓
Save to Firestore & Local Cache
    ↓
Update Progress Analytics
```

### 5.2 AI Evaluation Metrics
| Metric | Weight | Measurement |
|--------|--------|-------------|
| Content Quality | 25% | Relevance, organization, clarity |
| Delivery | 30% | Pacing, tone, articulation, volume |
| Engagement | 20% | Confidence, eye contact, posture |
| Language Use | 15% | Grammar, vocabulary, filler words |
| Overall Score | 100% | Composite of all metrics |

### 5.3 User Journeys

#### Student Journey
```
1. Launch App
   ↓
2. Authentication (Login/Register with Firebase)
   ↓
3. Complete Profile (Grade, HUMSS Track, Learning Goals)
   ↓
4. Select Difficulty Level (Beginner/Intermediate/Advanced)
   ↓
5. Browse Learning Modules
   ↓
6. Study Materials (Videos, Tips, Samples)
   ↓
7. Select Practice Scenario
   ↓
8. Record Speech (Built-in Recording Feature)
   ↓
9. Receive AI Feedback (Detailed Scores & Recommendations)
   ↓
10. Review Analytics (Progress Tracking)
   ↓
11. Complete Challenges (Unlock Badges)
```

#### Teacher Journey
```
1. Launch App
   ↓
2. Login with Teacher Credentials
   ↓
3. View Teacher Dashboard
   ↓
4. Manage Classes (Create/Edit Groups)
   ↓
5. Assign Practice Scenarios
   ↓
6. Monitor Real-time Student Activity
   ↓
7. Review Student Speeches
   ↓
8. Provide Custom Feedback
   ↓
9. Generate Class Reports
   ↓
10. Identify & Support Struggling Students
```

---

## 6. DATABASE SCHEMA (Firestore Collections)

### 6.1 Collections Structure

```
users/
├── {uid}
│   ├── email: string
│   ├── fullName: string
│   ├── userType: enum (student/teacher)
│   ├── department: string (HUMSS)
│   ├── grade: number (11/12)
│   ├── profileImageUrl: string
│   ├── createdAt: timestamp
│   ├── lastLogin: timestamp
│   ├── isActive: boolean
│   └── preferences: map
│       ├── notifications: boolean
│       ├── language: string
│       └── theme: string

speeches/
├── {speechId}
│   ├── userId: string (FK: users/{uid})
│   ├── recordingUrl: string
│   ├── transcript: string
│   ├── duration: number (seconds)
│   ├── timestamp: timestamp
│   ├── moduleId: string (FK)
│   ├── scenarioId: string (FK)
│   ├── isPublic: boolean
│   ├── waveformData: array
│   └── metadata: map
│       ├── deviceInfo: string
│       ├── audioQuality: string
│       └── environment: string

evaluations/
├── {evaluationId}
│   ├── speechId: string (FK: speeches/{speechId})
│   ├── userId: string (FK: users/{uid})
│   ├── contentScore: number (0-100)
│   ├── deliveryScore: number (0-100)
│   ├── engagementScore: number (0-100)
│   ├── languageScore: number (0-100)
│   ├── overallScore: number (0-100)
│   ├── feedback: map
│   │   ├── strengths: array<string>
│   │   ├── improvements: array<string>
│   │   └── suggestions: array<string>
│   ├── fillerWords: map
│   │   ├── count: number
│   │   └── frequency: array<string>
│   ├── pace: map
│   │   ├── wordsPerMinute: number
│   │   ├── averagePauseDuration: number
│   │   └── rating: string
│   ├── confidence: map
│   │   ├── level: string (low/medium/high)
│   │   ├── hesitationCount: number
│   │   └── recommendedPractice: array<string>
│   ├── teacherFeedback: string (optional)
│   ├── timestamp: timestamp
│   └── processedAt: timestamp

userProgress/
├── {progressId}
│   ├── userId: string (FK: users/{uid})
│   ├── totalSpeechesPracticed: number
│   ├── averageScore: number
│   ├── bestScore: number
│   ├── currentStreak: number (consecutive days)
│   ├── badges: array<string>
│   ├── moduleProgress: map
│   │   ├── {moduleId}: map
│   │   │   ├── completionPercentage: number
│   │   │   ├── lessonsCompleted: array
│   │   │   ├── averageModuleScore: number
│   │   │   └── lastAccessed: timestamp
│   ├── improvement: map
│   │   ├── weeklyAverage: number
│   │   ├── monthlyTrend: array<number>
│   │   └── improvements: array<string>
│   ├── lastUpdated: timestamp
│   └── milestones: array<map>

learningModules/
├── {moduleId}
│   ├── title: string
│   ├── description: string
│   ├── difficulty: enum (beginner/intermediate/advanced)
│   ├── category: string
│   ├── lessons: array<map>
│   │   ├── lessonId: string
│   │   ├── title: string
│   │   ├── content: string
│   │   ├── videoUrl: string (optional)
│   │   ├── duration: number (minutes)
│   │   └── order: number
│   ├── estimatedDuration: number (hours)
│   ├── createdAt: timestamp
│   ├── updatedAt: timestamp
│   ├── isActive: boolean
│   └── resources: array<map>

practiceScenarios/
├── {scenarioId}
│   ├── title: string
│   ├── description: string
│   ├── type: enum (impromptu/prepared/persuasive/informative/debate)
│   ├── difficulty: enum (beginner/intermediate/advanced)
│   ├── prompt: string
│   ├── suggestedDuration: number (seconds)
│   ├── evaluationCriteria: array<string>
│   ├── hints: array<string>
│   ├── sampleSpeech: map
│   │   ├── title: string
│   │   ├── videoUrl: string
│   │   ├── transcript: string
│   │   └── explanation: string
│   ├── createdAt: timestamp
│   └── popularityScore: number

classes/
├── {classId}
│   ├── teacherId: string (FK: users/{uid})
│   ├── className: string
│   ├── subject: string (Public Speaking)
│   ├── grade: number
│   ├── description: string
│   ├── students: array<string> (FK: users/{uid})
│   ├── createdAt: timestamp
│   ├── assignments: array<map>
│   │   ├── assignmentId: string
│   │   ├── scenarioId: string
│   │   ├── dueDate: timestamp
│   │   └── isSubmitted: boolean
│   └── classCode: string (unique)

achievements/
├── {achievementId}
│   ├── title: string
│   ├── description: string
│   ├── icon: string (URL)
│   ├── requirements: map
│   │   ├── type: enum (speeches/score/streak/completion)
│   │   └── value: number
│   └── category: enum (skill/consistency/performance)
```

---

## 7. FLUTTER PROJECT STRUCTURE

```
lib/
├── main.dart                          # App entry point
├── config/
│   ├── constants.dart                 # App constants
│   ├── theme.dart                     # Material theme
│   └── routes.dart                    # Navigation routes
├── core/
│   ├── error/
│   │   ├── exceptions.dart
│   │   └── failures.dart
│   ├── network/
│   │   └── network_info.dart
│   └── utils/
│       ├── app_utils.dart
│       └── validators.dart
├── data/
│   ├── datasources/
│   │   ├── remote/
│   │   │   ├── firebase_remote_datasource.dart
│   │   │   └── api_client.dart
│   │   └── local/
│   │       ├── local_database.dart
│   │       └── shared_prefs.dart
│   ├── models/
│   │   ├── user_model.dart
│   │   ├── speech_model.dart
│   │   ├── evaluation_model.dart
│   │   ├── progress_model.dart
│   │   ├── module_model.dart
│   │   └── scenario_model.dart
│   └── repositories/
│       ├── auth_repository_impl.dart
│       ├── speech_repository_impl.dart
│       ├── learning_repository_impl.dart
│       ├── progress_repository_impl.dart
│       └── teacher_repository_impl.dart
├── domain/
│   ├── entities/
│   │   ├── user_entity.dart
│   │   ├── speech_entity.dart
│   │   ├── evaluation_entity.dart
│   │   ├── progress_entity.dart
│   │   ├── module_entity.dart
│   │   └── scenario_entity.dart
│   ├── repositories/
│   │   ├── auth_repository.dart
│   │   ├── speech_repository.dart
│   │   ├── learning_repository.dart
│   │   ├── progress_repository.dart
│   │   └── teacher_repository.dart
│   └── usecases/
│       ├── auth_usecases.dart
│       ├── speech_usecases.dart
│       ├── learning_usecases.dart
│       ├── progress_usecases.dart
│       └── teacher_usecases.dart
├── presentation/
│   ├── pages/
│   │   ├── splash/
│   │   │   ├── splash_screen.dart
│   │   ��   └── splash_controller.dart
│   │   ├── auth/
│   │   │   ├── login_screen.dart
│   │   │   ├── register_screen.dart
│   │   │   ├── auth_provider.dart
│   │   │   └── auth_controller.dart
│   │   ├── student/
│   │   │   ├── home_screen.dart
│   │   │   ├── dashboard_screen.dart
│   │   │   ├── learning_screen.dart
│   │   │   ├── practice_screen.dart
│   │   │   ├── recording_screen.dart
│   │   │   ├── playback_screen.dart
│   │   │   ├── results_screen.dart
│   │   │   ├── progress_screen.dart
│   │   │   ├── profile_screen.dart
│   │   │   └── providers/
│   │   │       ├── speech_provider.dart
│   │   │       ├── learning_provider.dart
│   │   │       ├── progress_provider.dart
│   │   │       └── theme_provider.dart
│   │   └── teacher/
│   │       ├── teacher_dashboard_screen.dart
│   │       ├── class_management_screen.dart
│   │       ├── student_analytics_screen.dart
│   │       ├── assignments_screen.dart
│   │       └── providers/
│   │           ├── teacher_provider.dart
│   │           └── analytics_provider.dart
│   ├── widgets/
│   │   ├── common/
│   │   │   ├── custom_app_bar.dart
│   │   │   ├── custom_button.dart
│   │   │   ├── custom_text_field.dart
│   │   │   ├── loading_dialog.dart
│   │   │   ├── error_dialog.dart
│   │   │   └── success_snackbar.dart
│   │   ├── speech/
│   │   │   ├── waveform_widget.dart
│   │   │   ├── score_display_widget.dart
│   │   │   ├── feedback_card_widget.dart
│   │   │   └── speech_player_widget.dart
│   │   ├── learning/
│   │   │   ├── module_card_widget.dart
│   │   │   ├── lesson_content_widget.dart
│   │   │   ├── progress_bar_widget.dart
│   │   │   └── video_player_widget.dart
│   │   └── analytics/
│   │       ├── score_chart_widget.dart
│   │       ├── progress_graph_widget.dart
│   │       ├── achievement_badge_widget.dart
│   │       └── statistics_card_widget.dart
│   └── providers/
│       ├── app_provider.dart
│       └── service_locator.dart
└── services/
    ├── audio_service.dart
    ├── speech_to_text_service.dart
    ├── ai_evaluation_service.dart
    ├── firebase_service.dart
    └── notification_service.dart
```

---

## 8. KEY FLUTTER PACKAGES & DEPENDENCIES

### pubspec.yaml
```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # State Management
  provider: ^6.0.0
  riverpod: ^2.0.0
  get: ^4.6.0
  
  # Firebase
  firebase_core: ^2.24.0
  firebase_auth: ^4.10.0
  cloud_firestore: ^4.13.0
  firebase_storage: ^11.2.0
  firebase_messaging: ^14.6.0
  
  # Audio & Speech
  record: ^4.4.0
  speech_to_text: ^6.3.0
  google_mlkit_text_recognition: ^0.7.0
  
  # Camera & Video
  camera: ^0.10.5
  video_player: ^2.7.0
  
  # UI & Design
  google_fonts: ^6.1.0
  flutter_svg: ^2.0.7
  shimmer: ^3.0.0
  lottie: ^2.6.0
  animations: ^2.0.7
  
  # Charts & Analytics
  fl_chart: ^0.64.0
  syncfusion_flutter_charts: ^22.1.36
  
  # Local Database
  sqflite: ^2.3.0
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  
  # Networking
  http: ^1.1.0
  dio: ^5.3.0
  
  # Storage & Preferences
  shared_preferences: ^2.2.0
  
  # Notifications
  flutter_local_notifications: ^14.1.0
  
  # Utilities
  intl: ^0.19.0
  uuid: ^4.0.0
  path_provider: ^2.1.0
  permission_handler: ^11.4.4
  connectivity_plus: ^5.0.0
  
  # Logging
  logger: ^2.0.0
  
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0
  mockito: ^5.4.0
```

---

## 9. IMPLEMENTATION ROADMAP (Flutter/Android Studio)

### Phase 1: Project Setup & UI Foundation (Weeks 1-3)
- [ ] Create Flutter project in Android Studio
- [ ] Set up Firebase configuration (Android & iOS)
- [ ] Configure Firebase Authentication
- [ ] Set up Firestore database structure
- [ ] Implement app theme and design system
- [ ] Create base project structure (layers)
- [ ] Build splash screen
- [ ] Build authentication screens (Login/Register)

### Phase 2: Core Features Development (Weeks 4-8)
- [ ] Implement audio recording functionality
- [ ] Integrate speech-to-text (Google API)
- [ ] Build recording screen UI
- [ ] Create playback and waveform visualization
- [ ] Build learning modules screens
- [ ] Implement lesson content display
- [ ] Create practice scenarios selection
- [ ] Build student dashboard
- [ ] Implement profile management

### Phase 3: AI Integration & Analytics (Weeks 9-12)
- [ ] Integrate Google Cloud Natural Language API
- [ ] Implement evaluation scoring logic
- [ ] Build results/feedback display screen
- [ ] Create analytics and progress tracking
- [ ] Implement charts and visualizations
- [ ] Build achievement/badge system
- [ ] Create progress comparison features
- [ ] Implement notifications system

### Phase 4: Teacher Features & Admin Panel (Weeks 13-15)
- [ ] Build teacher authentication flow
- [ ] Create class management screens
- [ ] Implement student assignment features
- [ ] Build teacher analytics dashboard
- [ ] Create class performance reports
- [ ] Implement teacher feedback system
- [ ] Build admin controls

### Phase 5: Testing, Optimization & Refinement (Weeks 16-18)
- [ ] Unit testing for business logic
- [ ] Widget testing for UI
- [ ] Integration testing
- [ ] Performance optimization
- [ ] Bug fixes and refinements
- [ ] Beta testing with students
- [ ] User feedback collection
- [ ] Security audit

### Phase 6: Deployment & Launch (Weeks 19-20)
- [ ] Build release APK for Android
- [ ] Generate iOS build (if applicable)
- [ ] Google Play Store submission
- [ ] App Store submission (if iOS)
- [ ] Training material preparation
- [ ] Official launch at CEC
- [ ] Ongoing support setup

---

## 10. ANDROID STUDIO SETUP GUIDE

### 10.1 Prerequisites
- Android Studio latest version (Giraffe or newer)
- Flutter SDK installed and added to PATH
- Dart SDK (comes with Flutter)
- Git installed
- JDK 11 or later

### 10.2 Flutter Plugin Installation in Android Studio
1. Open Android Studio
2. Go to: **File** → **Settings** → **Plugins**
3. Search for "Flutter" and install the Flutter plugin
4. Restart Android Studio
5. Accept SDK licenses: `flutter doctor --android-licenses`

### 10.3 Project Creation
```bash
# In Android Studio: File → New → New Flutter Project
# Or via terminal:
flutter create --org com.cecschool.speakpro speakpro_ai

# Navigate to project
cd speakpro_ai

# Get dependencies
flutter pub get

# Run on emulator/device
flutter run
```

### 10.4 Firebase Setup
1. Create Firebase project in Google Console
2. Add Android app to Firebase project
3. Download `google-services.json`
4. Place in `android/app/` directory
5. Update `android/build.gradle`:
```gradle
buildscript {
    dependencies {
        classpath 'com.google.gms:google-services:4.3.15'
    }
}
```
6. Update `android/app/build.gradle`:
```gradle
apply plugin: 'com.google.gms.google-services'
```

### 10.5 Hot Reload & Hot Restart
- **Hot Reload** (r): Fast code changes without losing state
- **Hot Restart** (R): Restarts app, loses state
- **Quit** (q): Exit the app

---

## 11. DATABASE MODELS (Dart/Flutter)

### Example: User Entity & Model

```dart
// lib/domain/entities/user_entity.dart
class UserEntity {
  final String uid;
  final String email;
  final String fullName;
  final UserType userType;
  final String department;
  final int grade;
  final String? profileImageUrl;
  final DateTime createdAt;
  final DateTime lastLogin;
  final bool isActive;
  final UserPreferences preferences;

  UserEntity({
    required this.uid,
    required this.email,
    required this.fullName,
    required this.userType,
    required this.department,
    required this.grade,
    this.profileImageUrl,
    required this.createdAt,
    required this.lastLogin,
    required this.isActive,
    required this.preferences,
  });
}

enum UserType { student, teacher }

class UserPreferences {
  final bool notifications;
  final String language;
  final String theme;

  UserPreferences({
    this.notifications = true,
    this.language = 'en',
    this.theme = 'light',
  });
}

// lib/data/models/user_model.dart
class UserModel extends UserEntity {
  UserModel({
    required String uid,
    required String email,
    required String fullName,
    required UserType userType,
    required String department,
    required int grade,
    String? profileImageUrl,
    required DateTime createdAt,
    required DateTime lastLogin,
    required bool isActive,
    required UserPreferences preferences,
  }) : super(
    uid: uid,
    email: email,
    fullName: fullName,
    userType: userType,
    department: department,
    grade: grade,
    profileImageUrl: profileImageUrl,
    createdAt: createdAt,
    lastLogin: lastLogin,
    isActive: isActive,
    preferences: preferences,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] ?? '',
      email: json['email'] ?? '',
      fullName: json['fullName'] ?? '',
      userType: UserType.values.byName(json['userType'] ?? 'student'),
      department: json['department'] ?? 'HUMSS',
      grade: json['grade'] ?? 11,
      profileImageUrl: json['profileImageUrl'],
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      lastLogin: DateTime.parse(json['lastLogin'] ?? DateTime.now().toIso8601String()),
      isActive: json['isActive'] ?? true,
      preferences: UserPreferences(
        notifications: json['preferences']['notifications'] ?? true,
        language: json['preferences']['language'] ?? 'en',
        theme: json['preferences']['theme'] ?? 'light',
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'fullName': fullName,
      'userType': userType.name,
      'department': department,
      'grade': grade,
      'profileImageUrl': profileImageUrl,
      'createdAt': createdAt.toIso8601String(),
      'lastLogin': lastLogin.toIso8601String(),
      'isActive': isActive,
      'preferences': {
        'notifications': preferences.notifications,
        'language': preferences.language,
        'theme': preferences.theme,
      },
    };
  }
}
```

---

## 12. RESOURCE REQUIREMENTS

### 12.1 Development Team
- **Project Manager**: 1 person
- **Senior Flutter Developer**: 1 person
- **Flutter Developer**: 2 persons
- **Backend Developer**: 1 person
- **AI/ML Engineer**: 1 person
- **UI/UX Designer**: 1 person
- **QA Engineer**: 1 person

### 12.2 Development Tools & Licenses
- Android Studio (Free)
- Flutter SDK (Free)
- Firebase (Free tier + pay-as-you-go)
- Google Cloud APIs ($300 free credits)
- Design Tools (Figma - $12/month or free tier)

### 12.3 Budget Estimation
| Category | Estimated Cost |
|----------|-----------------|
| Cloud Services (Firebase, GCP) | $2,000 - $3,500 |
| Third-party APIs (Google Cloud) | $1,500 - $2,500 |
| Development Tools | $500 - $1,000 |
| Testing & Deployment | $800 - $1,500 |
| Training & Documentation | $1,000 - $1,500 |
| **Total Estimated Budget** | **$6,000 - $10,000** |

---

## 13. EXPECTED OUTCOMES & SUCCESS METRICS

### 13.1 Learning Outcomes
- [ ] HUMSS students demonstrate improved public speaking confidence
- [ ] 80%+ student satisfaction rate
- [ ] Average improvement of 25%+ in speech quality scores
- [ ] Reduced speech anxiety among participants
- [ ] Increased engagement in class presentations

### 13.2 Technical Metrics
- [ ] App completion rate: >70% of target users
- [ ] Average session duration: 15-20 minutes
- [ ] Speech processing accuracy: >95%
- [ ] App uptime: >99.5%
- [ ] User retention rate: >60% (3-month)

### 13.3 Adoption Metrics
- [ ] 100+ active HUMSS students using the app
- [ ] 50+ teacher accounts created
- [ ] 1000+ practice speeches recorded
- [ ] Average app rating: >4.5/5 stars

---

## 14. DEVELOPMENT TIMELINE (Gantt Overview)

```
Week 1-3:   [Setup & UI Foundation================]
Week 4-8:   [Core Features Development=================]
Week 9-12:  [AI Integration & Analytics=================]
Week 13-15: [Teacher Features================]
Week 16-18: [Testing & Optimization==================]
Week 19-20: [Deployment & Launch=====]
```

---

## 15. RISKS & MITIGATION STRATEGIES

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|-----------|
| API costs exceeding budget | Medium | High | Implement caching, optimize API calls, use on-device ML |
| Speech recognition accuracy issues | Medium | Medium | Add manual transcript editing, fallback mechanisms, testing |
| Low user adoption | Medium | High | User training, gamification, curriculum integration |
| Data privacy & security concerns | Low | High | GDPR compliance, encryption, secure authentication |
| Technical delays in development | Medium | Medium | Agile methodology, buffer time, clear milestones |
| Device compatibility issues | Low | Medium | Test on multiple devices, use CI/CD pipelines |

---

## 16. DEPLOYMENT & MAINTENANCE PLAN

### 16.1 Pre-Deployment Checklist
- [ ] All features tested and working
- [ ] Performance optimization completed
- [ ] Security audit passed
- [ ] Privacy policy created
- [ ] User documentation ready
- [ ] Support team trained

### 16.2 Deployment Steps
1. **Closed Beta** (50 selected students, 2 weeks)
2. **Open Beta** (All HUMSS students, monitor feedback, 2 weeks)
3. **Full Release** (Public launch, ongoing monitoring)
4. **Post-Launch Support** (Bug fixes, feature updates)

### 16.3 Maintenance Schedule
- **Daily**: Monitor server uptime and error logs
- **Weekly**: Bug fixes and minor updates
- **Monthly**: Feature updates and improvements
- **Quarterly**: Performance reviews and optimizations
- **Annually**: Major updates and new features

---

## 17. CONCLUSION

**SpeakPro AI** leverages modern Flutter development practices and AI technology to create a transformative learning experience for HUMSS students. By developing with Flutter in Android Studio, the team benefits from:

- **Cross-platform capability** (Android & iOS from single codebase)
- **Fast development cycles** (Hot reload feature)
- **Beautiful UI** (Material Design 3 & Cupertino)
- **Excellent performance** (Native compilation)
- **Strong community** (Extensive packages & support)

The system addresses critical gaps in traditional public speaking education while maintaining scalability, security, and user engagement throughout the learning journey.

---

**System Design Document**  
**Project**: SpeakPro AI - Public Speaking Learning System  
**Technology Stack**: Flutter + Firebase + Google Cloud AI  
**Development Environment**: Android Studio  
**Institution**: Cebu Eastern College  
**Date**: October 2, 2026  
**Status**: Ready for Development
