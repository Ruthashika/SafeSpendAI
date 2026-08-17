# 💰 SafeSpend AI

### AI-Powered Personal Financial Health & Safe Spending Assistant

SafeSpend AI is an AI-powered financial health assistant that helps users understand their financial situation by analyzing income, expenses, debt, savings, and spending behavior.

The application combines a trained Machine Learning model with financial metric calculations and rule-based insights to provide a financial health prediction, confidence score, financial health score, and personalized recommendations.

---

## 🚀 Live Prototype

🌐 **Web Application:**  
https://safespend-ai.web.app

🔗 **GitHub Repository:**  
https://github.com/Ruthashika/SafeSpendAI

---

## 🎯 Problem Statement

Many individuals track their income and expenses but do not have a clear understanding of their overall financial health.

Traditional expense tracking applications mainly show spending data, but they may not answer important questions such as:

- Am I financially healthy?
- Is my spending too high compared to my income?
- Is my debt burden becoming risky?
- Am I saving enough?
- Which areas of my spending should I improve?

SafeSpend AI addresses this problem by transforming financial information into an understandable financial health assessment.

---

## 💡 Our Solution

SafeSpend AI provides a complete financial analysis workflow:

**User Input → Flutter Application → FastAPI Backend → Financial Metrics → Machine Learning Prediction → Insights & Recommendations → User**

The system analyzes the user's financial information and generates:

- Financial health prediction
- Prediction confidence
- Financial health score
- Financial metrics
- Spending insights
- Personalized recommendations

---

## ✨ Key Features

### 📊 Financial Health Prediction

Uses a trained Random Forest classification model to categorize financial health into:

- Healthy
- Moderate
- At Risk

### 💯 Financial Health Score

Converts the model's class probabilities into a user-friendly score on a 0–100 scale.

### 📈 Financial Metrics

The backend calculates important indicators such as:

- Total expenses
- Monthly savings
- Savings rate
- Debt ratio
- Expense ratio
- Discretionary spending ratio

### 🧠 AI + Rule-Based Financial Analysis

The application combines Machine Learning predictions with financial rules to provide meaningful insights and recommendations.

### 💡 Personalized Recommendations

Recommendations are generated based on factors such as:

- Savings behavior
- Debt burden
- Overall spending
- Discretionary expenses
- Predicted financial health

### 🌐 Live Web Prototype

The Flutter application is deployed as a web application and connected to the deployed FastAPI backend.

---

# 🏗️ System Architecture

```text
                    ┌─────────────────────┐
                    │       User          │
                    │ Financial Information│
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │   Flutter Frontend  │
                    │  Mobile / Web App   │
                    └──────────┬──────────┘
                               │
                         REST API Request
                               │
                               ▼
                    ┌─────────────────────┐
                    │   FastAPI Backend   │
                    │    /predict API     │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │  Pydantic Validation│
                    │   Input Processing  │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │ Financial Metrics   │
                    │ Calculation Layer   │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │   Random Forest     │
                    │   Classifier (ML)   │
                    └──────────┬──────────┘
                               │
                    Prediction + Probabilities
                               │
                               ▼
                    ┌─────────────────────┐
                    │ Financial Analysis  │
                    │ Insights + Rules    │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │ API Response        │
                    │ Score + Insights +  │
                    │ Recommendations     │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │ Flutter Application │
                    │ User Results        │
                    └─────────────────────┘
