/* **************************************************************************** 
	FILE:	Insert_Update_and_Delete_Assignment.sql
	AUTHOR:	Naoki Katakura
	DESCRIPTION:
		Write the SQL statements needed for Exercises
        1, 2, 3, 4, 5, 6, 7, 8, and 9 on pages 164 and 165 of the text.
        Place all the statements into a single SQL script file.
        For each statement that changes the data in the database, follow it
        with a SELECT statement to verify the change!
**************************************************************************** */

USE ap;

/* **************************************************************************** 
	Exercise01:
		Write an INSERT statement that adds this row to the Terms table:
        terms_id			6
        terms_description	Net due 120 days
        terms_due_days		120
**************************************************************************** */

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_Chapter_05_Exercise_01$$
CREATE PROCEDURE sp_Chapter_05_Exercise_01()
COMMENT 'Solution to exercise 1 in chapter 5'
BEGIN
	/*
		Copyright statement
		Author: Naoki Katakura
		File: Insert_Update_and_Delete_Assignment.sql
		DESCRIPTION:
			An INSERT statement that adds this row to the Terms table:
			terms_id			6
			terms_description	Net due 120 days
			terms_due_days		120

		Modification History
		2021-02-28	Naoki Katakura		Initial Creation
	*/

	INSERT INTO terms (
		terms_description
		, terms_due_days
	) VALUES (
		'Net due 120 days'
		, 120
	)
	;
	
	SELECT last_insert_id() AS 'terms_id'
    ;
    
    /*  
		This SELECT statement could also be used to check if the above
		INSERT worked, assuming the auto-incremented terms_id is still 6:
    
    SELECT terms_id
		, terms_description
        , terms_due_days
    FROM terms
    WHERE terms_id = 6
    ;
    
    */

END$$
DELIMITER ;

CALL sp_Chapter_05_Exercise_01();


/* **************************************************************************** 
	Exercise02:
		Write an UPDATE statement that modifies the row you just added to the
        terms table.  This statement should change the terms_description column
        to "Net due 125 days", and it should change the terms_due_days column
        to 125
**************************************************************************** */

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_Chapter_05_Exercise_02$$
CREATE PROCEDURE sp_Chapter_05_Exercise_02()
COMMENT 'Solution to exercise 2 from chapter 5'
BEGIN
	/*
		Copyright statement
		Author: Naoki Katakura
		File: Insert_Update_and_Delete_Assignment.sql
		DESCRIPTION:
			an UPDATE statement that modifies the row you just added to the
			terms table.  This statement should change the terms_description
            column to "Net due 125 days", and it should change the
            terms_due_days column to 125

		Modification History
		2021-02-28	Naoki Katakura		Initial Creation
	*/

	UPDATE terms
    SET terms_description = 'Net due 125 days'
		, terms_due_days = 125
    WHERE terms_id = 6
    ;
    
    SELECT terms_id
		, terms_description
        , terms_due_days
	FROM terms
    WHERE terms_id = 6
    ;

END$$
DELIMITER ;

CALL sp_Chapter_05_Exercise_02();


/* **************************************************************************** 
	Exercise03:
		Write a DELETE statement that deletes the row you added to the Terms
        table
**************************************************************************** */

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_Chapter_05_Exercise_03$$
CREATE PROCEDURE sp_Chapter_05_Exercise_03()
COMMENT 'Solution to exercise 3 of chapter 5'
BEGIN
	/*
		Copyright statement
		Author: Naoki Katakura
		File: Insert_Update_and_Delete_Assignment.sql
		DESCRIPTION:
			Deletes the row that was added in exercise 2

		Modification History
		2021-02-28	Naoki Katakura		Initial Creation
	*/

	DELETE FROM terms
    WHERE terms_id = 6
    ;
    
    SELECT row_count() AS 'rows_deleted'
    ;
    
    /* 
		The following SELECT statement could also be used to check if the
        row was deleted.  Should return 0 rows if deleted correctly.
        
	SELECT *
    FROM terms
    WHERE terms_id = 6
    ;
    
    */

