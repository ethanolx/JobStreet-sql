# JobStreet

|               |   |                       |
|---------------|---|-----------------------|
|   Author      | : |   Ethan Tan Wee En    |
|   Admin No.   | : |   p2012085            |
|   Class       | : |   DAAA/2A/03          |
|   Language    | : |   SQL                 |
|   Date        | : |   May 2021            |

## Setup


### Instantiate Database

1.  To instantiate the database for the basic requirements (no awards), run the following queries in the specified order:
    1.  `sql/instantiate/basic/init.sql`
    2.  `sql/instantiate/basic/data.sql`
2.  To add the tables and data for the storage of awards, run the following queries in the specified order:
    1.  `sql/instantiate/awards/init.sql`
    2.  `sql/instantiate/awards/data.sql`

### Data Retrieval

The sql statements used to retrieve data from the database as in Appendix B are located in the directory `sql/select`

## File Structure

```
JobStreet ---- doc ---- appendices.docx
           |        |-- CA1_Brief.pdf
           |        `-- jobstreet.erd
           |
           |-- sql ---- instantiate ---- awards ---- data.sql
           |        |                |           `-- init.sql
           |        |                |
           |        |                `-- basic ---- data.sql
           |        |                           `-- init.sql
           |        |
           |        `-- select ---- query-1.sql
           |                    |-- query-2.sql
           |                    |-- query-3.sql
           |                    `-- query-4.sql
           |
           `-- README.md
```