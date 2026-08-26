
# AI Pair-Programming Log

**Goal:** Build a synthetic data generator and experimentation matrix for Cityflo bus telemetry.

### Where AI Succeeded
* Scaffolding the initial Random Forest regressor and generating synthetic distributions using NumPy.
* Writing the boilerplate dbt Common Table Expression (CTE) structures.

### Where I Overrode the AI (The Judgment Check)
* **The Bug:** The AI initially suggested a complex deep learning approach (LSTM) for predicting the ETA delay.
* **The Override:** I explicitly rejected the LSTM. For a fleet of 1,200 buses needing real-time dispatch decisions, an LSTM introduces unnecessary latency and compute costs. I steered the model back to comparing a simple SQL-based heuristic against a lightweight Random Forest to prove business value before scaling complexity.