END$$
DELIMITER ;

CALL sp_Chapter_05_Exercise_03();


/* **************************************************************************** 
	Exercise04:
		Write an INSERT statement that adds this row to the Invoices table:
        invoice_id				The next AI number
        vendor_id				32
        invoice_number			AX-014-027
        invoice_date			8/1/2018
        invoice_total			$434.58
        payment_total			$0.00
        credit_total			$0.00
        terms_id				2
        invoice_due_date		8/31/2018
        payment_date			null
        
**************************************************************************** */

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_Chapter_05_Exercise_04$$
CREATE PROCEDURE sp_Chapter_05_Exercise_04()
COMMENT 'solution to exercise 4 of chapter 5'
BEGIN
	/*
		Copyright statement
		Author: Naoki Katakura
		File: Insert_Update_and_Delete_Assignment.sql
		DESCRIPTION:
			Adds a row to the invoices table

		Modification History
		2021-02-28	Naoki Katakura		Initial Creation
	*/

	 INSERT INTO invoices (
		vendor_id
        , invoice_number
        , invoice_date
        , invoice_total
        , payment_total
        , credit_total
        , terms_id
        , invoice_due_date
     ) VALUES (
		32
        , 'AX-014-027'
        , '2018-08-01'
        , 434.58
        , 0.00
        , 0.00
        , 2
        , '2018-08-31'
     )
     ;
     
     SELECT invoice_id
		, vendor_id
        , invoice_number
        , invoice_date
        , invoice_total
        , payment_total
        , credit_total
        , terms_id
        , invoice_due_date
        , payment_date
     FROM invoices
     ORDER BY invoice_id DESC
     LIMIT 1
     ;
     

END$$
DELIMITER ;

CALL sp_Chapter_05_Exercise_04();


/* **************************************************************************** 
	Exercise05:
		Write an INSERT statement that adds these rows to the invoice_line_items
        table
        invoice_sequence				1			2
        account_number					160			527
        line_item_amount				$180.23		$254.35
        line_item_description			Hard Drive	Exchange Server Update
        set the invoice_id column to the invoice_id that was generated in the
        previous exercise
**************************************************************************** */

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_Chapter_05_Exercise_05$$
CREATE PROCEDURE sp_Chapter_05_Exercise_05()
COMMENT 'solution to exercise 5 in chapter 5'
BEGIN
	/*
		Copyright statement
		Author: Naoki Katakura
		File: Insert_Update_and_Delete_Assignment.sql
		DESCRIPTION:
			solution to exercise 5 in chapter 5

		Modification History
		2021-02-28	Naoki Katakura		Initial Creation
	*/

	 -- invoice_id = 115
     
     INSERT INTO invoice_line_items (
		invoice_sequence
        , account_number
        , line_item_amount
        , line_item_description
        , invoice_id
     ) VALUES (
		1
        , 160
        , 180.23
        , 'Hard Drive'
        , 115
     ), (
		2
        , 527
        , 254.35
        , 'Exchange Server Update'
        , 115
     )
     ;
     
     SELECT *
     FROM invoice_line_items
     WHERE invoice_id = 115
     ;

END$$
DELIMITER ;

CALL sp_Chapter_05_Exercise_05();


/* **************************************************************************** 
	Exercise06:
		Write an UPDATE statement that modifies the invoice you added in
        exercise 4. This statement should change the credit_total column 
        so it's 10% of the invoice_total column, and it should change the
        payment_total column so the sum of the payment_total and credit_total
        columns are equal to the invoice_total column
**************************************************************************** */

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_Chapter_05_Exercise_06$$
CREATE PROCEDURE sp_Chapter_05_Exercise_06()
COMMENT 'solution to exercise 6 of chapter 5'
BEGIN
	/*
		Copyright statement
		Author: Naoki Katakura
		File: Insert_Update_and_Delete_Assignment.sql
		DESCRIPTION:
			solution to exercise 6 of chapter 5

		Modification History
		2021-02-28	Naoki Katakura		Initial Creation
	*/

	UPDATE invoices
	SET credit_total = (invoice_total * 0.1)
		, payment_total = (invoice_total - credit_total)
	WHERE invoice_id = 115
	;
    
    SELECT *
    FROM invoices
    WHERE invoice_id = 115
    ;
    
