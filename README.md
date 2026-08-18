# 💰 SafeSpend AI

### AI-Powered Financial Health Assessment & Personalized Insights

SafeSpend AI is an AI-powered financial assessment application that helps users understand their financial health using their income, expenses, savings, debt, and other financial indicators.

The system combines a **Flutter web/mobile frontend**, **FastAPI backend**, financial metric processing, and a **Random Forest machine learning model** to transform financial inputs into a **Financial Health Score, financial insights, and personalized recommendations**.

The project was developed as a solo submission for **SmartAIthon 2026**.

---

## 👤 Team

| Role        | Details              |
| ----------- | -------------------- |
| Team Name   | **The Coder**        |
| Team Leader | **Ashika Ruth M J**  |
| Team Size   | **1**                |
| Hackathon   | **SmartAIthon 2026** |

---

## 🌐 Project Links

* **Live Prototype:** [SafeSpend AI Web App](https://safespend-ai.web.app?utm_source=chatgpt.com)
* **GitHub Repository:** [SafeSpendAI GitHub Repository](https://github.com/Ruthashika/SafeSpendAI?utm_source=chatgpt.com)
* **Backend API:** [SafeSpend AI Backend API](https://safespendai.onrender.com?utm_source=chatgpt.com)
* **Demo Video:** [Demo Video](https://drive.google.com/file/d/1PQuVQUqzBdMce3I7qATKuw1_8cJSCeca/view?usp=drive_link&utm_source=chatgpt.com)
* **Workflow Video:** [Workflow Video](https://drive.google.com/file/d/1tI1vF2oHrV6J36mxqIZY7m3_hiEHezCU/view?usp=drive_link&utm_source=chatgpt.com)

---

# 📌 1. Project Overview

Managing personal finances requires more than simply knowing how much money is earned or spent.

Users may have difficulty determining:

* Whether their spending level is sustainable.
* Whether they are saving enough.
* How debt affects their financial position.
* Whether their current financial situation indicates financial risk.
* Which areas of their finances should be improved first.

SafeSpend AI addresses this by combining financial calculations with machine learning-based assessment.

Instead of returning only raw financial numbers, the system converts user-provided financial information into:

* A Financial Health Score
* A financial health classification
* Prediction probabilities
* Financial insights
* Personalized recommendations

The goal is to provide an accessible **AI-assisted financial decision-support tool**.

---

# ❗ 2. Problem Statement

Many financial tools focus primarily on recording income and expenses.

However, simply displaying financial transactions does not necessarily tell a user whether their overall financial position is healthy.

There is a need for a system that can:

1. Analyze multiple financial indicators together.
2. Identify potential financial risks.
3. Provide an understandable financial health assessment.
4. Convert analysis into actionable recommendations.

SafeSpend AI was designed to address this gap through an end-to-end machine learning pipeline.

---

# 💡 3. Proposed Solution

SafeSpend AI provides a simple interface where users enter their financial information.

The information is sent to a backend API, validated, processed into financial features, and passed to a trained Random Forest classifier.

The resulting prediction is combined with financial analysis to generate:

```text
Financial Input
      ↓
Financial Metrics
      ↓
Machine Learning Prediction
      ↓
Prediction Probabilities
      ↓
Financial Health Score
      ↓
Insights
      ↓
Recommendations
```

The final result is returned to the frontend and displayed through the SafeSpend AI interface.

---

# ⭐ 4. Key Features

### 📊 Financial Health Assessment

Evaluates the user's financial situation using multiple financial indicators.

### 🤖 Machine Learning Prediction

Uses a trained **Random Forest classifier** to classify the user's financial health.

### 💰 Financial Metric Analysis

Derives meaningful indicators from the user's financial inputs.

### 📈 Financial Health Score

Converts the financial assessment into a user-friendly score.

### 💡 AI-Assisted Insights

Highlights potential strengths and areas requiring attention.

### 🎯 Recommendations

Provides actionable suggestions based on the user's financial profile.

### 🌐 Web Application

The Flutter application is deployed as a web prototype for easy access.

### ⚡ REST API

FastAPI provides the backend interface connecting the frontend with the machine learning pipeline.

---

# 🏗️ 5. System Architecture

```text
                 ┌────────────────────────┐
                 │     Flutter Frontend   │
                 │      Web / Mobile      │
                 └────────────┬───────────┘
                              │
                              │ Financial Input
                              ▼
                 ┌────────────────────────┐
                 │    SafeSpend API       │
                 │      POST /predict     │
                 └────────────┬───────────┘
                              │
                              ▼
                 ┌────────────────────────┐
                 │       FastAPI          │
                 │       Backend          │
                 └────────────┬───────────┘
                              │
                              ▼
                 ┌────────────────────────┐
                 │  Pydantic Validation   │
                 └────────────┬───────────┘
                              │
                              ▼
                 ┌────────────────────────┐
                 │  Financial Metric      │
                 │      Calculation       │
                 └────────────┬───────────┘
                              │
                              ▼
                 ┌────────────────────────┐
                 │   Feature Processing   │
                 └────────────┬───────────┘
                              │
                              ▼
                 ┌────────────────────────┐
                 │   Random Forest        │
                 │     Classifier         │
                 └────────────┬───────────┘
                              │
                              ▼
                 ┌────────────────────────┐
                 │ Prediction Probabilities│
                 └────────────┬───────────┘
                              │
                              ▼
                 ┌────────────────────────┐
                 │ Financial Health Score │
                 └────────────┬───────────┘
                              │
                              ▼
                 ┌────────────────────────┐
                 │ Insights &             │
                 │ Recommendations        │
                 └────────────┬───────────┘
                              │
                              │ JSON Response
                              ▼
                 ┌────────────────────────┐
                 │     Flutter UI         │
                 │    Final Results       │
                 └────────────────────────┘
```

---

# 🛠️ 6. Technology Stack

| Component           | Technology               |
| ------------------- | ------------------------ |
| Frontend            | Flutter                  |
| Frontend Language   | Dart                     |
| Backend             | FastAPI                  |
| Backend Language    | Python                   |
| API Validation      | Pydantic                 |
| Machine Learning    | Scikit-learn             |
| ML Algorithm        | Random Forest Classifier |
| Data Processing     | Pandas                   |
| Model Serialization | Joblib                   |
| Version Control     | Git / GitHub             |
| Web Deployment      | Firebase Hosting         |
| Backend Deployment  | Render                   |

---

# 🔄 7. End-to-End Workflow

The complete SafeSpend AI pipeline works as follows.

### Step 1 — User Input

The user enters their financial information through the Flutter interface.

The application collects relevant information related to income, expenses, savings, debt, and other financial indicators.

### Step 2 — Request Creation

The frontend converts the collected values into a structured JSON payload.

The request is sent to:

```text
POST /predict
```

### Step 3 — API Reception

FastAPI receives the request and passes the data through the defined request schema.

### Step 4 — Input Validation

Pydantic validates the incoming data before it reaches the machine learning pipeline.

This prevents malformed data from being processed.

### Step 5 — Financial Feature Processing

The backend calculates derived financial indicators from the raw input.

These features provide a more meaningful representation of the user's financial situation.

### Step 6 — Machine Learning Prediction

The processed features are passed to the trained Random Forest classifier.

The model produces:

* Predicted financial health category
* Prediction probabilities

### Step 7 — Financial Health Score

The prediction and financial indicators are used by the application's scoring logic to generate a Financial Health Score.

### Step 8 — Insights

The system evaluates the user's financial indicators to identify areas that may require attention.

### Step 9 — Recommendations

The system generates recommendations based on the detected financial patterns.

### Step 10 — API Response

The final results are returned to the frontend as structured JSON.

### Step 11 — User Interface

Flutter receives the response and displays the final financial assessment.

---

# 📱 8. Frontend Implementation

The frontend is built using **Flutter**.

The main responsibilities of the frontend are:

* Collecting financial inputs.
* Providing the user interface.
* Sending API requests.
* Receiving API responses.
* Parsing returned JSON.
* Displaying the Financial Health Score.
* Displaying insights.
* Displaying recommendations.

The frontend communicates with the backend through an HTTP REST API.

Conceptually:

```text
Flutter UI
    ↓
User Input
    ↓
JSON Payload
    ↓
POST /predict
    ↓
Backend Response
    ↓
JSON Parsing
    ↓
Results UI
```

The same application can be used as a deployed web prototype, while the backend remains responsible for prediction processing.

---

# ⚙️ 9. Backend Implementation

The backend is implemented using **FastAPI**.

FastAPI acts as the central processing layer between the frontend and machine learning model.

Its responsibilities include:

```text
Receive Request
      ↓
Validate Data
      ↓
Calculate Financial Metrics
      ↓
Prepare Model Features
      ↓
Load Trained Model
      ↓
Generate Prediction
      ↓
Generate Probabilities
      ↓
Calculate Health Score
      ↓
Generate Insights
      ↓
Generate Recommendations
      ↓
Return JSON
```

The backend is deployed through Render and is accessible through the project's backend URL.

---

# 🌐 10. API

The primary prediction endpoint is:

```text
POST /predict
```

### Request Flow

```text
Flutter
   ↓
HTTP POST
   ↓
/predict
   ↓
FastAPI
```

The request contains the user's financial information.

The backend validates and processes these values before passing the resulting features to the trained model.

### Response Flow

```text
Random Forest Prediction
          ↓
Financial Analysis
          ↓
Score + Insights + Recommendations
          ↓
JSON Response
          ↓
Flutter
```

A conceptual response structure is:

```json
{
  "prediction": "...",
  "probabilities": "...",
  "financial_health_score": "...",
  "insights": [],
  "recommendations": []
}
```

The exact response structure should be verified against the current backend implementation.

---

# 📊 11. Financial Metric Processing

SafeSpend AI does not rely only on raw financial values.

The backend derives financial indicators from the submitted data.

Examples include:

### Savings Rate

```text
Savings Rate =
Savings / Income × 100
```

### Expense Ratio

```text
Expense Ratio =
Expenses / Income × 100
```

### Debt-Related Indicators

Debt information is considered relative to the user's overall financial position to identify potential financial pressure.

These derived metrics are used as part of the feature-processing stage before machine learning prediction.

> The exact feature set and formulas should remain synchronized with the implementation in the repository.

---

# 🤖 12. Machine Learning Implementation

SafeSpend AI uses a **Random Forest Classifier**.

Random Forest is an ensemble learning algorithm that combines predictions from multiple decision trees.

This approach was selected because it can model nonlinear relationships between multiple financial indicators and is suitable for classification problems involving structured numerical data.

The model training workflow is:

```text
Financial Dataset
      ↓
Data Preparation
      ↓
Feature Selection
      ↓
Training Data
      ↓
Random Forest Classifier
      ↓
Trained Model
      ↓
Model Serialization
```

The trained model is saved and loaded by the backend for inference.

The backend then uses the trained model to process new user financial inputs.

---

# 🔬 13. Prediction Pipeline

During inference, the system follows:

```text
User Input
     ↓
Validation
     ↓
Financial Metric Calculation
     ↓
Feature Preparation
     ↓
Random Forest
     ↓
Prediction
     +
Prediction Probability
     ↓
Financial Health Score
     ↓
Insights
     ↓
Recommendations
```

The use of prediction probabilities allows the system to obtain more information than simply the final predicted class.

---

# 📈 14. Financial Health Score

The machine learning model produces a financial health classification.

SafeSpend AI additionally converts the assessment into a **Financial Health Score** so that the result is easier for users to understand.

The score is presented together with supporting insights and recommendations rather than being treated as an isolated number.

The score is intended for **AI-assisted financial awareness and decision support**, not as a professional financial rating.

---

# 💡 15. Insights & Recommendations

The final output is designed to be actionable.

Instead of presenting only:

```text
Prediction = At Risk
```

the application provides additional context.

Examples of recommendation areas include:

### Spending

Identifying high spending relative to income and encouraging improved expense management.

### Savings

Highlighting low savings and encouraging users to strengthen their savings habits.

### Debt

Identifying debt-related financial pressure and highlighting debt management as an area for improvement.

### Overall Financial Readiness

Combining multiple financial indicators to provide a broader understanding of the user's current financial position.

---

# 🛡️ 16. Validation & Error Handling

Pydantic validation is used at the API layer to ensure that incoming requests follow the expected structure.

The processing flow is:

```text
Incoming Request
      ↓
Pydantic Validation
      ↓
   ┌──┴──┐
   │     │
 Valid  Invalid
   │     │
   ▼     ▼
Process  Error Response
```

This prevents invalid input from directly reaching the machine learning model.

The frontend also handles the API response and presents the resulting information to the user.

---

# 🧪 17. Testing & Verification

The project was tested across the main application layers.

### Frontend Testing

The Flutter application was tested for:

* Financial input
* Navigation
* API communication
* Result rendering
* User interface behavior

### Backend Testing

The API was tested for:

* Request handling
* Input validation
* Financial processing
* Model prediction
* JSON response generation

### End-to-End Testing

The complete pipeline was verified as:

```text
Flutter
  ↓
FastAPI
  ↓
Validation
  ↓
Financial Processing
  ↓
Random Forest
  ↓
Score
  ↓
Insights
  ↓
Recommendations
  ↓
Flutter Web Output
```

The deployed web prototype was used to verify the complete user-facing flow.

---

# 🖥️ 18. Deployment

SafeSpend AI uses separate deployment layers for the frontend and backend.

### Frontend

The Flutter web application is deployed using **Firebase Hosting**.

Live application:

[https://safespend-ai.web.app](https://safespend-ai.web.app?utm_source=chatgpt.com)

### Backend

The FastAPI backend is deployed using **Render**.

Backend:

[https://safespendai.onrender.com](https://safespendai.onrender.com?utm_source=chatgpt.com)

The frontend communicates with the deployed backend through the REST API.

---

# 📂 19. Repository Structure

The project is organized into separate frontend, backend, data, and machine learning components.

A simplified structure is:

```text
SafeSpendAI/
│
├── backend/
│   ├── api.py
│   └── requirements.txt
│
├── data/
│   └── safespend_synthetic_finance.csv
│
├── ml/
│   ├── generate_dataset.py
│   ├── train_model.py
│   └── safespend_model.pkl
│
├── mobile/
│   ├── lib/
│   │   └── main.dart
│   ├── android/
│   └── pubspec.yaml
│
└── README.md
```

### Main Components

**`mobile/lib/main.dart`**

Contains the Flutter application interface and API communication logic.

**`backend/api.py`**

Contains the FastAPI backend and prediction endpoint.

**`ml/generate_dataset.py`**

Generates the synthetic financial dataset used for model development.

**`ml/train_model.py`**

Handles machine learning model training.

**`ml/safespend_model.pkl`**

Serialized trained Random Forest model used during inference.

---

# 📸 20. Application Screenshots

## Financial Input

Add a screenshot of the financial input interface here.

```text
[INSERT SCREENSHOT]
```

## Financial Health Result

Add a screenshot showing the Financial Health Score.

```text
[INSERT SCREENSHOT]
```

## Insights & Recommendations

Add a screenshot showing the generated insights and recommendations.

```text
[INSERT SCREENSHOT]
```

---

# ⚠️ 21. Limitations

### Dataset

The current model is developed using a synthetic financial dataset. Synthetic data may not represent every real-world financial profile.

### User Input

The quality of the assessment depends on the accuracy of the information entered by the user.

### Generalization

The model provides a generalized assessment and may not capture every personal financial circumstance.

### Prediction Uncertainty

Machine learning predictions contain uncertainty and should be interpreted alongside the underlying financial indicators.

### Financial Advice

SafeSpend AI is an educational and decision-support application. It does **not** provide professional financial, investment, tax, or legal advice.

---

# 🔮 22. Future Enhancements

## 📚 Larger Real-World Dataset

Expand the training data using larger and more diverse financial profiles.

## 🔍 Explainable AI

Integrate explainability techniques such as feature importance or SHAP to show users which factors contributed to their prediction.

## 🎯 Financial Goal Planning

Allow users to define goals such as:

* Emergency fund
* Debt repayment
* Education
* Travel
* Major purchases

## 🔄 Transaction Integration

Future versions could integrate transaction data to reduce manual entry.

## 🧠 Advanced Recommendation Engine

Combine machine learning predictions with rule-based financial planning to generate more personalized recommendations.

## ☁️ Continuous Cloud-Based Monitoring

Future versions could support continuous financial monitoring and periodic model updates.

---

# 🔐 23. Privacy & Responsible AI

SafeSpend AI is designed as a financial awareness and decision-support application.

The system should not be interpreted as a replacement for professional financial advice.

Future versions can further improve privacy by implementing:

* Secure authentication
* Encrypted data transmission
* Secure data storage
* User-controlled data deletion
* Stronger privacy controls

---

# 🎥 24. Project Videos

### Demo Video

The demo video demonstrates the user-facing workflow of SafeSpend AI.

[Watch Demo Video](https://drive.google.com/file/d/1PQuVQUqzBdMce3I7qATKuw1_8cJSCeca/view?usp=drive_link&utm_source=chatgpt.com)

### Workflow Video

The workflow video demonstrates the developer flow:

```text
Flutter Frontend
      ↓
FastAPI
      ↓
Pydantic Validation
      ↓
Financial Processing
      ↓
Random Forest
      ↓
Financial Health Score
      ↓
Insights & Recommendations
      ↓
Flutter Web Output
```

[Watch Workflow Video](https://drive.google.com/file/d/1tI1vF2oHrV6J36mxqIZY7m3_hiEHezCU/view?usp=drive_link&utm_source=chatgpt.com)

---

# 🔗 25. Quick Access

| Resource          | Link                                                                                                                           |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| 🌐 Live Prototype | [Open SafeSpend AI](https://safespend-ai.web.app?utm_source=chatgpt.com)                                                       |
| 💻 GitHub         | [Open GitHub Repository](https://github.com/Ruthashika/SafeSpendAI?utm_source=chatgpt.com)                                     |
| ⚙️ Backend        | [Open Backend API](https://safespendai.onrender.com?utm_source=chatgpt.com)                                                    |
| 🎬 Demo           | [Watch Demo](https://drive.google.com/file/d/1PQuVQUqzBdMce3I7qATKuw1_8cJSCeca/view?usp=drive_link&utm_source=chatgpt.com)     |
| 🔧 Workflow       | [Watch Workflow](https://drive.google.com/file/d/1tI1vF2oHrV6J36mxqIZY7m3_hiEHezCU/view?usp=drive_link&utm_source=chatgpt.com) |

---

# 🏆 26. Hackathon Submission

**SafeSpend AI — The Coder**

SafeSpend AI demonstrates an end-to-end integration of:

**Flutter + FastAPI + Data Processing + Machine Learning + REST API + Cloud Deployment**

The project focuses on converting financial information into an understandable AI-assisted assessment rather than presenting users with raw financial data alone.

The complete pipeline connects the user interface, backend processing, machine learning prediction, scoring logic, insights, recommendations, and final web output into one integrated application.

---

# 👩‍💻 27. Team

### The Coder

**Team Leader:** Ashika Ruth M J
**Team Size:** 1
**Hackathon:** SmartAIthon 2026

---

## ⭐ SafeSpend AI

> **Turning financial data into understandable, AI-assisted financial insights.**
