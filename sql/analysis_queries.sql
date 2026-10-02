USE hyderabad_urban_heat_analytics;

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT ward_id) AS unique_wards,
    MIN(ward_id) AS min_ward_id,
    MAX(ward_id) AS max_ward_id
FROM ward_heat_analysis;

SELECT
    COUNT(*) AS missing_population_density
FROM ward_heat_analysis
WHERE population_density_2011 IS NULL;

SELECT
    zone,
    COUNT(*) AS ward_count,
    ROUND(AVG(lst_2025_c), 2) AS avg_lst_c,
    ROUND(AVG(ndvi_2025), 3) AS avg_ndvi,
    ROUND(AVG(ndbi_2025), 3) AS avg_ndbi
FROM ward_heat_analysis
GROUP BY zone
ORDER BY avg_lst_c DESC;

SELECT
    heat_level,
    COUNT(*) AS ward_count,
    ROUND(AVG(lst_2025_c), 2) AS avg_lst_c,
    ROUND(AVG(population_density_2011), 0) AS avg_population_density
FROM ward_heat_analysis
GROUP BY heat_level
ORDER BY
    CASE heat_level
        WHEN 'Highest Heat' THEN 1
        WHEN 'Higher Heat' THEN 2
        WHEN 'Moderate Heat' THEN 3
        WHEN 'Lower Heat' THEN 4
    END;

SELECT
    built_up_level,
    COUNT(*) AS ward_count,
    ROUND(AVG(lst_2025_c), 2) AS avg_lst_c,
    ROUND(AVG(ndbi_2025), 3) AS avg_ndbi
FROM ward_heat_analysis
GROUP BY built_up_level
ORDER BY avg_lst_c DESC;

SELECT
    vegetation_level,
    COUNT(*) AS ward_count,
    ROUND(AVG(lst_2025_c), 2) AS avg_lst_c,
    ROUND(AVG(ndvi_2025), 3) AS avg_ndvi
FROM ward_heat_analysis
GROUP BY vegetation_level
ORDER BY avg_lst_c DESC;

SELECT
    heat_density_category,
    COUNT(*) AS ward_count,
    ROUND(AVG(lst_2025_c), 2) AS avg_lst_c,
    ROUND(AVG(population_density_2011), 0) AS avg_population_density,
    SUM(population_2011) AS population_2011
FROM ward_heat_analysis
GROUP BY heat_density_category
ORDER BY ward_count DESC;

SELECT
    ward_id,
    ward_name,
    zone,
    circle,
    ROUND(lst_2025_c, 2) AS surface_temperature_c,
    ROUND(ndvi_2025, 3) AS ndvi,
    ROUND(ndbi_2025, 3) AS ndbi,
    heat_level,
    vegetation_level,
    built_up_level,
    heat_density_category
FROM ward_heat_analysis
ORDER BY lst_2025_c DESC
LIMIT 10;

SELECT
    ward_id,
    ward_name,
    zone,
    circle,
    ROUND(lst_2025_c, 2) AS surface_temperature_c,
    ROUND(population_density_2011, 0) AS population_density,
    population_2011,
    heat_density_category
FROM ward_heat_analysis
WHERE heat_density_category = 'High Heat / High Density'
ORDER BY lst_2025_c DESC;

SELECT
    ward_id,
    ward_name,
    ROUND(lst_2025_c, 2) AS surface_temperature_c,
    ROUND(ndbi_2025, 3) AS built_up_intensity,
    built_up_intensity_rank
FROM ward_heat_analysis
ORDER BY ndbi_2025 DESC
LIMIT 10;

SELECT
    ward_id,
    ward_name,
    ROUND(lst_2025_c, 2) AS surface_temperature_c,
    ROUND(ndvi_2025, 3) AS vegetation_index,
    vegetation_rank
FROM ward_heat_analysis
ORDER BY ndvi_2025 DESC
LIMIT 10;

SELECT
    COUNT(*) AS high_heat_high_density_wards,
    SUM(population_2011) AS population_exposed
FROM ward_heat_analysis
WHERE heat_density_category = 'High Heat / High Density';
