# Evaluating Snowflake Micro-Partitioning Schemes

Looking at Snowflake built-in paritioning scheme, "micro-partition".
In relation to the cluster key construct. Here I load 5 different 
tables definitions, the variations been on the cluster key defined.
I then use system functions to investigate the impact of the partitions
and cluster keys.

Dataset: [US Credit Card Transactions on Kaggle](https://kaggle.com/datasets/ealtman2019/credit-card-transactions)

Steps taken:

1. Configure Snowflake account and database entities.
2. Create staging and table database entities.
3. Run PUT command to stage datasets.
4. Run COPY INTO command to load data.
5. Evaluate partitioning and clusters i.e. using system functions.

## Notes on clustering information table

|Table|Partitions|Avg_Depth|Avg_Overlap|
|-----|----------|---------|-----------|
|v1   |   n/a    |  n/a    |   n/a     |
|v2   |   18     |  1.0    |   0.0     |
|v3   |   18     |  2.0    |   1.8889  |
|v4   |   20     |  2.0    |   1.9     |
|v5   |   19     |  19.0   |   18.0    |

