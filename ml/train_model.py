import pandas as pd
import joblib

from sklearn.model_selection import train_test_split

from sklearn.compose import ColumnTransformer

from sklearn.preprocessing import OneHotEncoder

from sklearn.pipeline import Pipeline

from sklearn.ensemble import RandomForestClassifier

from sklearn.metrics import (
    accuracy_score,
    classification_report,
    confusion_matrix
)


# ============================================================
# SafeSpend AI - ML Training
# ============================================================

DATA_PATH = (
    "data/safespend_synthetic_finance.csv"
)

MODEL_PATH = (
    "ml/safespend_model.pkl"
)


# ============================================================
# 1. LOAD DATASET
# ============================================================

df = pd.read_csv(
    DATA_PATH
)

print("=" * 60)
print("SafeSpend AI ML Training")
print("=" * 60)

print(
    f"Dataset shape: {df.shape}"
)


# ============================================================
# 2. CHECK TARGET
# ============================================================

target_column = (
    "financial_health_category"
)

print("\nTarget distribution:")

print(
    df[
        target_column
    ].value_counts()
)


# ============================================================
# 3. FEATURES AND TARGET
# ============================================================

X = df.drop(
    columns=[
        "user_id",
        "financial_health_score",
        "financial_health_category"
    ]
)

y = df[
    target_column
]


# ============================================================
# 4. CATEGORICAL FEATURES
# ============================================================

categorical_features = [
    "occupation",
    "city_tier",
    "savings_goal"
]


# ============================================================
# 5. NUMERICAL FEATURES
# ============================================================

numerical_features = [
    column
    for column in X.columns
    if column not in categorical_features
]


print("\nCategorical features:")
print(
    categorical_features
)

print("\nNumerical features:")
print(
    numerical_features
)


# ============================================================
# 6. PREPROCESSING
# ============================================================

preprocessor = ColumnTransformer(

    transformers=[

        (
            "categorical",

            OneHotEncoder(
                handle_unknown="ignore"
            ),

            categorical_features
        )
    ],

    remainder="passthrough"
)


# ============================================================
# 7. RANDOM FOREST CLASSIFIER
# ============================================================

model = RandomForestClassifier(

    n_estimators=300,

    max_depth=15,

    min_samples_split=5,

    min_samples_leaf=2,

    class_weight="balanced",

    random_state=42,

    n_jobs=-1
)


# ============================================================
# 8. CREATE PIPELINE
# ============================================================

pipeline = Pipeline(

    steps=[

        (
            "preprocessor",
            preprocessor
        ),

        (
            "model",
            model
        )
    ]
)


# ============================================================
# 9. TRAIN / TEST SPLIT
# ============================================================

X_train, X_test, y_train, y_test = train_test_split(

    X,

    y,

    test_size=0.20,

    random_state=42,

    stratify=y
)


print(
    f"\nTraining samples: {len(X_train)}"
)

print(
    f"Testing samples: {len(X_test)}"
)


# ============================================================
# 10. TRAIN MODEL
# ============================================================

print("\nTraining Random Forest Classifier...")

pipeline.fit(
    X_train,
    y_train
)

print(
    "Training completed!"
)


# ============================================================
# 11. PREDICTION
# ============================================================

y_pred = pipeline.predict(
    X_test
)


# ============================================================
# 12. EVALUATION
# ============================================================

accuracy = accuracy_score(
    y_test,
    y_pred
)


print("\n" + "=" * 60)
print("MODEL PERFORMANCE")
print("=" * 60)

print(
    f"Accuracy: {accuracy:.4f}"
)


print("\nClassification Report:")

print(
    classification_report(
        y_test,
        y_pred
    )
)


print("\nConfusion Matrix:")

print(
    confusion_matrix(
        y_test,
        y_pred
    )
)


# ============================================================
# 13. SAVE MODEL
# ============================================================

joblib.dump(
    pipeline,
    MODEL_PATH
)


print("\nModel saved successfully!")

print(
    f"Location: {MODEL_PATH}"
)


# ============================================================
# 14. SAMPLE PREDICTIONS
# ============================================================

results = pd.DataFrame({

    "Actual": y_test.values[:15],

    "Predicted": y_pred[:15]

})


print("\nSample predictions:")

print(
    results
)


# ============================================================
# 15. PREDICTION PROBABILITIES
# ============================================================

probabilities = pipeline.predict_proba(
    X_test.iloc[:10]
)

classes = pipeline.classes_

probability_df = pd.DataFrame(
    probabilities,
    columns=classes
)

print("\nPrediction probabilities:")

print(
    probability_df
)


print("\n" + "=" * 60)
print("TRAINING FINISHED SUCCESSFULLY")
print("=" * 60)