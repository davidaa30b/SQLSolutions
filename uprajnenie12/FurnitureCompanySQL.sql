SELECT p.Product_ID,p.Product_Description,COUNT(*) AS Times_Ordered
FROM PRODUCT p JOIN ORDER_LINE o ON 
p.Product_ID = o.Product_ID
WHERE o.Ordered_Quantity > 0 
GROUP BY p.Product_ID,p.Product_Description


SELECT p.Product_ID,p.Product_Description,SUM(O.Ordered_Quantity) AS Total_Quantity_Ordered
FROM PRODUCT p LEFT JOIN ORDER_LINE o ON 
p.Product_ID = o.Product_ID
GROUP BY p.Product_ID,p.Product_Description 

SELECT c.Customer_Name , SUM(p.Standard_Price * ol.Ordered_Quantity) AS Order_Amount
FROM CUSTOMER c LEFT JOIN ORDER_T ot
ON c.Customer_ID = ot.Customer_ID LEFT JOIN ORDER_LINE ol
ON ot.Order_ID = ol.Order_ID LEFT JOIN PRODUCT p
ON ol.Product_ID = p.Product_ID
GROUP BY c.Customer_Name



