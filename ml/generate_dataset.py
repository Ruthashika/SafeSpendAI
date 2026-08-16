import pandas as pd
import numpy as np
import os

# ============================================================
# SafeSpend AI - Improved Synthetic Financial Dataset
# ============================================================

np.random.seed(42)

N = 10000


# ============================================================
# 1. BASIC USER INFORMATION
# ============================================================

user_id = [
    f"USER_{i:05d}"
    for i in range(1, N + 1)
]

age = np.random.randint(18, 65, N)

occupation = np.random.choice(
    [
        "Student",
        "Software Engineer",
        "Teacher",
        "Doctor",
        "Business Owner",
        "Government Employee",
        "Private Employee",
        "Freelancer",
        "Accountant",
        "Designer",
        "Other"
    ],
    N,
    p=[
        0.15,
        0.15,
        0.08,
        0.05,
        0.08,
        0.08,
        0.15,
        0.08,
        0.06,
        0.05,
        0.07
    ]
)

city_tier = np.random.choice(
    ["Tier 1", "Tier 2", "Tier 3"],
    N,
    p=[0.40, 0.35, 0.25]
)

dependents = np.random.randint(0, 5, N)


# ============================================================
# 2. MONTHLY INCOME
# ============================================================

income_ranges = {
    "Student": (8000, 25000),
    "Software Engineer": (40000, 180000),
    "Teacher": (25000, 80000),
    "Doctor": (60000, 250000),
    "Business Owner": (40000, 300000),
    "Government Employee": (30000, 120000),
    "Private Employee": (25000, 100000),
    "Freelancer": (20000, 120000),
    "Accountant": (30000, 100000),
    "Designer": (25000, 100000),
    "Other": (15000, 80000)
}

monthly_income = np.array([
    np.random.randint(*income_ranges[occ])
    for occ in occupation
])


# ============================================================
# 3. CITY COST MULTIPLIER
# ============================================================

city_multiplier = np.where(
    city_tier == "Tier 1",
    1.25,
    np.where(
        city_tier == "Tier 2",
        1.00,
        0.80
    )
)


# ============================================================
# 4. MONTHLY EXPENSES
# ============================================================

# Rent
rent = (
    monthly_income
    * np.random.uniform(0.10, 0.30, N)
    * city_multiplier
)

rent = np.where(
    occupation == "Student",
    np.random.uniform(3000, 12000, N),
    rent
)

rent = np.clip(rent, 2000, None)


# Loan
loan_payment = (
    monthly_income
    * np.random.uniform(0.00, 0.30, N)
)

loan_payment = np.where(
    np.random.random(N) < 0.40,
    loan_payment,
    0
)


# Insurance
insurance = (
    monthly_income
    * np.random.uniform(0.01, 0.05, N)
)


# Groceries
groceries = (
    2500
    + dependents * np.random.uniform(1000, 2500, N)
    + monthly_income * np.random.uniform(0.03, 0.08, N)
)


# Transport
transport = (
    monthly_income
    * np.random.uniform(0.03, 0.10, N)
    * city_multiplier
)


# Eating out
eating_out = (
    monthly_income
    * np.random.uniform(0.01, 0.10, N)
)


# Entertainment
entertainment = (
    monthly_income
    * np.random.uniform(0.01, 0.08, N)
)


# Utilities
utilities = (
    1000
    + dependents * np.random.uniform(200, 500, N)
    + monthly_income * np.random.uniform(0.01, 0.04, N)
)


# Healthcare
healthcare = (
    500
    + dependents * np.random.uniform(300, 1000, N)
    + monthly_income * np.random.uniform(0.005, 0.04, N)
)


# Education
education = np.where(
    np.random.random(N) < 0.35,
    monthly_income * np.random.uniform(0.01, 0.10, N),
    0
)


# Other expenses
other_expenses = (
    monthly_income
    * np.random.uniform(0.01, 0.08, N)
)


# ============================================================
# 5. ROUND EXPENSES
# ============================================================

expense_arrays = [
    rent,
    loan_payment,
    insurance,
    groceries,
    transport,
    eating_out,
    entertainment,
    utilities,
    healthcare,
    education,
    other_expenses
]

expense_arrays = [
    np.round(x / 10) * 10
    for x in expense_arrays
]

(
    rent,
    loan_payment,
    insurance,
    groceries,
    transport,
    eating_out,
    entertainment,
    utilities,
    healthcare,
    education,
    other_expenses
) = expense_arrays


# ============================================================
# 6. TOTAL EXPENSES
# ============================================================

total_expenses = (
    rent
    + loan_payment
    + insurance
    + groceries
    + transport
    + eating_out
    + entertainment
    + utilities
    + healthcare
    + education
    + other_expenses
)


