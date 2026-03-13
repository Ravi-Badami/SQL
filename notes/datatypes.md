# Numeric Data Types Examples

### 1. INT — Whole Numbers

Stores **integers without decimal points**.

Examples of values:

```
10
-25
0
5000
```

Example column:

```sql
age INT
```

Example table data:

| id  | age |
| --- | --- |
| 1   | 21  |
| 2   | 35  |
| 3   | 18  |

---

### 2. FLOAT — Decimal Numbers (Approximate)

Stores **decimal numbers with floating precision**.
Float uses the 4 bytes i.e. 32 bits to store the values. So it has a wide range of values. But it is not always precise.

Examples of values:

```
3.14
2.75
-0.45
10.5
```

Example column:

```sql
temperature FLOAT
```

Example table data:

| city   | temperature |
| ------ | ----------- |
| Delhi  | 36.5        |
| Mumbai | 32.7        |

---

### 3. DOUBLE — Large Decimal Numbers

Stores **decimal numbers with higher precision than FLOAT**.
Double uses the 8 bytes i.e. 64 bits to store the values. So it has a wide range of values. Double is more precise than the Float.

Examples of values:

```
12345.678912
9876543.123456
```

Example column:

```sql
distance DOUBLE
```

Example table data:

| planet | distance_from_sun |
| ------ | ----------------- |
| Earth  | 149600000.12345   |
| Mars   | 227900000.56789   |

---

example

999.999999999999999
↑
4th decimal is 9 → rounds UP the 3rd decimal
999.999 → 3rd decimal (9) + rounding up = 10 → carries over
→ 1000.000

### 4. DECIMAL — Exact Decimal Values

Stores **exact decimal numbers**, commonly used for **money or financial values**.

Example values:

```
10.99
250.75
1000.00
```

Example column:

```sql
price DECIMAL(10,2)
```

Meaning:

```
10 → total digits
2 → digits after decimal
```

Example table data:

| product | price    |
| ------- | -------- |
| Laptop  | 55000.99 |
| Phone   | 19999.50 |

---

# Quick Comparison (Good for Notes)

| Data Type | Stores                  | Example    |
| --------- | ----------------------- | ---------- |
| INT       | Whole numbers           | 10         |
| FLOAT     | Approximate decimals    | 3.14       |
| DOUBLE    | Larger precise decimals | 12345.6789 |
| DECIMAL   | Exact decimals (money)  | 10.99      |

---

✅ **Tip for remembering**

```
INT → integers
FLOAT → normal decimal values
DOUBLE → bigger decimal precision
DECIMAL → exact values (money)
```

---

If you're making notes, I can also give you a **very clean one-page summary of all MySQL data types** (numeric, string, date) that is **perfect for revision before exams or interviews**.

Characters
CHAR(10) — Reserves exactly 10 spaces always. Stores "Hi " (pads 8 empty spaces) — wasteful if text varies in size
​

VARCHAR(10) — Reserves only what's needed. Stores "Hi" using just 2 spaces — flexible and efficient
​

TEXT — No size limit at all. Stores anything from 1 word to an entire book
