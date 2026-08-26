WITH raw_telemetry AS (
    SELECT * FROM {{ ref('stg_kafka_bus_pings') }}
),
delay_metrics AS (
    SELECT
        route_id,
        bus_id,
        DATE_TRUNC('hour', ping_timestamp) as transit_hour,
        AVG(occupancy_pct) as avg_occupancy,
        MAX(actual_eta_mins - scheduled_eta_mins) as peak_delay_drift
    FROM raw_telemetry
    GROUP BY 1, 2, 3
)
SELECT
    *,
    CASE
        WHEN peak_delay_drift > 15 AND avg_occupancy > 0.8 THEN 'CRITICAL_DISPATCH_NEEDED'
        ELSE 'HEALTHY'
    END AS intervention_flag
FROM delay_metrics