END$$
DELIMITER ;

CALL sp_Chapter_05_Exercise_06();


/* **************************************************************************** 
	Exercise07:
		Write an UPDATE statement that updates the vendors table.  Change the
        default_account_number column to 403 for the vendor with an ID of 44
**************************************************************************** */

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_Chapter_05_Exercise_07$$
CREATE PROCEDURE sp_Chapter_05_Exercise_07()
COMMENT 'solution to exercise 7 of chapter 5'
BEGIN
	/*
		Copyright statement
		Author: Naoki Katakura
		File: Insert_Update_and_Delete_Assignment.sql
		DESCRIPTION:
			solution to exercise 7 of chapter 5

		Modification History
		2021-02-28	Naoki Katakura		Initial Creation
	*/

	 UPDATE vendors
     SET default_account_number = 403
     WHERE vendor_id = 44
     ;
     
     SELECT default_account_number
     FROM vendors
     WHERE vendor_id = 44
     ;

END$$
DELIMITER ;

CALL sp_Chapter_05_Exercise_07();


/* **************************************************************************** 
	Exercise08:
		Write an UPDATE statement that modifies the invoice tables. Change the
        terms_id column to 2 for each invoice that's for a vendor with a
        default_terms_id of 2
**************************************************************************** */

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_Chapter_05_Exercise_08$$
CREATE PROCEDURE sp_Chapter_05_Exercise_08()
COMMENT 'solution to exercise 8 of chapter 5'
BEGIN
	/*
		Copyright statement
		Author: Naoki Katakura
		File: Insert_Update_and_Delete_Assignment.sql
		DESCRIPTION:
			solution to exercise 8 of chapter 5

		Modification History
		2021-02-28	Naoki Katakura		Initial Creation
	*/

	UPDATE invoices
	SET terms_id = 2
	WHERE vendor_id IN (
		SELECT vendor_id
		FROM vendors
		WHERE (default_terms_id = 2)
    )
	;
    
    SELECT *
    FROM invoices
    WHERE vendor_id IN (
		SELECT vendor_id
		FROM vendors
		WHERE (default_terms_id = 2)
    )
    ;

END$$
DELIMITER ;

CALL sp_Chapter_05_Exercise_08();


/* **************************************************************************** 
	Exercise09:
		Write a DELETE statement that deletes the row that you added to the
        invoices table in exercise 4.  Fix the error by writing another
        DELETE statement that deletest the line items from this invoice
**************************************************************************** */

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_Chapter_05_Exercise_09$$
CREATE PROCEDURE sp_Chapter_05_Exercise_09()
COMMENT 'solution to exercise 9 of chapter 5'
BEGIN
	/*
		Copyright statement
		Author: Naoki Katakura
		File: Insert_Update_and_Delete_Assignment.sql
		DESCRIPTION:
			solution to exercise 9 of chapter 5

		Modification History
		2021-02-28	Naoki Katakura		Initial Creation
	*/

	DELETE FROM invoice_line_items
    WHERE invoice_id = 115
    ;

	DELETE FROM invoices
	WHERE invoice_id = 115
	;
    
    SELECT *
    FROM invoices
    INNER JOIN invoice_line_items
    ON invoices.invoice_id = invoice_line_items.invoice_id
    WHERE invoices.invoice_id = 115
    ;

END$$
DELIMITER ;

CALL sp_Chapter_05_Exercise_09();