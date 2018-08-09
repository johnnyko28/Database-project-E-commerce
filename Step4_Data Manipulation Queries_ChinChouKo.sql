-- These are the Database Manipulation queries for a implemented CS340 Database Project Website
-- Author: Chin-Chou Ko
-- Date: 2018.07.16

--get all information from Clients table
SELECT* FROM Clients

--get all information from Shopping Carts table
SELECT* FROM Shopping Carts

--get all information from Products table
SELECT* FROM Products

--get all information from Manufacturers table
SELECT* FROM Manufacturers


--add a new client
INSERT INTO Clients (id, first name, last name, gender, age, ManufacturersID) VALUES ([idInput], [first nameInput], [last nameInput], [genderInput], [ageInput], [Manufacturers_id_from_dropdown_Input])

--add a new shopping cart
INSERT INTO Shopping Carts (id, added date, qty, discount, amount, ClientsID) VALUES ([idInput], [added dateInput], [qtyInput], [discountInput], [amountInput], [Clients_id_from_dropdown_Input])

--add a new product
INSERT INTO Products (id, product name, description, price) VALUES ([idInput], [product nameInput], [descriptionInput], [priceInput])

--add a new manufacturer
INSERT INTO Clients (id, manufacturer name, country) VALUES ([idInput], [manufacturer nameInput], [countryInput])


--update a client's data based on submission of the Update client form 
UPDATE Clients SET id=[idInput], first name=[first nameInput], last name=[last nameInput], gender=[genderInput], age=[ageInput], ManufacturersID=[Manufacturers_id_from_dropdown_Input]

--update a shopping cart's data based on submission of the Update shopping cart form 
UPDATE Shopping Carts SET id=[idInput], added date=[added dateInput], qty=[qtyInput], discount=[discountInput], amount=[amountInput], ClientsID=[Clients_id_from_dropdown_Input]

--update a product's data based on submission of the Update product form 
UPDATE Products SET id=[idInput], product name=[product nameInput], description=[descriptionInput], price=[priceInput]

--update a manufactuer's data based on submission of the Update manufacturer form 
UPDATE Manufacturers SET id=[idInput], manufctuer name=[manufacturer nameInput], country=[countryInput]


--delete a client
DELETE FROM Clients WHERE id = [ID_selected_from_browse_CLients_page]

--delete a shopping cart
DELETE FROM Shoppoing Carts WHERE id = [ID_selected_from_browse_Shopping Carts_page]

--delete a product
DELETE FROM Products WHERE id = [ID_selected_from_browse_Products_page]

--delete a manufacturer
DELETE FROM Manufacturers WHERE id = [ID_selected_from_browse_Manufacturers_page]



--associate a shopping cart with a product (M-to-M relationship addition)
INSERT INTO Contain (ShoppingCartsID, ProductsID) VALUES ([Shopping Carts_id_from_dropdown_Input], [Products_id_from_dropdown_Input])

--associate a manufacurer with a product (M-to-M relationship addition)
INSERT INTO Produce (ManufactuersID, ProductsID) VALUES ([Manufacturers_id_from_dropdown_Input], [Products_id_from_dropdown_Input])



--dis-associate a product from a shopping cart (M-to-M relationship deletion)
DELETE FROM Contain WHERE ShoppingCartsID = [Shopping Carts_ID_selected_from_Shopping Carts_and_Products_list] AND ProductsID = [Proudcts_ID_selected_from-Shopping Carts_and_Products_list]

--dis-associate a product from a manufacturer (M-to-M relationship deletion)
DELETE FROM Produce WHERE ManufacturersID = [Manufacturers_ID_selected_from_Manufacturers_and_Products_list] AND ProudctsID = [Products_ID_selected_from-Manufacturers_and_Products_list]



--get all client's data from the user's text search of first name
SELECT* FROm Clients WHERE first name = [User's_text_search_of_first name]

--get all product's data from the user's text search of product name
SELECT* FROm Products WHERE product name = [User's_text_search_of_product name]

--get all manufacturer's data from the user's text search of manufacturer name
SELECT* FROm Manufacturers WHERE manufacturer name = [User's_text_search_of_manufacturer name]
                                         
