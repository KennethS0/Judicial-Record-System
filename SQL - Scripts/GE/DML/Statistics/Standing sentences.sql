SELECT FLOOR(AVG(final_date - initial_date)) AS days FROM sentence
WHERE (initial_date BETWEEN pInitialDate AND pFinalDate) OR 
      (final_date BETWEEN pInitialDate and pFinalDate);