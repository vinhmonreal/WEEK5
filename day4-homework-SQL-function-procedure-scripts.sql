CREATE OR REPLACE  FUNCTION update_customer_email (
	_customer_id integer,
	_email VARCHAR(100)
)
RETURNS VARCHAR (100) AS 
$$
	BEGIN 
		UPDATE customer  
		SET email = _email 
		WHERE customer_id = _customer_id ;
		RETURN _email;
	END;

$$
LANGUAGE plpgsql;
------------------------------------------------------
CREATE OR REPLACE PROCEDURE  update_customer_address(
	_customer_id integer,
	_address_id integer,
	new_address varchar (100),
	new_distric varchar(55),
	new_postal_code integer,
	new_city_id integer
) AS 
$$
	BEGIN 
		UPDATE address SET city_id = new_city_id WHERE address_id = _address_id;
		UPDATE address SET district = new_distric WHERE address_id = _address_id;
		UPDATE address SET postal_code = new_postal_code WHERE address_id = _address_id;
		UPDATE address SET address = new_address WHERE address_id = _address_id;
		COMMIT;
	END;
$$
LANGUAGE plpgsql;

----
