-- 🟢 Level 1 — Beginner
-- Goal: Get comfortable creating and modifying tables with basic constraints.

-- Q1. Create a table called ecom.reviews with columns: review_id (auto-increment PK), product_id (FK to products), customer_id (FK to customers), rating (1–5 only), comment (optional text), created_at (defaults to now).

-- Q2. Add a new column discount_percent (NUMERIC, default 0, cannot be negative) to the ecom.products table.

-- Q3. Rename the column full_name in ecom.customers to customer_name.

-- Q4. Drop the description column from ecom.categories.

-- Q5. Create a table ecom.addresses with: address_id, customer_id (FK), street, city, state, pincode, is_default (boolean, default false).

-- Q6. Truncate the ecom.order_items table (understand what happens vs DELETE).

-- Q7. Rename the table ecom.reviews to ecom.product_reviews.

-- 🟡 Level 2 — Intermediate
-- Goal: Master constraints, indexes, sequences, and schema design.

-- Q8. Add a UNIQUE constraint on the combination of (order_id, product_id) in ecom.order_items — a product should not appear twice in the same order.

-- Q9. Add a CHECK constraint on ecom.orders so that status can only be one of: 'pending', 'processing', 'shipped', 'delivered', 'cancelled'.

-- Q10. Create a non-unique index on ecom.orders(customer_id) to speed up customer order lookups.

-- Q11. Create a composite index on ecom.order_items(order_id, product_id).

-- Q12. Create a partial index on ecom.products(category_id) where stock > 0 (only index in-stock products).

-- Q13. Create a separate schema called analytics and move (recreate) the products table there as analytics.product_snapshot — with only product_id, name, price, stock columns.

-- Q14. Create a sequence called ecom.invoice_seq starting at 1000, incrementing by 1, and use it as the default for a new ecom.invoices table's invoice_number column.

-- Q15. Change the data type of ecom.customers.phone from VARCHAR(20) to VARCHAR(15).

-- 🟠 Level 3 — Advanced
-- Goal: Handle real-world schema evolution, indexes, and constraints safely.

-- Q16. Add a foreign key with ON DELETE SET NULL behavior — add a coupon_id column to ecom.orders and reference a new ecom.coupons(coupon_id) table. If a coupon is deleted, orders should retain the row but set coupon_id to NULL.

-- Q17. Create a UNIQUE index concurrently on ecom.customers(email) without locking the table (production-safe index creation).
-- ​

-- Q18. Add a generated column ecom.order_items.line_total that is always computed as quantity * unit_price (stored).

-- Q19. Create a composite type called ecom.address_type with fields street, city, state, pincode, and use it as a column type in a new ecom.vendor table.

-- Q20. Add a named constraint chk_product_price_range on ecom.products to ensure price is between 1 and 10,000,000. Then drop that constraint by name and replace it with a wider range.
-- ​

-- Q21. Create a partial unique index that ensures no two active customers can share the same phone number (i.e., unique on phone where is_active = true).

-- Q22. Use ALTER TABLE ... SET NOT NULL safely on the ecom.orders.total_amount column — first verify no NULLs exist, then apply the constraint.

-- 🔴 Level 4 — Expert / Production-Grade
-- Goal: Write DDL the way it's done in high-traffic, zero-downtime production systems.

-- Q23. Partition the ecom.orders table by range on created_at (monthly partitions for Jan–Mar 2025). Create the parent table and at least 3 child partitions.
-- ​

-- Q24. You need to add a NOT NULL column source_channel VARCHAR(30) to the ecom.orders table which already has millions of rows. Write the zero-downtime 3-step DDL strategy: add nullable → backfill → set NOT NULL.
-- ​

-- Q25. Drop an index in production without locking the table. Use DROP INDEX CONCURRENTLY.
-- ​

-- Q26. Create a multi-column partial index on ecom.orders(customer_id, created_at DESC) where status != 'cancelled' — mimicking a real dashboard query index.
-- ​

-- Q27. Write DDL to add an exclusion constraint on a new ecom.promotions table to prevent overlapping promotion date ranges for the same product_id (uses && operator with daterange).
-- ​

-- Q28. Create a ecom.audit_log table, then write a BEFORE DDL trigger using an event trigger that logs any DROP TABLE commands attempted in the ecom schema into this audit table.

-- Q29. You need to rename a column sku → product_code on a live ecom.products table without breaking existing app queries that still use sku. Write the DDL strategy using a view as a compatibility layer.

-- Q30. Design the full DDL for an ecom.inventory_ledger table that: uses range partitioning by month, has a composite PK of (ledger_id, created_at), uses a BRIN index (suited for time-series/append-only data) instead of B-Tree, and includes proper CHECK constraints per partition.

