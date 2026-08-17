from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel, Field
import pandas as pd
import joblib
import os


# ============================================================
# SAFE SPEND AI - FASTAPI BACKEND
# ============================================================

app = FastAPI(
    title="SafeSpend AI",
    description="AI-powered financial health prediction API",
    version="3.0"
)
app.add_middleware(
    CORSMiddleware,
    allow_origins=[
        "https://safespend-ai.web.app",
        "https://safespend-ai.firebaseapp.com",
        "http://localhost:3000",
        "http://localhost:5000",
    ],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# ============================================================
# LOAD TRAINED ML MODEL
# ============================================================

MODEL_PATH = os.path.abspath(
    os.path.join(
        os.path.dirname(__file__),
        "..",
        "ml",
        "safespend_model.pkl"
    )
)


try:

    model = joblib.load(MODEL_PATH)

    print("SafeSpend AI ML model loaded successfully!")

except Exception as e:

    model = None

    print(f"Error loading ML model: {e}")


# ============================================================
# REQUEST MODEL
# ============================================================

class FinancialData(BaseModel):

    age: int = Field(
        ...,
        ge=18,
        le=100
    )

    monthly_income: float = Field(
        ...,
        gt=0
    )

    occupation: str

    city_tier: str

    dependents: int = Field(
        ...,
        ge=0
    )

    rent: float = Field(
        ...,
        ge=0
    )

    loan_payment: float = Field(
        ...,
        ge=0
    )

    insurance: float = Field(
        ...,
        ge=0
    )

    groceries: float = Field(
        ...,
        ge=0
    )

    transport: float = Field(
        ...,
        ge=0
    )

    eating_out: float = Field(
        ...,
        ge=0
    )

    entertainment: float = Field(
        ...,
        ge=0
    )

    utilities: float = Field(
        ...,
        ge=0
    )

    healthcare: float = Field(
        ...,
        ge=0
    )

    education: float = Field(
        ...,
        ge=0
    )

    other_expenses: float = Field(
        ...,
        ge=0
    )

    savings_goal: str


# ============================================================
# ROOT
# ============================================================

@app.get("/")
def root():

    return {

        "message":
            "SafeSpend AI API is running",

        "status":
            "online",

        "model":
            "Random Forest Classifier"

    }


# ============================================================
# HEALTH CHECK
# ============================================================

@app.get("/health")
def health():

    return {

        "status":
            "healthy",

        "model_loaded":
            model is not None

    }


# ============================================================
# CALCULATE FINANCIAL METRICS
# ============================================================

def calculate_metrics(data):

    # --------------------------------------------------------
    # Total expenses
    # --------------------------------------------------------

    total_expenses = (

        data.rent
        + data.loan_payment
        + data.insurance
        + data.groceries
        + data.transport
        + data.eating_out
        + data.entertainment
        + data.utilities
        + data.healthcare
        + data.education
        + data.other_expenses

    )


    # --------------------------------------------------------
    # Monthly savings
    # --------------------------------------------------------

    monthly_savings = (

        data.monthly_income
        - total_expenses

    )


    # --------------------------------------------------------
    # Ratios
    # --------------------------------------------------------

    savings_rate = (

        monthly_savings
        / data.monthly_income
    ) * 100


    debt_ratio = (

        data.loan_payment
        / data.monthly_income
    ) * 100


    expense_ratio = (

        total_expenses
        / data.monthly_income
    ) * 100


    discretionary_expenses = (

        data.eating_out
        + data.entertainment
        + data.other_expenses

    )


    discretionary_ratio = (

        discretionary_expenses
        / data.monthly_income

    ) * 100


    return {

        "total_expenses":
            round(
                total_expenses,
                2
            ),

        "monthly_savings":
            round(
                monthly_savings,
                2
            ),

        "savings_rate":
            round(
                savings_rate,
                2
            ),

        "debt_ratio":
            round(
                debt_ratio,
                2
            ),

        "expense_ratio":
            round(
                expense_ratio,
                2
            ),

        "discretionary_ratio":
            round(
                discretionary_ratio,
                2
            )

    }


# ============================================================
# GENERATE INSIGHTS
# ============================================================

def generate_insights(metrics):

    insights = []


    # --------------------------------------------------------
    # Savings
    # --------------------------------------------------------

    if metrics["savings_rate"] < 10:

        insights.append(
            "Your savings rate is low."
        )

    elif metrics["savings_rate"] >= 20:

        insights.append(
            "Your savings rate is strong."
        )

    else:

        insights.append(
            "Your savings rate is moderate."
        )


    # --------------------------------------------------------
    # Debt
    # --------------------------------------------------------

    if metrics["debt_ratio"] > 30:

        insights.append(
            "Your loan payments take up a significant portion of your income."
        )

    elif metrics["debt_ratio"] > 15:

        insights.append(
            "Your debt burden is moderate."
        )

    else:

        insights.append(
            "Your debt burden is relatively low."
        )


    # --------------------------------------------------------
    # Expenses
    # --------------------------------------------------------

    if metrics["expense_ratio"] > 90:

        insights.append(
            "Your total expenses are very close to your income."
        )

    elif metrics["expense_ratio"] > 75:

        insights.append(
            "A large portion of your income is being spent each month."
        )

    else:

        insights.append(
            "Your expenses are currently manageable relative to your income."
        )


    # --------------------------------------------------------
    # Discretionary spending
    # --------------------------------------------------------

    if metrics["discretionary_ratio"] > 20:

        insights.append(
            "Your discretionary spending could be reduced."
        )


    return insights


# ============================================================
# GENERATE RECOMMENDATIONS
# ============================================================

def generate_recommendations(
    metrics,
    prediction
):

    recommendations = []


    # --------------------------------------------------------
    # Savings recommendation
    # --------------------------------------------------------

    if metrics["savings_rate"] < 10:

        recommendations.append(
            "Try increasing your monthly savings gradually."
        )

    elif metrics["savings_rate"] < 20:

        recommendations.append(
            "Consider increasing your savings toward 20% of income."
        )

    else:

        recommendations.append(
            "Maintain your current savings habit."
        )


    # --------------------------------------------------------
    # Debt recommendation
    # --------------------------------------------------------

    if metrics["debt_ratio"] > 30:

        recommendations.append(
            "Prioritize reducing high-interest debt or loan obligations."
        )

    elif metrics["debt_ratio"] > 15:

        recommendations.append(
            "Monitor your loan payments and avoid taking on unnecessary debt."
        )


    # --------------------------------------------------------
    # Spending recommendation
    # --------------------------------------------------------

    if metrics["discretionary_ratio"] > 20:

        recommendations.append(
            "Consider reducing eating-out, entertainment, and other discretionary spending."
        )


    # --------------------------------------------------------
    # Risk recommendation
    # --------------------------------------------------------

    if prediction == "At Risk":

        recommendations.append(
            "Focus on building an emergency fund and reducing unnecessary expenses."
        )

    elif prediction == "Moderate":

        recommendations.append(
            "Small improvements in savings and spending can strengthen your financial health."
        )

    else:

        recommendations.append(
            "Continue maintaining healthy spending and saving habits."
        )


    return recommendations


# ============================================================
# PREDICTION ENDPOINT
# ============================================================

@app.post("/predict")
def predict_financial_health(
    data: FinancialData
):

    # --------------------------------------------------------
    # Check model
    # --------------------------------------------------------

    if model is None:

        raise HTTPException(
            status_code=500,
            detail="ML model is not loaded."
        )


    # --------------------------------------------------------
    # Calculate metrics
    # --------------------------------------------------------

    metrics = calculate_metrics(
        data
    )


    # --------------------------------------------------------
    # Prevent invalid financial state
    # --------------------------------------------------------

    if metrics["total_expenses"] < 0:

        raise HTTPException(
            status_code=400,
            detail="Expenses cannot be negative."
        )


    # --------------------------------------------------------
    # Create ML input
    # --------------------------------------------------------

    input_data = pd.DataFrame([{

        "age":
            data.age,

        "monthly_income":
            data.monthly_income,

        "occupation":
            data.occupation,

        "city_tier":
            data.city_tier,

        "dependents":
            data.dependents,

        "rent":
            data.rent,

        "loan_payment":
            data.loan_payment,

        "insurance":
            data.insurance,

        "groceries":
            data.groceries,

        "transport":
            data.transport,

        "eating_out":
            data.eating_out,

        "entertainment":
            data.entertainment,

        "utilities":
            data.utilities,

        "healthcare":
            data.healthcare,

        "education":
            data.education,

        "other_expenses":
            data.other_expenses,

        "total_expenses":
            metrics["total_expenses"],

        "monthly_savings":
            metrics["monthly_savings"],

        "savings_goal":
            data.savings_goal

    }])


    # ========================================================
    # ML PREDICTION
    # ========================================================

    prediction = model.predict(
        input_data
    )[0]


    probabilities = model.predict_proba(
        input_data
    )[0]


    classes = model.classes_


    probability_map = {

        str(class_name):

            round(
                float(probability) * 100,
                2
            )

        for class_name, probability

        in zip(
            classes,
            probabilities
        )

    }


    # --------------------------------------------------------
    # Confidence
    # --------------------------------------------------------

    confidence = round(
        float(
            max(probabilities)
        ) * 100,
        2
    )


    # ========================================================
    # USER-FACING FINANCIAL HEALTH SCORE
    # ========================================================

    # Convert ML probabilities into a smooth 0-100 score.
    #
    # Healthy = 100
    # Moderate = 60
    # At Risk = 20

    score = (

        probability_map.get(
            "Healthy",
            0
        ) * 1.0

        +

        probability_map.get(
            "Moderate",
            0
        ) * 0.6

        +

        probability_map.get(
            "At Risk",
            0
        ) * 0.2

    )


    score = round(
        score,
        2
    )


    # ========================================================
    # INSIGHTS
    # ========================================================

    insights = generate_insights(
        metrics
    )


    # ========================================================
    # RECOMMENDATIONS
    # ========================================================

    recommendations = generate_recommendations(
        metrics,
        prediction
    )


    # ========================================================
    # FINAL RESPONSE
    # ========================================================

    return {

        "prediction":
            str(prediction),

        "confidence":
            confidence,

        "financial_health_score":
            score,

        "probabilities":
            probability_map,

        "financial_metrics":
            metrics,

        "insights":
            insights,

        "recommendations":
            recommendations

    }