-- Campaign Performance Analysis
-- Goal: Practice basic SQL for marketing campaign performance:
-- impressions, clicks, CTR, conversions, conversion rate, cost per acquisition, and ROAS.

CREATE TABLE campaigns (
    campaign_id INTEGER,
    campaign_name TEXT,
    channel TEXT,
    impressions INTEGER,
    clicks INTEGER,
    conversions INTEGER,
    spend DECIMAL,
    revenue DECIMAL
);

INSERT INTO campaigns VALUES
(1, 'PreK-12 Awareness Campaign', 'Google Search', 12000, 840, 54, 250, 3200),
(2, 'LinkedIn B2B Campaign', 'LinkedIn', 8000, 240, 18, 600, 2100),
(3, 'Organic Content Push', 'Organic Search', 5000, 350, 22, 0, 1800),
(4, 'Display Retargeting', 'Google Display', 15000, 300, 15, 200, 900);

-- 1. Campaign performance metrics
SELECT
    campaign_name,
    channel,
    impressions,
    clicks,
    conversions,
    spend,
    revenue,
    ROUND((clicks * 100.0) / impressions, 2) AS ctr_percentage,
    ROUND((conversions * 100.0) / clicks, 2) AS conversion_rate_percentage,
    ROUND(spend / conversions, 2) AS cost_per_acquisition,
    ROUND(revenue / spend, 2) AS return_on_ad_spend
FROM campaigns
WHERE spend > 0
ORDER BY return_on_ad_spend DESC;

-- 2. Best campaigns by conversion volume
SELECT
    campaign_name,
    channel,
    conversions
FROM campaigns
ORDER BY conversions DESC;

-- 3. Campaign profitability
SELECT
    campaign_name,
    channel,
    revenue,
    spend,
    revenue - spend AS campaign_profit,
    CASE
        WHEN revenue > spend THEN 'Profitable'
        ELSE 'Not profitable'
    END AS profitability_status
FROM campaigns
ORDER BY campaign_profit DESC;
