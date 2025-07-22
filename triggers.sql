use online_retail_shop;
DELIMITER $$

CREATE TRIGGER apply_coupon_discount
BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
    DECLARE discount_amt INT;

    -- Check if a coupon was applied
    IF NEW.coupons_id IS NOT NULL THEN
        -- Get discount percentage from the coupons table
        SELECT discount INTO discount_amt
        FROM coupons
        WHERE coupons_id = NEW.coupons_id AND is_used = FALSE;

        -- Apply discount to total_amount
        SET NEW.total_amount = NEW.total_amount - (NEW.total_amount * discount_amt / 100);
    END IF;
END$$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER update_user_timestamp
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    SET NEW.create_at = CURRENT_TIMESTAMP;
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER set_initial_order_status
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    INSERT INTO order_status(order_id, status)
    VALUES (NEW.order_id, 'Placed');
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER validate_password_length
BEFORE INSERT ON users
FOR EACH ROW
BEGIN
    IF CHAR_LENGTH(NEW.password) < 8 OR CHAR_LENGTH(NEW.password) > 20 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Password must be between 8 and 20 characters.';
    END IF;
END$$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER cleanup_after_order_delete
AFTER DELETE ON orders
FOR EACH ROW
BEGIN
    DELETE FROM order_item WHERE order_id = OLD.order_id;
    DELETE FROM order_status WHERE order_id = OLD.order_id;
END$$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER mark_coupon_used
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    IF NEW.coupons_id IS NOT NULL THEN
        UPDATE coupons
        SET is_used = TRUE
        WHERE coupons_id = NEW.coupons_id;
    END IF;
END$$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER prevent_expired_coupon
BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
    DECLARE expiry DATE;

    IF NEW.coupons_id IS NOT NULL THEN
        SELECT expiry_date INTO expiry
        FROM coupons
        WHERE coupons_id = NEW.coupons_id;

        IF expiry < CURDATE() THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Coupon expired. Cannot place order.';
        END IF;
    END IF;
END$$

DELIMITER ;

DROP TRIGGER IF EXISTS apply_coupon_discount;
 

DELIMITER $$

CREATE TRIGGER apply_coupon_discount_after_total
AFTER UPDATE ON orders
FOR EACH ROW
BEGIN
    DECLARE discount_amt INT;
    DECLARE final_amount DECIMAL(10,2);

    -- Check if a valid coupon is applied
    IF NEW.coupons_id IS NOT NULL THEN
        SELECT discount INTO discount_amt
        FROM coupons
        WHERE coupons_id = NEW.coupons_id AND is_used = FALSE;

        SET final_amount = NEW.total_amount - (NEW.total_amount * discount_amt / 100);

        UPDATE orders
        SET total_amount = final_amount
        WHERE order_id = NEW.order_id;
    END IF;
END$$

DELIMITER ;
