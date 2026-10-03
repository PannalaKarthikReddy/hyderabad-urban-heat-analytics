# Data Dictionary

## Hyderabad Urban Heat & Livability Analytics — 2025

The final analytical dataset contains one record per GHMC ward and combines ward boundaries, 2011 Census population information, Landsat-derived surface temperature, and Sentinel-2-derived vegetation and built-up intensity indicators.

| Column | Description |
|---|---|
| `ward_id` | GHMC ward identifier |
| `ward_name` | GHMC ward name |
| `circle` | GHMC administrative circle |
| `zone` | GHMC administrative zone |
| `area_sq_km` | Ward area in square kilometers |
| `population_2011` | Ward population from the 2011 Census |
| `households_2011` | Number of households from the 2011 Census |
| `population_density_2011` | 2011 population divided by the current ward area |
| `lst_2025_c` | 2025 land surface temperature in degrees Celsius |
| `ndvi_2025` | 2025 Normalized Difference Vegetation Index |
| `ndbi_2025` | 2025 Normalized Difference Built-up Index |
| `heat_percentile` | Relative percentile position of ward-level surface temperature |
| `vegetation_percentile` | Relative percentile position of ward-level NDVI |
| `built_up_percentile` | Relative percentile position of ward-level NDBI |
| `density_percentile` | Relative percentile position of ward-level population density |
| `heat_rank` | Rank based on surface temperature, highest first |
| `vegetation_rank` | Rank based on vegetation index, highest first |
| `built_up_intensity_rank` | Rank based on built-up intensity, highest first |
| `heat_level` | Temperature category based on ward-level percentile groups |
| `vegetation_level` | Vegetation category based on ward-level percentile groups |
| `built_up_level` | Built-up intensity category based on ward-level percentile groups |
| `heat_density_category` | Combined heat and population-density category |
| `geometry` | Cleaned GHMC ward polygon geometry |

## Source Data

### GHMC Ward Boundaries

Ward boundaries were obtained from the Telangana Geographic Information System (TGRAC) GHMC service.

The final boundary dataset contains 150 numbered GHMC wards after excluding non-standard administrative records and repairing invalid geometries.

### Population

Population and household figures are based on the 2011 Census of India Primary Census Abstract datasets for Hyderabad and Rangareddy.

Population density is calculated using the 2011 population and the current GHMC ward boundary area. Therefore, population density should be interpreted as an approximate historical baseline because Census and current ward boundaries may not perfectly match.

### Surface Temperature

Land Surface Temperature (LST) was derived from Landsat 8 and Landsat 9 Collection 2 Level-2 thermal imagery acquired during March and April 2025.

Cloud and cloud-shadow pixels were excluded using the Landsat quality-assurance mask.

The final ward-level value represents the median of the available scene-level ward statistics.

### Vegetation

Vegetation was measured using NDVI derived from Sentinel-2 Level-2A imagery acquired during March and April 2025.

The analysis uses Sentinel-2 red and near-infrared bands. Scene-level measurements were aggregated to the ward level.

### Built-up Intensity

Built-up intensity was measured using NDBI derived from Sentinel-2 imagery.

NDBI is used as a spectral indicator of built-up intensity. It should not be interpreted as a direct percentage of built-up land area.

## Analytical Notes

Correlation results describe statistical association between variables and should not be interpreted as evidence of causation.

The population component uses 2011 Census data, while the environmental indicators represent 2025 conditions. Therefore, population-density results should be interpreted as a historical population baseline rather than a 2025 population estimate.

Satellite-derived surface temperature represents land surface temperature rather than directly measured near-surface air temperature.