# ============================================================
# 7. MONTHLY SAVINGS
# ============================================================

# IMPORTANT:
# Negative savings are allowed.
# This represents overspending.

monthly_savings = (
    monthly_income
    - total_expenses
)

monthly_savings = np.round(
    monthly_savings / 10
) * 10


# ============================================================
# 8. SAVINGS GOAL
# ============================================================

savings_goal = np.random.choice(
    [
        "Emergency Fund",
        "Education",
        "Travel",
        "House",
        "Vehicle",
        "Retirement",
        "Investment",
        "No Specific Goal"
    ],
    N,
    p=[
        0.20,
        0.10,
        0.12,
        0.10,
        0.10,
        0.10,
        0.18,
        0.10
    ]
)


# ============================================================
# 9. FINANCIAL FEATURES
# ============================================================

savings_rate = (
    monthly_savings / monthly_income
)

debt_ratio = (
    loan_payment / monthly_income
)

expense_ratio = (
    total_expenses / monthly_income
)

discretionary_ratio = (
    eating_out
    + entertainment
    + other_expenses
) / monthly_income


# ============================================================
# 10. FINANCIAL HEALTH SCORE
# ============================================================

# Savings score: 0-40
savings_score = np.clip(
    savings_rate / 0.30,
    0,
    1
) * 40


# Debt score: 0-25
debt_score = (
    1 - np.clip(
        debt_ratio / 0.40,
        0,
        1
    )
) * 25


# Expense score: 0-20
expense_score = (
    1 - np.clip(
        (expense_ratio - 0.50) / 0.60,
        0,
        1
    )
) * 20


# Discretionary score: 0-15
discretionary_score = (
    1 - np.clip(
        discretionary_ratio / 0.30,
        0,
        1
    )
) * 15


financial_health_score = (
    savings_score
    + debt_score
    + expense_score
    + discretionary_score
)


# Additional realistic noise
financial_health_score += np.random.normal(
    0,
    3,
    N
)


# Keep between 0 and 100
financial_health_score = np.clip(
    financial_health_score,
    0,
    100
)

financial_health_score = np.round(
    financial_health_score,
    2
)


# ============================================================
# 11. FINANCIAL HEALTH CATEGORY
# ============================================================

financial_health_category = np.select(
    [
        financial_health_score < 40,
        financial_health_score < 70
    ],
    [
        "At Risk",
        "Moderate"
    ],
    default="Healthy"
)


# ============================================================
# 12. CREATE DATAFRAME
# ============================================================

df = pd.DataFrame({

    "user_id": user_id,

    "age": age,

    "monthly_income": monthly_income,

    "occupation": occupation,

    "city_tier": city_tier,

    "dependents": dependents,

    "rent": rent,

    "loan_payment": loan_payment,

    "insurance": insurance,

    "groceries": groceries,

    "transport": transport,

    "eating_out": eating_out,

    "entertainment": entertainment,

    "utilities": utilities,

    "healthcare": healthcare,

    "education": education,

    "other_expenses": other_expenses,

    "total_expenses": total_expenses,

    "monthly_savings": monthly_savings,

    "savings_goal": savings_goal,

    "financial_health_score": financial_health_score,

    "financial_health_category": financial_health_category
})


# ============================================================
# 13. CREATE DATA DIRECTORY
# ============================================================

os.makedirs(
    "data",
    exist_ok=True
)


# ============================================================
# 14. SAVE DATASET
# ============================================================

output_path = (
    "data/safespend_synthetic_finance.csv"
)

df.to_csv(
    output_path,
    index=False
)


# ============================================================
# 15. VALIDATION
# ============================================================

print("=" * 60)
print("SafeSpend AI Dataset Generated")
print("=" * 60)

print(
    f"Rows: {len(df)}"
)

print(
    f"Columns: {len(df.columns)}"
)

print(
    f"Saved to: {output_path}"
)


print("\nDataset preview:")
print(
    df.head()
)


print("\nMissing values:")
print(
    df.isnull().sum().sum()
)


print("\nFinancial Health Score Statistics:")
print(
    df[
        "financial_health_score"
    ].describe()
)


print("\nFinancial Health Category Distribution:")
print(
    df[
        "financial_health_category"
    ].value_counts()
)


print("\nScores exactly 100:")
print(
    (
        df[
            "financial_health_score"
        ] == 100
    ).sum()
)


print("\nScores exactly 0:")
print(
    (
        df[
            "financial_health_score"
        ] == 0
    ).sum()
)


print("\nNegative Savings Users:")
print(
    (
        df[
            "monthly_savings"
        ] < 0
    ).sum()
)


print("\nDataset generated successfully!")