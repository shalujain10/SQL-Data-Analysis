CREATE DATABASE MobilePhonesDB;
USE MobilePhonesDB;

/*Relationship between actual price and discount*/
SELECT 
    Mobile_Company, 
    Mobile_Model, 
    Actual_Price, 
    Discount, 
    (Discount / Actual_Price) * 100 AS Discount_Percentage
FROM 
    Mobile_phones
ORDER BY 
    Discount_Percentage DESC;	
    
    /*Mobile company with the highest discount*/
    SELECT 
    Mobile_Company, 
    MAX((Discount / Actual_Price) * 100) AS Max_Discount_Percentage
FROM 
    Mobile_phones
GROUP BY 
    Mobile_Company
ORDER BY 
    Max_Discount_Percentage DESC
LIMIT 1;

/*Relationship between star rating and reviews/ratings*/
SELECT 
    Mobile_Company, 
    Mobile_Model, 
    Stars, 
    Ratings, 
    Reviews
FROM 
    Mobile_phones
ORDER BY 
    Stars DESC;
    
    /*Relationship between RAM and pricing*/
    SELECT 
    Mobile_Company, 
    Mobile_Model, 
    RAM_GB, 
    Actual_Price, 
    Discount_Price
FROM 
    Mobile_phones
ORDER BY 
    RAM_GB DESC, 
    Discount_Price ASC;
    
    /*Best price-to-features ratio (RAM, storage, camera)*/
    SELECT 
    Mobile_Company, 
    Mobile_Model, 
    (RAM_GB + Storage_GB + CAST(SUBSTRING_INDEX(Camera, 'MP', 1) AS DECIMAL)) / Discount_Price AS Features_Price_Ratio
FROM 
    Mobile_phones
ORDER BY 
    Features_Price_Ratio DESC
LIMIT 1;

/*Comparison of high-priced vs. mid-range phones*/
SELECT 
    Mobile_Company, 
    Mobile_Model, 
    Stars, 
    CASE 
        WHEN Actual_Price > 50000 THEN 'High-Priced'
        WHEN Actual_Price BETWEEN 20000 AND 50000 THEN 'Mid-Range'
        ELSE 'Low-Priced'
    END AS Price_Category
FROM 
    Mobile_phones
ORDER BY 
    Stars DESC;
    
    /*Average discount percentage by company*/
    SELECT 
    Mobile_Company, 
    AVG((Discount / Actual_Price) * 100) AS Avg_Discount_Percentage
FROM 
    Mobile_phones
GROUP BY 
    Mobile_Company
ORDER BY 
    Avg_Discount_Percentage DESC;
    
    /*Patterns between display size and ratings/reviews*/
    SELECT 
    Mobile_Company, 
    Mobile_Model, 
    Display_Size_Inch, 
    Stars, 
    Ratings, 
    Reviews
FROM 
    Mobile_phones
ORDER BY 
    Display_Size_Inch DESC, 
    Stars DESC;
    
    /*Impact of camera quality on rating/reviews*/
    SELECT 
    Mobile_Company, 
    Mobile_Model, 
    Stars, 
    Ratings, 
    Reviews, 
    CAST(SUBSTRING_INDEX(Camera, 'MP', 1) AS DECIMAL) AS Camera_MP
FROM 
    Mobile_phones
ORDER BY 
    Camera_MP DESC, 
    Stars DESC;
    
    /*Highest reviews relative to price*/
    SELECT 
    Mobile_Company, 
    Mobile_Model, 
    Reviews, 
    Discount_Price, 
    Reviews / Discount_Price AS Reviews_Per_Price
FROM 
    Mobile_phones
ORDER BY 
    Reviews_Per_Price DESC
LIMIT 1;


