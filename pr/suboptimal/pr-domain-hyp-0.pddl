(define
	(domain grounded-MICONIC)
	(:requirements :strips :action-costs)
	(:predicates
		( BOARDED_P7 )
		( BOARDED_P2 )
		( LIFT-AT_F17 )
		( LIFT-AT_F16 )
		( LIFT-AT_F15 )
		( LIFT-AT_F14 )
		( LIFT-AT_F13 )
		( LIFT-AT_F12 )
		( LIFT-AT_F11 )
		( LIFT-AT_F10 )
		( LIFT-AT_F9 )
		( LIFT-AT_F8 )
		( LIFT-AT_F7 )
		( LIFT-AT_F6 )
		( LIFT-AT_F5 )
		( LIFT-AT_F4 )
		( LIFT-AT_F3 )
		( LIFT-AT_F2 )
		( LIFT-AT_F1 )
		( BOARDED_P8 )
		( BOARDED_P6 )
		( BOARDED_P5 )
		( BOARDED_P4 )
		( BOARDED_P3 )
		( BOARDED_P1 )
		( BOARDED_P0 )
		( SERVED_P8 )
		( SERVED_P7 )
		( SERVED_P6 )
		( SERVED_P5 )
		( SERVED_P4 )
		( SERVED_P3 )
		( SERVED_P2 )
		( SERVED_P1 )
		( SERVED_P0 )
		( LIFT-AT_F0 )
		( EXPLAINED_UP_F0_F3_1 )
		( EXPLAINED_UP_F3_F9_1 )
		( NOT_EXPLAINED_UP_F0_F3_1 )
		( NOT_EXPLAINED_UP_F3_F9_1 )
		( EXPLAINED_FULL_OBS_SEQUENCE )
		( NOT_EXPLAINED_FULL_OBS_SEQUENCE )
	) 
	(:functions (total-cost))
	(:action EXPLAIN_OBS_UP_F0_F3_1
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F0 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F3 )
			 ( EXPLAINED_UP_F0_F3_1 )
			(not ( LIFT-AT_F0 ))
			 (not ( NOT_EXPLAINED_UP_F0_F3_1 ))
		)
	)
	(:action EXPLAIN_OBS_UP_F3_F9_1
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F3 )
			( EXPLAINED_UP_F0_F3_1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F9 )
			 ( EXPLAINED_UP_F3_F9_1 )
			 ( EXPLAINED_FULL_OBS_SEQUENCE )
			(not ( LIFT-AT_F3 ))
			 (not ( NOT_EXPLAINED_UP_F3_F9_1 ))
			 (not ( NOT_EXPLAINED_FULL_OBS_SEQUENCE ))
		)
	)
	(:action UP_F3_F9
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F3 )
			( NOT_EXPLAINED_UP_F0_F3_1 )
			( NOT_EXPLAINED_FULL_OBS_SEQUENCE )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F9 )
			(not ( LIFT-AT_F3 ))
		)
	)
	(:action UP_F1_F2
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F2 )
			(not ( LIFT-AT_F1 ))
		)
	)
	(:action UP_F1_F3
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F3 )
			(not ( LIFT-AT_F1 ))
		)
	)
	(:action UP_F1_F4
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F4 )
			(not ( LIFT-AT_F1 ))
		)
	)
	(:action UP_F1_F5
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F5 )
			(not ( LIFT-AT_F1 ))
		)
	)
	(:action UP_F1_F6
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F6 )
			(not ( LIFT-AT_F1 ))
		)
	)
	(:action UP_F1_F7
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F7 )
			(not ( LIFT-AT_F1 ))
		)
	)
	(:action UP_F1_F8
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F8 )
			(not ( LIFT-AT_F1 ))
		)
	)
	(:action UP_F1_F9
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F9 )
			(not ( LIFT-AT_F1 ))
		)
	)
	(:action UP_F1_F10
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F10 )
			(not ( LIFT-AT_F1 ))
		)
	)
	(:action UP_F1_F11
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F11 )
			(not ( LIFT-AT_F1 ))
		)
	)
	(:action UP_F1_F12
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F12 )
			(not ( LIFT-AT_F1 ))
		)
	)
	(:action UP_F1_F13
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F13 )
			(not ( LIFT-AT_F1 ))
		)
	)
	(:action UP_F1_F14
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F14 )
			(not ( LIFT-AT_F1 ))
		)
	)
	(:action UP_F1_F15
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F15 )
			(not ( LIFT-AT_F1 ))
		)
	)
	(:action UP_F1_F16
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F16 )
			(not ( LIFT-AT_F1 ))
		)
	)
	(:action UP_F1_F17
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F17 )
			(not ( LIFT-AT_F1 ))
		)
	)
	(:action UP_F2_F3
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F3 )
			(not ( LIFT-AT_F2 ))
		)
	)
	(:action UP_F2_F4
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F4 )
			(not ( LIFT-AT_F2 ))
		)
	)
	(:action UP_F2_F5
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F5 )
			(not ( LIFT-AT_F2 ))
		)
	)
	(:action UP_F2_F6
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F6 )
			(not ( LIFT-AT_F2 ))
		)
	)
	(:action UP_F2_F7
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F7 )
			(not ( LIFT-AT_F2 ))
		)
	)
	(:action UP_F2_F8
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F8 )
			(not ( LIFT-AT_F2 ))
		)
	)
	(:action UP_F2_F9
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F9 )
			(not ( LIFT-AT_F2 ))
		)
	)
	(:action UP_F2_F10
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F10 )
			(not ( LIFT-AT_F2 ))
		)
	)
	(:action UP_F2_F11
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F11 )
			(not ( LIFT-AT_F2 ))
		)
	)
	(:action UP_F2_F12
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F12 )
			(not ( LIFT-AT_F2 ))
		)
	)
	(:action UP_F2_F13
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F13 )
			(not ( LIFT-AT_F2 ))
		)
	)
	(:action UP_F2_F14
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F14 )
			(not ( LIFT-AT_F2 ))
		)
	)
	(:action UP_F2_F15
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F15 )
			(not ( LIFT-AT_F2 ))
		)
	)
	(:action UP_F2_F16
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F16 )
			(not ( LIFT-AT_F2 ))
		)
	)
	(:action UP_F2_F17
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F17 )
			(not ( LIFT-AT_F2 ))
		)
	)
	(:action UP_F3_F4
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F4 )
			(not ( LIFT-AT_F3 ))
		)
	)
	(:action UP_F3_F5
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F5 )
			(not ( LIFT-AT_F3 ))
		)
	)
	(:action UP_F3_F6
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F6 )
			(not ( LIFT-AT_F3 ))
		)
	)
	(:action UP_F3_F7
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F7 )
			(not ( LIFT-AT_F3 ))
		)
	)
	(:action UP_F3_F8
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F8 )
			(not ( LIFT-AT_F3 ))
		)
	)
	(:action UP_F3_F10
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F10 )
			(not ( LIFT-AT_F3 ))
		)
	)
	(:action UP_F3_F11
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F11 )
			(not ( LIFT-AT_F3 ))
		)
	)
	(:action UP_F3_F12
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F12 )
			(not ( LIFT-AT_F3 ))
		)
	)
	(:action UP_F3_F13
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F13 )
			(not ( LIFT-AT_F3 ))
		)
	)
	(:action UP_F3_F14
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F14 )
			(not ( LIFT-AT_F3 ))
		)
	)
	(:action UP_F3_F15
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F15 )
			(not ( LIFT-AT_F3 ))
		)
	)
	(:action UP_F3_F16
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F16 )
			(not ( LIFT-AT_F3 ))
		)
	)
	(:action UP_F3_F17
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F17 )
			(not ( LIFT-AT_F3 ))
		)
	)
	(:action UP_F4_F5
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F4 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F5 )
			(not ( LIFT-AT_F4 ))
		)
	)
	(:action UP_F4_F6
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F4 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F6 )
			(not ( LIFT-AT_F4 ))
		)
	)
	(:action UP_F4_F7
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F4 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F7 )
			(not ( LIFT-AT_F4 ))
		)
	)
	(:action UP_F4_F8
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F4 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F8 )
			(not ( LIFT-AT_F4 ))
		)
	)
	(:action UP_F4_F9
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F4 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F9 )
			(not ( LIFT-AT_F4 ))
		)
	)
	(:action UP_F4_F10
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F4 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F10 )
			(not ( LIFT-AT_F4 ))
		)
	)
	(:action UP_F4_F11
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F4 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F11 )
			(not ( LIFT-AT_F4 ))
		)
	)
	(:action UP_F4_F12
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F4 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F12 )
			(not ( LIFT-AT_F4 ))
		)
	)
	(:action UP_F4_F13
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F4 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F13 )
			(not ( LIFT-AT_F4 ))
		)
	)
	(:action UP_F4_F14
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F4 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F14 )
			(not ( LIFT-AT_F4 ))
		)
	)
	(:action UP_F4_F15
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F4 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F15 )
			(not ( LIFT-AT_F4 ))
		)
	)
	(:action UP_F4_F16
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F4 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F16 )
			(not ( LIFT-AT_F4 ))
		)
	)
	(:action UP_F4_F17
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F4 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F17 )
			(not ( LIFT-AT_F4 ))
		)
	)
	(:action UP_F5_F6
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F5 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F6 )
			(not ( LIFT-AT_F5 ))
		)
	)
	(:action UP_F5_F7
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F5 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F7 )
			(not ( LIFT-AT_F5 ))
		)
	)
	(:action UP_F5_F8
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F5 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F8 )
			(not ( LIFT-AT_F5 ))
		)
	)
	(:action UP_F5_F9
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F5 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F9 )
			(not ( LIFT-AT_F5 ))
		)
	)
	(:action UP_F5_F10
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F5 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F10 )
			(not ( LIFT-AT_F5 ))
		)
	)
	(:action UP_F5_F11
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F5 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F11 )
			(not ( LIFT-AT_F5 ))
		)
	)
	(:action UP_F5_F12
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F5 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F12 )
			(not ( LIFT-AT_F5 ))
		)
	)
	(:action UP_F5_F13
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F5 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F13 )
			(not ( LIFT-AT_F5 ))
		)
	)
	(:action UP_F5_F14
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F5 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F14 )
			(not ( LIFT-AT_F5 ))
		)
	)
	(:action UP_F5_F15
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F5 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F15 )
			(not ( LIFT-AT_F5 ))
		)
	)
	(:action UP_F5_F16
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F5 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F16 )
			(not ( LIFT-AT_F5 ))
		)
	)
	(:action UP_F5_F17
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F5 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F17 )
			(not ( LIFT-AT_F5 ))
		)
	)
	(:action UP_F6_F7
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F6 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F7 )
			(not ( LIFT-AT_F6 ))
		)
	)
	(:action UP_F6_F8
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F6 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F8 )
			(not ( LIFT-AT_F6 ))
		)
	)
	(:action UP_F6_F9
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F6 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F9 )
			(not ( LIFT-AT_F6 ))
		)
	)
	(:action UP_F6_F10
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F6 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F10 )
			(not ( LIFT-AT_F6 ))
		)
	)
	(:action UP_F6_F11
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F6 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F11 )
			(not ( LIFT-AT_F6 ))
		)
	)
	(:action UP_F6_F12
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F6 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F12 )
			(not ( LIFT-AT_F6 ))
		)
	)
	(:action UP_F6_F13
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F6 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F13 )
			(not ( LIFT-AT_F6 ))
		)
	)
	(:action UP_F6_F14
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F6 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F14 )
			(not ( LIFT-AT_F6 ))
		)
	)
	(:action UP_F6_F15
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F6 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F15 )
			(not ( LIFT-AT_F6 ))
		)
	)
	(:action UP_F6_F16
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F6 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F16 )
			(not ( LIFT-AT_F6 ))
		)
	)
	(:action UP_F6_F17
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F6 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F17 )
			(not ( LIFT-AT_F6 ))
		)
	)
	(:action UP_F7_F8
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F7 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F8 )
			(not ( LIFT-AT_F7 ))
		)
	)
	(:action UP_F7_F9
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F7 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F9 )
			(not ( LIFT-AT_F7 ))
		)
	)
	(:action UP_F7_F10
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F7 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F10 )
			(not ( LIFT-AT_F7 ))
		)
	)
	(:action UP_F7_F11
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F7 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F11 )
			(not ( LIFT-AT_F7 ))
		)
	)
	(:action UP_F7_F12
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F7 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F12 )
			(not ( LIFT-AT_F7 ))
		)
	)
	(:action UP_F7_F13
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F7 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F13 )
			(not ( LIFT-AT_F7 ))
		)
	)
	(:action UP_F7_F14
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F7 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F14 )
			(not ( LIFT-AT_F7 ))
		)
	)
	(:action UP_F7_F15
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F7 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F15 )
			(not ( LIFT-AT_F7 ))
		)
	)
	(:action UP_F7_F16
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F7 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F16 )
			(not ( LIFT-AT_F7 ))
		)
	)
	(:action UP_F7_F17
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F7 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F17 )
			(not ( LIFT-AT_F7 ))
		)
	)
	(:action UP_F8_F9
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F8 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F9 )
			(not ( LIFT-AT_F8 ))
		)
	)
	(:action UP_F8_F10
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F8 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F10 )
			(not ( LIFT-AT_F8 ))
		)
	)
	(:action UP_F8_F11
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F8 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F11 )
			(not ( LIFT-AT_F8 ))
		)
	)
	(:action UP_F8_F12
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F8 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F12 )
			(not ( LIFT-AT_F8 ))
		)
	)
	(:action UP_F8_F13
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F8 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F13 )
			(not ( LIFT-AT_F8 ))
		)
	)
	(:action UP_F8_F14
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F8 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F14 )
			(not ( LIFT-AT_F8 ))
		)
	)
	(:action UP_F8_F15
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F8 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F15 )
			(not ( LIFT-AT_F8 ))
		)
	)
	(:action UP_F8_F16
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F8 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F16 )
			(not ( LIFT-AT_F8 ))
		)
	)
	(:action UP_F8_F17
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F8 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F17 )
			(not ( LIFT-AT_F8 ))
		)
	)
	(:action UP_F9_F10
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F9 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F10 )
			(not ( LIFT-AT_F9 ))
		)
	)
	(:action UP_F9_F11
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F9 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F11 )
			(not ( LIFT-AT_F9 ))
		)
	)
	(:action UP_F9_F12
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F9 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F12 )
			(not ( LIFT-AT_F9 ))
		)
	)
	(:action UP_F9_F13
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F9 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F13 )
			(not ( LIFT-AT_F9 ))
		)
	)
	(:action UP_F9_F14
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F9 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F14 )
			(not ( LIFT-AT_F9 ))
		)
	)
	(:action UP_F9_F15
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F9 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F15 )
			(not ( LIFT-AT_F9 ))
		)
	)
	(:action UP_F9_F16
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F9 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F16 )
			(not ( LIFT-AT_F9 ))
		)
	)
	(:action UP_F9_F17
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F9 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F17 )
			(not ( LIFT-AT_F9 ))
		)
	)
	(:action UP_F10_F11
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F10 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F11 )
			(not ( LIFT-AT_F10 ))
		)
	)
	(:action UP_F10_F12
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F10 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F12 )
			(not ( LIFT-AT_F10 ))
		)
	)
	(:action UP_F10_F13
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F10 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F13 )
			(not ( LIFT-AT_F10 ))
		)
	)
	(:action UP_F10_F14
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F10 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F14 )
			(not ( LIFT-AT_F10 ))
		)
	)
	(:action UP_F10_F15
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F10 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F15 )
			(not ( LIFT-AT_F10 ))
		)
	)
	(:action UP_F10_F16
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F10 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F16 )
			(not ( LIFT-AT_F10 ))
		)
	)
	(:action UP_F10_F17
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F10 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F17 )
			(not ( LIFT-AT_F10 ))
		)
	)
	(:action UP_F11_F12
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F11 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F12 )
			(not ( LIFT-AT_F11 ))
		)
	)
	(:action UP_F11_F13
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F11 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F13 )
			(not ( LIFT-AT_F11 ))
		)
	)
	(:action UP_F11_F14
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F11 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F14 )
			(not ( LIFT-AT_F11 ))
		)
	)
	(:action UP_F11_F15
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F11 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F15 )
			(not ( LIFT-AT_F11 ))
		)
	)
	(:action UP_F11_F16
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F11 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F16 )
			(not ( LIFT-AT_F11 ))
		)
	)
	(:action UP_F11_F17
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F11 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F17 )
			(not ( LIFT-AT_F11 ))
		)
	)
	(:action UP_F12_F13
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F12 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F13 )
			(not ( LIFT-AT_F12 ))
		)
	)
	(:action UP_F12_F14
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F12 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F14 )
			(not ( LIFT-AT_F12 ))
		)
	)
	(:action UP_F12_F15
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F12 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F15 )
			(not ( LIFT-AT_F12 ))
		)
	)
	(:action UP_F12_F16
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F12 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F16 )
			(not ( LIFT-AT_F12 ))
		)
	)
	(:action UP_F12_F17
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F12 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F17 )
			(not ( LIFT-AT_F12 ))
		)
	)
	(:action UP_F13_F14
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F13 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F14 )
			(not ( LIFT-AT_F13 ))
		)
	)
	(:action UP_F13_F15
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F13 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F15 )
			(not ( LIFT-AT_F13 ))
		)
	)
	(:action UP_F13_F16
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F13 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F16 )
			(not ( LIFT-AT_F13 ))
		)
	)
	(:action UP_F13_F17
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F13 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F17 )
			(not ( LIFT-AT_F13 ))
		)
	)
	(:action UP_F14_F15
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F14 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F15 )
			(not ( LIFT-AT_F14 ))
		)
	)
	(:action UP_F14_F16
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F14 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F16 )
			(not ( LIFT-AT_F14 ))
		)
	)
	(:action UP_F14_F17
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F14 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F17 )
			(not ( LIFT-AT_F14 ))
		)
	)
	(:action UP_F15_F16
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F15 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F16 )
			(not ( LIFT-AT_F15 ))
		)
	)
	(:action UP_F15_F17
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F15 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F17 )
			(not ( LIFT-AT_F15 ))
		)
	)
	(:action UP_F16_F17
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F16 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F17 )
			(not ( LIFT-AT_F16 ))
		)
	)
	(:action DEPART_F15_P0
		:parameters ()
		:precondition
		(and
			( BOARDED_P0 )
			( LIFT-AT_F15 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( SERVED_P0 )
			(not ( BOARDED_P0 ))
		)
	)
	(:action DEPART_F2_P1
		:parameters ()
		:precondition
		(and
			( BOARDED_P1 )
			( LIFT-AT_F2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( SERVED_P1 )
			(not ( BOARDED_P1 ))
		)
	)
	(:action DEPART_F10_P2
		:parameters ()
		:precondition
		(and
			( BOARDED_P2 )
			( LIFT-AT_F10 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( SERVED_P2 )
			(not ( BOARDED_P2 ))
		)
	)
	(:action DEPART_F15_P3
		:parameters ()
		:precondition
		(and
			( BOARDED_P3 )
			( LIFT-AT_F15 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( SERVED_P3 )
			(not ( BOARDED_P3 ))
		)
	)
	(:action DEPART_F2_P4
		:parameters ()
		:precondition
		(and
			( BOARDED_P4 )
			( LIFT-AT_F2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( SERVED_P4 )
			(not ( BOARDED_P4 ))
		)
	)
	(:action DEPART_F1_P5
		:parameters ()
		:precondition
		(and
			( BOARDED_P5 )
			( LIFT-AT_F1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( SERVED_P5 )
			(not ( BOARDED_P5 ))
		)
	)
	(:action DEPART_F3_P6
		:parameters ()
		:precondition
		(and
			( BOARDED_P6 )
			( LIFT-AT_F3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( SERVED_P6 )
			(not ( BOARDED_P6 ))
		)
	)
	(:action DEPART_F15_P7
		:parameters ()
		:precondition
		(and
			( BOARDED_P7 )
			( LIFT-AT_F15 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( SERVED_P7 )
			(not ( BOARDED_P7 ))
		)
	)
	(:action DEPART_F13_P8
		:parameters ()
		:precondition
		(and
			( BOARDED_P8 )
			( LIFT-AT_F13 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( SERVED_P8 )
			(not ( BOARDED_P8 ))
		)
	)
	(:action BOARD_F9_P0
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F9 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BOARDED_P0 )
		)
	)
	(:action BOARD_F12_P1
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F12 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BOARDED_P1 )
		)
	)
	(:action BOARD_F17_P3
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F17 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BOARDED_P3 )
		)
	)
	(:action BOARD_F3_P4
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BOARDED_P4 )
		)
	)
	(:action BOARD_F2_P5
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BOARDED_P5 )
		)
	)
	(:action BOARD_F2_P6
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BOARDED_P6 )
		)
	)
	(:action BOARD_F2_P8
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BOARDED_P8 )
		)
	)
	(:action DOWN_F1_F0
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F0 )
			(not ( LIFT-AT_F1 ))
		)
	)
	(:action DOWN_F2_F0
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F0 )
			(not ( LIFT-AT_F2 ))
		)
	)
	(:action DOWN_F3_F0
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F0 )
			(not ( LIFT-AT_F3 ))
		)
	)
	(:action DOWN_F4_F0
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F4 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F0 )
			(not ( LIFT-AT_F4 ))
		)
	)
	(:action DOWN_F5_F0
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F5 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F0 )
			(not ( LIFT-AT_F5 ))
		)
	)
	(:action DOWN_F6_F0
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F6 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F0 )
			(not ( LIFT-AT_F6 ))
		)
	)
	(:action DOWN_F7_F0
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F7 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F0 )
			(not ( LIFT-AT_F7 ))
		)
	)
	(:action DOWN_F8_F0
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F8 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F0 )
			(not ( LIFT-AT_F8 ))
		)
	)
	(:action DOWN_F9_F0
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F9 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F0 )
			(not ( LIFT-AT_F9 ))
		)
	)
	(:action DOWN_F10_F0
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F10 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F0 )
			(not ( LIFT-AT_F10 ))
		)
	)
	(:action DOWN_F11_F0
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F11 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F0 )
			(not ( LIFT-AT_F11 ))
		)
	)
	(:action DOWN_F12_F0
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F12 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F0 )
			(not ( LIFT-AT_F12 ))
		)
	)
	(:action DOWN_F13_F0
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F13 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F0 )
			(not ( LIFT-AT_F13 ))
		)
	)
	(:action DOWN_F14_F0
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F14 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F0 )
			(not ( LIFT-AT_F14 ))
		)
	)
	(:action DOWN_F15_F0
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F15 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F0 )
			(not ( LIFT-AT_F15 ))
		)
	)
	(:action DOWN_F16_F0
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F16 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F0 )
			(not ( LIFT-AT_F16 ))
		)
	)
	(:action DOWN_F17_F0
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F17 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F0 )
			(not ( LIFT-AT_F17 ))
		)
	)
	(:action DOWN_F2_F1
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F1 )
			(not ( LIFT-AT_F2 ))
		)
	)
	(:action DOWN_F3_F1
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F1 )
			(not ( LIFT-AT_F3 ))
		)
	)
	(:action DOWN_F4_F1
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F4 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F1 )
			(not ( LIFT-AT_F4 ))
		)
	)
	(:action DOWN_F5_F1
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F5 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F1 )
			(not ( LIFT-AT_F5 ))
		)
	)
	(:action DOWN_F6_F1
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F6 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F1 )
			(not ( LIFT-AT_F6 ))
		)
	)
	(:action DOWN_F7_F1
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F7 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F1 )
			(not ( LIFT-AT_F7 ))
		)
	)
	(:action DOWN_F8_F1
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F8 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F1 )
			(not ( LIFT-AT_F8 ))
		)
	)
	(:action DOWN_F9_F1
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F9 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F1 )
			(not ( LIFT-AT_F9 ))
		)
	)
	(:action DOWN_F10_F1
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F10 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F1 )
			(not ( LIFT-AT_F10 ))
		)
	)
	(:action DOWN_F11_F1
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F11 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F1 )
			(not ( LIFT-AT_F11 ))
		)
	)
	(:action DOWN_F12_F1
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F12 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F1 )
			(not ( LIFT-AT_F12 ))
		)
	)
	(:action DOWN_F13_F1
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F13 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F1 )
			(not ( LIFT-AT_F13 ))
		)
	)
	(:action DOWN_F14_F1
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F14 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F1 )
			(not ( LIFT-AT_F14 ))
		)
	)
	(:action DOWN_F15_F1
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F15 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F1 )
			(not ( LIFT-AT_F15 ))
		)
	)
	(:action DOWN_F16_F1
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F16 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F1 )
			(not ( LIFT-AT_F16 ))
		)
	)
	(:action DOWN_F17_F1
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F17 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F1 )
			(not ( LIFT-AT_F17 ))
		)
	)
	(:action DOWN_F3_F2
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F2 )
			(not ( LIFT-AT_F3 ))
		)
	)
	(:action DOWN_F4_F2
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F4 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F2 )
			(not ( LIFT-AT_F4 ))
		)
	)
	(:action DOWN_F5_F2
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F5 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F2 )
			(not ( LIFT-AT_F5 ))
		)
	)
	(:action DOWN_F6_F2
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F6 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F2 )
			(not ( LIFT-AT_F6 ))
		)
	)
	(:action DOWN_F7_F2
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F7 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F2 )
			(not ( LIFT-AT_F7 ))
		)
	)
	(:action DOWN_F8_F2
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F8 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F2 )
			(not ( LIFT-AT_F8 ))
		)
	)
	(:action DOWN_F9_F2
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F9 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F2 )
			(not ( LIFT-AT_F9 ))
		)
	)
	(:action DOWN_F10_F2
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F10 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F2 )
			(not ( LIFT-AT_F10 ))
		)
	)
	(:action DOWN_F11_F2
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F11 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F2 )
			(not ( LIFT-AT_F11 ))
		)
	)
	(:action DOWN_F12_F2
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F12 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F2 )
			(not ( LIFT-AT_F12 ))
		)
	)
	(:action DOWN_F13_F2
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F13 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F2 )
			(not ( LIFT-AT_F13 ))
		)
	)
	(:action DOWN_F14_F2
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F14 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F2 )
			(not ( LIFT-AT_F14 ))
		)
	)
	(:action DOWN_F15_F2
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F15 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F2 )
			(not ( LIFT-AT_F15 ))
		)
	)
	(:action DOWN_F16_F2
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F16 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F2 )
			(not ( LIFT-AT_F16 ))
		)
	)
	(:action DOWN_F17_F2
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F17 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F2 )
			(not ( LIFT-AT_F17 ))
		)
	)
	(:action DOWN_F4_F3
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F4 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F3 )
			(not ( LIFT-AT_F4 ))
		)
	)
	(:action DOWN_F5_F3
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F5 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F3 )
			(not ( LIFT-AT_F5 ))
		)
	)
	(:action DOWN_F6_F3
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F6 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F3 )
			(not ( LIFT-AT_F6 ))
		)
	)
	(:action DOWN_F7_F3
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F7 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F3 )
			(not ( LIFT-AT_F7 ))
		)
	)
	(:action DOWN_F8_F3
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F8 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F3 )
			(not ( LIFT-AT_F8 ))
		)
	)
	(:action DOWN_F9_F3
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F9 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F3 )
			(not ( LIFT-AT_F9 ))
		)
	)
	(:action DOWN_F10_F3
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F10 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F3 )
			(not ( LIFT-AT_F10 ))
		)
	)
	(:action DOWN_F11_F3
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F11 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F3 )
			(not ( LIFT-AT_F11 ))
		)
	)
	(:action DOWN_F12_F3
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F12 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F3 )
			(not ( LIFT-AT_F12 ))
		)
	)
	(:action DOWN_F13_F3
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F13 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F3 )
			(not ( LIFT-AT_F13 ))
		)
	)
	(:action DOWN_F14_F3
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F14 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F3 )
			(not ( LIFT-AT_F14 ))
		)
	)
	(:action DOWN_F15_F3
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F15 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F3 )
			(not ( LIFT-AT_F15 ))
		)
	)
	(:action DOWN_F16_F3
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F16 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F3 )
			(not ( LIFT-AT_F16 ))
		)
	)
	(:action DOWN_F17_F3
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F17 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F3 )
			(not ( LIFT-AT_F17 ))
		)
	)
	(:action DOWN_F5_F4
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F5 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F4 )
			(not ( LIFT-AT_F5 ))
		)
	)
	(:action DOWN_F6_F4
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F6 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F4 )
			(not ( LIFT-AT_F6 ))
		)
	)
	(:action DOWN_F7_F4
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F7 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F4 )
			(not ( LIFT-AT_F7 ))
		)
	)
	(:action DOWN_F8_F4
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F8 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F4 )
			(not ( LIFT-AT_F8 ))
		)
	)
	(:action DOWN_F9_F4
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F9 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F4 )
			(not ( LIFT-AT_F9 ))
		)
	)
	(:action DOWN_F10_F4
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F10 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F4 )
			(not ( LIFT-AT_F10 ))
		)
	)
	(:action DOWN_F11_F4
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F11 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F4 )
			(not ( LIFT-AT_F11 ))
		)
	)
	(:action DOWN_F12_F4
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F12 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F4 )
			(not ( LIFT-AT_F12 ))
		)
	)
	(:action DOWN_F13_F4
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F13 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F4 )
			(not ( LIFT-AT_F13 ))
		)
	)
	(:action DOWN_F14_F4
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F14 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F4 )
			(not ( LIFT-AT_F14 ))
		)
	)
	(:action DOWN_F15_F4
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F15 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F4 )
			(not ( LIFT-AT_F15 ))
		)
	)
	(:action DOWN_F16_F4
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F16 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F4 )
			(not ( LIFT-AT_F16 ))
		)
	)
	(:action DOWN_F17_F4
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F17 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F4 )
			(not ( LIFT-AT_F17 ))
		)
	)
	(:action DOWN_F6_F5
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F6 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F5 )
			(not ( LIFT-AT_F6 ))
		)
	)
	(:action DOWN_F7_F5
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F7 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F5 )
			(not ( LIFT-AT_F7 ))
		)
	)
	(:action DOWN_F8_F5
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F8 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F5 )
			(not ( LIFT-AT_F8 ))
		)
	)
	(:action DOWN_F9_F5
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F9 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F5 )
			(not ( LIFT-AT_F9 ))
		)
	)
	(:action DOWN_F10_F5
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F10 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F5 )
			(not ( LIFT-AT_F10 ))
		)
	)
	(:action DOWN_F11_F5
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F11 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F5 )
			(not ( LIFT-AT_F11 ))
		)
	)
	(:action DOWN_F12_F5
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F12 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F5 )
			(not ( LIFT-AT_F12 ))
		)
	)
	(:action DOWN_F13_F5
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F13 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F5 )
			(not ( LIFT-AT_F13 ))
		)
	)
	(:action DOWN_F14_F5
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F14 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F5 )
			(not ( LIFT-AT_F14 ))
		)
	)
	(:action DOWN_F15_F5
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F15 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F5 )
			(not ( LIFT-AT_F15 ))
		)
	)
	(:action DOWN_F16_F5
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F16 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F5 )
			(not ( LIFT-AT_F16 ))
		)
	)
	(:action DOWN_F17_F5
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F17 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F5 )
			(not ( LIFT-AT_F17 ))
		)
	)
	(:action DOWN_F7_F6
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F7 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F6 )
			(not ( LIFT-AT_F7 ))
		)
	)
	(:action DOWN_F8_F6
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F8 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F6 )
			(not ( LIFT-AT_F8 ))
		)
	)
	(:action DOWN_F9_F6
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F9 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F6 )
			(not ( LIFT-AT_F9 ))
		)
	)
	(:action DOWN_F10_F6
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F10 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F6 )
			(not ( LIFT-AT_F10 ))
		)
	)
	(:action DOWN_F11_F6
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F11 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F6 )
			(not ( LIFT-AT_F11 ))
		)
	)
	(:action DOWN_F12_F6
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F12 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F6 )
			(not ( LIFT-AT_F12 ))
		)
	)
	(:action DOWN_F13_F6
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F13 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F6 )
			(not ( LIFT-AT_F13 ))
		)
	)
	(:action DOWN_F14_F6
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F14 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F6 )
			(not ( LIFT-AT_F14 ))
		)
	)
	(:action DOWN_F15_F6
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F15 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F6 )
			(not ( LIFT-AT_F15 ))
		)
	)
	(:action DOWN_F16_F6
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F16 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F6 )
			(not ( LIFT-AT_F16 ))
		)
	)
	(:action DOWN_F17_F6
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F17 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F6 )
			(not ( LIFT-AT_F17 ))
		)
	)
	(:action DOWN_F8_F7
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F8 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F7 )
			(not ( LIFT-AT_F8 ))
		)
	)
	(:action DOWN_F9_F7
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F9 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F7 )
			(not ( LIFT-AT_F9 ))
		)
	)
	(:action DOWN_F10_F7
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F10 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F7 )
			(not ( LIFT-AT_F10 ))
		)
	)
	(:action DOWN_F11_F7
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F11 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F7 )
			(not ( LIFT-AT_F11 ))
		)
	)
	(:action DOWN_F12_F7
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F12 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F7 )
			(not ( LIFT-AT_F12 ))
		)
	)
	(:action DOWN_F13_F7
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F13 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F7 )
			(not ( LIFT-AT_F13 ))
		)
	)
	(:action DOWN_F14_F7
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F14 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F7 )
			(not ( LIFT-AT_F14 ))
		)
	)
	(:action DOWN_F15_F7
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F15 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F7 )
			(not ( LIFT-AT_F15 ))
		)
	)
	(:action DOWN_F16_F7
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F16 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F7 )
			(not ( LIFT-AT_F16 ))
		)
	)
	(:action DOWN_F17_F7
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F17 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F7 )
			(not ( LIFT-AT_F17 ))
		)
	)
	(:action DOWN_F9_F8
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F9 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F8 )
			(not ( LIFT-AT_F9 ))
		)
	)
	(:action DOWN_F10_F8
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F10 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F8 )
			(not ( LIFT-AT_F10 ))
		)
	)
	(:action DOWN_F11_F8
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F11 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F8 )
			(not ( LIFT-AT_F11 ))
		)
	)
	(:action DOWN_F12_F8
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F12 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F8 )
			(not ( LIFT-AT_F12 ))
		)
	)
	(:action DOWN_F13_F8
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F13 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F8 )
			(not ( LIFT-AT_F13 ))
		)
	)
	(:action DOWN_F14_F8
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F14 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F8 )
			(not ( LIFT-AT_F14 ))
		)
	)
	(:action DOWN_F15_F8
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F15 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F8 )
			(not ( LIFT-AT_F15 ))
		)
	)
	(:action DOWN_F16_F8
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F16 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F8 )
			(not ( LIFT-AT_F16 ))
		)
	)
	(:action DOWN_F17_F8
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F17 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F8 )
			(not ( LIFT-AT_F17 ))
		)
	)
	(:action DOWN_F10_F9
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F10 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F9 )
			(not ( LIFT-AT_F10 ))
		)
	)
	(:action DOWN_F11_F9
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F11 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F9 )
			(not ( LIFT-AT_F11 ))
		)
	)
	(:action DOWN_F12_F9
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F12 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F9 )
			(not ( LIFT-AT_F12 ))
		)
	)
	(:action DOWN_F13_F9
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F13 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F9 )
			(not ( LIFT-AT_F13 ))
		)
	)
	(:action DOWN_F14_F9
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F14 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F9 )
			(not ( LIFT-AT_F14 ))
		)
	)
	(:action DOWN_F15_F9
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F15 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F9 )
			(not ( LIFT-AT_F15 ))
		)
	)
	(:action DOWN_F16_F9
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F16 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F9 )
			(not ( LIFT-AT_F16 ))
		)
	)
	(:action DOWN_F17_F9
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F17 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F9 )
			(not ( LIFT-AT_F17 ))
		)
	)
	(:action DOWN_F11_F10
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F11 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F10 )
			(not ( LIFT-AT_F11 ))
		)
	)
	(:action DOWN_F12_F10
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F12 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F10 )
			(not ( LIFT-AT_F12 ))
		)
	)
	(:action DOWN_F13_F10
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F13 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F10 )
			(not ( LIFT-AT_F13 ))
		)
	)
	(:action DOWN_F14_F10
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F14 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F10 )
			(not ( LIFT-AT_F14 ))
		)
	)
	(:action DOWN_F15_F10
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F15 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F10 )
			(not ( LIFT-AT_F15 ))
		)
	)
	(:action DOWN_F16_F10
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F16 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F10 )
			(not ( LIFT-AT_F16 ))
		)
	)
	(:action DOWN_F17_F10
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F17 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F10 )
			(not ( LIFT-AT_F17 ))
		)
	)
	(:action DOWN_F12_F11
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F12 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F11 )
			(not ( LIFT-AT_F12 ))
		)
	)
	(:action DOWN_F13_F11
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F13 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F11 )
			(not ( LIFT-AT_F13 ))
		)
	)
	(:action DOWN_F14_F11
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F14 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F11 )
			(not ( LIFT-AT_F14 ))
		)
	)
	(:action DOWN_F15_F11
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F15 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F11 )
			(not ( LIFT-AT_F15 ))
		)
	)
	(:action DOWN_F16_F11
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F16 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F11 )
			(not ( LIFT-AT_F16 ))
		)
	)
	(:action DOWN_F17_F11
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F17 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F11 )
			(not ( LIFT-AT_F17 ))
		)
	)
	(:action DOWN_F13_F12
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F13 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F12 )
			(not ( LIFT-AT_F13 ))
		)
	)
	(:action DOWN_F14_F12
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F14 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F12 )
			(not ( LIFT-AT_F14 ))
		)
	)
	(:action DOWN_F15_F12
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F15 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F12 )
			(not ( LIFT-AT_F15 ))
		)
	)
	(:action DOWN_F16_F12
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F16 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F12 )
			(not ( LIFT-AT_F16 ))
		)
	)
	(:action DOWN_F17_F12
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F17 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F12 )
			(not ( LIFT-AT_F17 ))
		)
	)
	(:action DOWN_F14_F13
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F14 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F13 )
			(not ( LIFT-AT_F14 ))
		)
	)
	(:action DOWN_F15_F13
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F15 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F13 )
			(not ( LIFT-AT_F15 ))
		)
	)
	(:action DOWN_F16_F13
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F16 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F13 )
			(not ( LIFT-AT_F16 ))
		)
	)
	(:action DOWN_F17_F13
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F17 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F13 )
			(not ( LIFT-AT_F17 ))
		)
	)
	(:action DOWN_F15_F14
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F15 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F14 )
			(not ( LIFT-AT_F15 ))
		)
	)
	(:action DOWN_F16_F14
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F16 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F14 )
			(not ( LIFT-AT_F16 ))
		)
	)
	(:action DOWN_F17_F14
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F17 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F14 )
			(not ( LIFT-AT_F17 ))
		)
	)
	(:action DOWN_F16_F15
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F16 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F15 )
			(not ( LIFT-AT_F16 ))
		)
	)
	(:action DOWN_F17_F15
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F17 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F15 )
			(not ( LIFT-AT_F17 ))
		)
	)
	(:action DOWN_F17_F16
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F17 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F16 )
			(not ( LIFT-AT_F17 ))
		)
	)
	(:action UP_F0_F1
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F0 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F1 )
			(not ( LIFT-AT_F0 ))
		)
	)
	(:action UP_F0_F2
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F0 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F2 )
			(not ( LIFT-AT_F0 ))
		)
	)
	(:action UP_F0_F4
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F0 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F4 )
			(not ( LIFT-AT_F0 ))
		)
	)
	(:action UP_F0_F5
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F0 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F5 )
			(not ( LIFT-AT_F0 ))
		)
	)
	(:action UP_F0_F6
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F0 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F6 )
			(not ( LIFT-AT_F0 ))
		)
	)
	(:action UP_F0_F7
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F0 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F7 )
			(not ( LIFT-AT_F0 ))
		)
	)
	(:action UP_F0_F8
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F0 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F8 )
			(not ( LIFT-AT_F0 ))
		)
	)
	(:action UP_F0_F9
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F0 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F9 )
			(not ( LIFT-AT_F0 ))
		)
	)
	(:action UP_F0_F10
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F0 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F10 )
			(not ( LIFT-AT_F0 ))
		)
	)
	(:action UP_F0_F11
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F0 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F11 )
			(not ( LIFT-AT_F0 ))
		)
	)
	(:action UP_F0_F12
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F0 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F12 )
			(not ( LIFT-AT_F0 ))
		)
	)
	(:action UP_F0_F13
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F0 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F13 )
			(not ( LIFT-AT_F0 ))
		)
	)
	(:action UP_F0_F14
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F0 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F14 )
			(not ( LIFT-AT_F0 ))
		)
	)
	(:action UP_F0_F15
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F0 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F15 )
			(not ( LIFT-AT_F0 ))
		)
	)
	(:action UP_F0_F16
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F0 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F16 )
			(not ( LIFT-AT_F0 ))
		)
	)
	(:action UP_F0_F17
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F0 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( LIFT-AT_F17 )
			(not ( LIFT-AT_F0 ))
		)
	)
	(:action BOARD_F0_P2
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F0 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BOARDED_P2 )
		)
	)
	(:action BOARD_F0_P7
		:parameters ()
		:precondition
		(and
			( LIFT-AT_F0 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BOARDED_P7 )
		)
	)

)
