SELECT `source`.`事件发生编号` AS `事件发生编号`,
       `source`.`距离（周）` AS `距离（周）`,
       `source`.`sum` AS `sum`
FROM
  (SELECT CASE
              WHEN (`t1`.`date_real` < parseDateTimeBestEffort('2016-02-22 00:00:00.000Z')
                    AND `t1`.`date_real` > parseDateTimeBestEffort('2016-02-01 00:00:00.000Z')) THEN 1
              WHEN (`t1`.`date_real` > parseDateTimeBestEffort('2017-01-16 00:00:00.000Z')
                    AND `t1`.`date_real` < parseDateTimeBestEffort('2017-02-06 00:00:00.000Z')) THEN 2
          END AS `事件发生编号`,
          CASE
              WHEN (`t1`.`date_real` > parseDateTimeBestEffort('2016-02-01 00:00:00.000Z')
                    AND `t1`.`date_real` < parseDateTimeBestEffort('2016-02-08 00:00:00.000Z')) THEN -1
              WHEN (`t1`.`date_real` > parseDateTimeBestEffort('2016-02-08 00:00:00.000Z')
                    AND `t1`.`date_real` < parseDateTimeBestEffort('2016-02-13 00:00:00.000Z')) THEN 0
              WHEN (`t1`.`date_real` > parseDateTimeBestEffort('2016-02-13 00:00:00.000Z')
                    AND `t1`.`date_real` < parseDateTimeBestEffort('2016-02-20 00:00:00.000Z')) THEN 1
              WHEN (`t1`.`date_real` > parseDateTimeBestEffort('2017-01-16 00:00:00.000Z')
                    AND `t1`.`date_real` < parseDateTimeBestEffort('2017-01-23 00:00:00.000Z')) THEN -1
              WHEN (`t1`.`date_real` > parseDateTimeBestEffort('2017-01-23 00:00:00.000Z')
                    AND `t1`.`date_real` < parseDateTimeBestEffort('2017-01-30 00:00:00.000Z')) THEN 0
              WHEN (`t1`.`date_real` > parseDateTimeBestEffort('2017-01-30 00:00:00.000Z')
                    AND `t1`.`date_real` < parseDateTimeBestEffort('2017-02-06 00:00:00.000Z')) THEN 1
              ELSE -99
          END AS `距离（周）`,
          sum(`t1`.`price`) AS `sum`
   FROM `default`.`fundamental_data` `t1`
   WHERE (`t1`.`date_real` >= parseDateTimeBestEffort('2016-01-28 00:00:00.000Z')
          AND `t1`.`date_real` < parseDateTimeBestEffort('2017-12-29 00:00:00.000Z')
          AND `t1`.`source_specification` = 'FU00000430'
          AND CASE
                  WHEN (`t1`.`date_real` > parseDateTimeBestEffort('2016-02-01 00:00:00.000Z')
                        AND `t1`.`date_real` < parseDateTimeBestEffort('2016-02-08 00:00:00.000Z')) THEN -1
                  WHEN (`t1`.`date_real` > parseDateTimeBestEffort('2016-02-08 00:00:00.000Z')
                        AND `t1`.`date_real` < parseDateTimeBestEffort('2016-02-13 00:00:00.000Z')) THEN 0
                  WHEN (`t1`.`date_real` > parseDateTimeBestEffort('2016-02-13 00:00:00.000Z')
                        AND `t1`.`date_real` < parseDateTimeBestEffort('2016-02-20 00:00:00.000Z')) THEN 1
                  WHEN (`t1`.`date_real` > parseDateTimeBestEffort('2017-01-16 00:00:00.000Z')
                        AND `t1`.`date_real` < parseDateTimeBestEffort('2017-01-23 00:00:00.000Z')) THEN -1
                  WHEN (`t1`.`date_real` > parseDateTimeBestEffort('2017-01-23 00:00:00.000Z')
                        AND `t1`.`date_real` < parseDateTimeBestEffort('2017-01-30 00:00:00.000Z')) THEN 0
                  WHEN (`t1`.`date_real` > parseDateTimeBestEffort('2017-01-30 00:00:00.000Z')
                        AND `t1`.`date_real` < parseDateTimeBestEffort('2017-02-06 00:00:00.000Z')) THEN 1
                  ELSE -99
              END > -99)
   GROUP BY CASE
                WHEN (`t1`.`date_real` < parseDateTimeBestEffort('2016-02-22 00:00:00.000Z')
                      AND `t1`.`date_real` > parseDateTimeBestEffort('2016-02-01 00:00:00.000Z')) THEN 1
                WHEN (`t1`.`date_real` > parseDateTimeBestEffort('2017-01-16 00:00:00.000Z')
                      AND `t1`.`date_real` < parseDateTimeBestEffort('2017-02-06 00:00:00.000Z')) THEN 2
            END,
            CASE
                WHEN (`t1`.`date_real` > parseDateTimeBestEffort('2016-02-01 00:00:00.000Z')
                      AND `t1`.`date_real` < parseDateTimeBestEffort('2016-02-08 00:00:00.000Z')) THEN -1
                WHEN (`t1`.`date_real` > parseDateTimeBestEffort('2016-02-08 00:00:00.000Z')
                      AND `t1`.`date_real` < parseDateTimeBestEffort('2016-02-13 00:00:00.000Z')) THEN 0
                WHEN (`t1`.`date_real` > parseDateTimeBestEffort('2016-02-13 00:00:00.000Z')
                      AND `t1`.`date_real` < parseDateTimeBestEffort('2016-02-20 00:00:00.000Z')) THEN 1
                WHEN (`t1`.`date_real` > parseDateTimeBestEffort('2017-01-16 00:00:00.000Z')
                      AND `t1`.`date_real` < parseDateTimeBestEffort('2017-01-23 00:00:00.000Z')) THEN -1
                WHEN (`t1`.`date_real` > parseDateTimeBestEffort('2017-01-23 00:00:00.000Z')
                      AND `t1`.`date_real` < parseDateTimeBestEffort('2017-01-30 00:00:00.000Z')) THEN 0
                WHEN (`t1`.`date_real` > parseDateTimeBestEffort('2017-01-30 00:00:00.000Z')
                      AND `t1`.`date_real` < parseDateTimeBestEffort('2017-02-06 00:00:00.000Z')) THEN 1
                ELSE -99
            END
   ORDER BY CASE
                WHEN (`t1`.`date_real` < parseDateTimeBestEffort('2016-02-22 00:00:00.000Z')
                      AND `t1`.`date_real` > parseDateTimeBestEffort('2016-02-01 00:00:00.000Z')) THEN 1
                WHEN (`t1`.`date_real` > parseDateTimeBestEffort('2017-01-16 00:00:00.000Z')
                      AND `t1`.`date_real` < parseDateTimeBestEffort('2017-02-06 00:00:00.000Z')) THEN 2
            END ASC, CASE
                         WHEN (`t1`.`date_real` > parseDateTimeBestEffort('2016-02-01 00:00:00.000Z')
                               AND `t1`.`date_real` < parseDateTimeBestEffort('2016-02-08 00:00:00.000Z')) THEN -1
                         WHEN (`t1`.`date_real` > parseDateTimeBestEffort('2016-02-08 00:00:00.000Z')
                               AND `t1`.`date_real` < parseDateTimeBestEffort('2016-02-13 00:00:00.000Z')) THEN 0
                         WHEN (`t1`.`date_real` > parseDateTimeBestEffort('2016-02-13 00:00:00.000Z')
                               AND `t1`.`date_real` < parseDateTimeBestEffort('2016-02-20 00:00:00.000Z')) THEN 1
                         WHEN (`t1`.`date_real` > parseDateTimeBestEffort('2017-01-16 00:00:00.000Z')
                               AND `t1`.`date_real` < parseDateTimeBestEffort('2017-01-23 00:00:00.000Z')) THEN -1
                         WHEN (`t1`.`date_real` > parseDateTimeBestEffort('2017-01-23 00:00:00.000Z')
                               AND `t1`.`date_real` < parseDateTimeBestEffort('2017-01-30 00:00:00.000Z')) THEN 0
                         WHEN (`t1`.`date_real` > parseDateTimeBestEffort('2017-01-30 00:00:00.000Z')
                               AND `t1`.`date_real` < parseDateTimeBestEffort('2017-02-06 00:00:00.000Z')) THEN 1
                         ELSE -99
                     END ASC) `source`
LIMIT 1048575