(define
	(problem grounded-MICONICPROBLEM)
	(:domain grounded-MICONIC)
	(:init
		(= (total-cost) 0)
		( LIFT-AT_F0 )
		( NOT_EXPLAINED_UP_F0_F3_1 )
		( NOT_EXPLAINED_UP_F3_F9_1 )
		( NOT_EXPLAINED_FULL_OBS_SEQUENCE )
	)
	(:goal
		(and 
		( SERVED_P4 )
		( SERVED_P3 )
		( SERVED_P2 )
		( SERVED_P1 )
		( SERVED_P0 )
		( EXPLAINED_FULL_OBS_SEQUENCE )
		)
	)
	(:metric minimize (total-cost))

)
