

	
PROGRAM _CYCLIC


	(*����ݽ�����״̬��*)	
	CASE LeftDoorState OF 
		DoorIsClosed: 
			IF LeftTower.Signal_Start_DoorMotor_P   THEN 
				LeftTower.Sensor_DoorClosed := FALSE;
				LeftDoorState := DoorIsOpening;
				
			END_IF	
		DoorIsOpened:
			IF LeftTower.Signal_Start_DoorMotor_N   THEN 
				LeftTower.Sensor_DoorOpened := FALSE;
				LeftDoorState := DoorIsClosing;
			END_IF	
		DoorIsClosing:
			IF LeftTower.Sensor_Position_Door > 0 THEN
				LeftTower.Sensor_Position_Door := LeftTower.Sensor_Position_Door-1;
			ELSE
				LeftTower.Sensor_DoorClosed := TRUE; 
				LeftDoorState := DoorIsClosed;
			END_IF
		DoorIsOpening:
			IF LeftTower.Sensor_Position_Door < 50 THEN
				LeftTower.Sensor_Position_Door := LeftTower.Sensor_Position_Door+1;
			ELSE
				LeftTower.Sensor_DoorOpened := TRUE; 
				LeftDoorState := DoorIsOpened;
			END_IF
	END_CASE
	
	(*����ݽ����˶�״̬��*)
		
	CASE LeftCabinState OF 
		CabinIsStoped: 
			IF LeftTower.Signal_Start_CabinMotor_P   THEN 
				LeftCabinState := CabinIsGoingUp;
			ELSIF LeftTower.Signal_Start_CabinMotor_N THEN
				LeftCabinState := CabinIsGoingDown;		
			END_IF	
			LeftCabin.Display_Current_Direction := '--';
			FOR i := 0 TO 6 DO
				FloorPanel[i].Display_Current_Direction_Left := '--';
			END_FOR	
		CabinIsGoingUp:
			IF LeftTower.Sensor_Position_Cabin < 600 THEN
			    LeftTower.Sensor_Position_Cabin := LeftTower.Sensor_Position_Cabin+1;
			END_IF				
			IF  LeftTower.Signal_Stop_CabinMotor   THEN 				
				LeftCabinState := CabinIsStoped;		
			END_IF	
			LeftCabin.Display_Current_Direction := '/\';
			FOR i := 0 TO 6 DO
				FloorPanel[i].Display_Current_Direction_Left := '/\';
			END_FOR	
		
		CabinIsGoingDown:
			IF LeftTower.Sensor_Position_Cabin > 0 THEN
				LeftTower.Sensor_Position_Cabin := LeftTower.Sensor_Position_Cabin-1;
			END_IF				
			IF  LeftTower.Signal_Stop_CabinMotor   THEN 				
				LeftCabinState := CabinIsStoped;		
			END_IF	
			LeftCabin.Display_Current_Direction := '\/';
			FOR i := 0 TO 6 DO
				FloorPanel[i].Display_Current_Direction_Left := '\/';
			END_FOR	
		
		END_CASE

	IF LeftTower.Sensor_Position_Cabin = 0 THEN
		LeftTower.Sensor_Floor1Approached := TRUE;
	ELSE	
		LeftTower.Sensor_Floor1Approached := FALSE;
	END_IF						
					
	IF LeftTower.Sensor_Position_Cabin = 100 THEN
		LeftTower.Sensor_Floor2Approached := TRUE;
	ELSE	
		LeftTower.Sensor_Floor2Approached := FALSE;
	END_IF					
	
	IF LeftTower.Sensor_Position_Cabin = 200 THEN
		LeftTower.Sensor_Floor3Approached := TRUE;
	ELSE	
		LeftTower.Sensor_Floor3Approached := FALSE;
	END_IF					
	
	IF LeftTower.Sensor_Position_Cabin = 300 THEN
		LeftTower.Sensor_Floor4Approached := TRUE;
	ELSE	
		LeftTower.Sensor_Floor4Approached := FALSE;
	END_IF						
	IF LeftTower.Sensor_Position_Cabin = 400 THEN
		LeftTower.Sensor_Floor5Approached := TRUE;
	ELSE	
		LeftTower.Sensor_Floor5Approached := FALSE;
	END_IF						
	IF LeftTower.Sensor_Position_Cabin = 500 THEN
		LeftTower.Sensor_Floor6Approached := TRUE;
	ELSE	
		LeftTower.Sensor_Floor6Approached := FALSE;
	END_IF						
	IF LeftTower.Sensor_Position_Cabin = 600 THEN
		LeftTower.Sensor_Floor7Approached := TRUE;
	ELSE	
		LeftTower.Sensor_Floor7Approached := FALSE;
	END_IF			
	
	IF LeftTower.Sensor_Position_Cabin < 100 THEN
		LeftCabin.Display_Current_Floor := 1;
	ELSIF 	LeftTower.Sensor_Position_Cabin < 200 THEN
        LeftCabin.Display_Current_Floor := 2;
	ELSIF 	LeftTower.Sensor_Position_Cabin < 300 THEN
		LeftCabin.Display_Current_Floor := 3;
	ELSIF 	LeftTower.Sensor_Position_Cabin < 400 THEN
		LeftCabin.Display_Current_Floor := 4;
	ELSIF 	LeftTower.Sensor_Position_Cabin < 500 THEN
		LeftCabin.Display_Current_Floor := 5;
	ELSIF 	LeftTower.Sensor_Position_Cabin < 600 THEN
		LeftCabin.Display_Current_Floor := 6;
	ELSE
		LeftCabin.Display_Current_Floor := 7;
	END_IF	
	
	FOR i := 0 TO 6 DO
		FloorPanel[i].Display_Current_Floor_Left := LeftCabin.Display_Current_Floor;
	END_FOR	
		
	(*�ҵ��ݽ�����״̬��*)	
	CASE RightDoorState OF 
		DoorIsClosed: 
			IF RightTower.Signal_Start_DoorMotor_P   THEN 
				RightTower.Sensor_DoorClosed := FALSE;
				RightDoorState := DoorIsOpening;
				
			END_IF	
		DoorIsOpened:
			IF RightTower.Signal_Start_DoorMotor_N   THEN 
				RightTower.Sensor_DoorOpened := FALSE;
				RightDoorState := DoorIsClosing;
			END_IF	
		DoorIsClosing:
			IF RightTower.Sensor_Position_Door > 0 THEN
				RightTower.Sensor_Position_Door := RightTower.Sensor_Position_Door-1;
			ELSE
				RightTower.Sensor_DoorClosed := TRUE; 
				RightDoorState := DoorIsClosed;
			END_IF
		DoorIsOpening:
			IF RightTower.Sensor_Position_Door < 50 THEN
				RightTower.Sensor_Position_Door := RightTower.Sensor_Position_Door+1;
			ELSE
				RightTower.Sensor_DoorOpened := TRUE; 
				RightDoorState := DoorIsOpened;
			END_IF
	END_CASE
	
	(*�ҵ��ݽ����˶�״̬��*)
		
	CASE RightCabinState OF 
		CabinIsStoped: 
			IF RightTower.Signal_Start_CabinMotor_P   THEN 
				RightCabinState := CabinIsGoingUp;
			ELSIF RightTower.Signal_Start_CabinMotor_N THEN
				RightCabinState := CabinIsGoingDown;		
			END_IF	
			RightCabin.Display_Current_Direction := '--';
			FOR i := 0 TO 6 DO
				FloorPanel[i].Display_Current_Direction_Right := '--';
			END_FOR	
		
		CabinIsGoingUp:
			IF RightTower.Sensor_Position_Cabin < 600 THEN
				RightTower.Sensor_Position_Cabin := RightTower.Sensor_Position_Cabin+1;
			END_IF				
			IF  RightTower.Signal_Stop_CabinMotor   THEN 				
				RightCabinState := CabinIsStoped;		
			END_IF	
			RightCabin.Display_Current_Direction := '/\';
			FOR i := 0 TO 6 DO
				FloorPanel[i].Display_Current_Direction_Right := '/\';
			END_FOR	
		
		CabinIsGoingDown:
			IF RightTower.Sensor_Position_Cabin > 0 THEN
				RightTower.Sensor_Position_Cabin := RightTower.Sensor_Position_Cabin-1;
			END_IF				
			IF  RightTower.Signal_Stop_CabinMotor   THEN 				
				RightCabinState := CabinIsStoped;		
			END_IF	
			RightCabin.Display_Current_Direction := '\/';
			FOR i := 0 TO 6 DO
				FloorPanel[i].Display_Current_Direction_Right := '\/';
			END_FOR	
		
		
	END_CASE

	IF RightTower.Sensor_Position_Cabin = 0 THEN
		RightTower.Sensor_Floor1Approached := TRUE;
	ELSE	
		RightTower.Sensor_Floor1Approached := FALSE;
	END_IF						
					
	IF RightTower.Sensor_Position_Cabin = 100 THEN
		RightTower.Sensor_Floor2Approached := TRUE;
	ELSE	
		RightTower.Sensor_Floor2Approached := FALSE;
	END_IF					
	
	IF RightTower.Sensor_Position_Cabin = 200 THEN
		RightTower.Sensor_Floor3Approached := TRUE;
	ELSE	
		RightTower.Sensor_Floor3Approached := FALSE;
	END_IF					
	
	IF RightTower.Sensor_Position_Cabin = 300 THEN
		RightTower.Sensor_Floor4Approached := TRUE;
	ELSE	
		RightTower.Sensor_Floor4Approached := FALSE;
	END_IF						
	IF RightTower.Sensor_Position_Cabin = 400 THEN
		RightTower.Sensor_Floor5Approached := TRUE;
	ELSE	
		RightTower.Sensor_Floor5Approached := FALSE;
	END_IF						
	IF RightTower.Sensor_Position_Cabin = 500 THEN
		RightTower.Sensor_Floor6Approached := TRUE;
	ELSE	
		RightTower.Sensor_Floor6Approached := FALSE;
	END_IF						
	IF RightTower.Sensor_Position_Cabin = 600 THEN
		RightTower.Sensor_Floor7Approached := TRUE;
	ELSE	
		RightTower.Sensor_Floor7Approached := FALSE;
	END_IF						

	IF RightTower.Sensor_Position_Cabin < 100 THEN
		RightCabin.Display_Current_Floor := 1;
	ELSIF 	RightTower.Sensor_Position_Cabin < 200 THEN
		RightCabin.Display_Current_Floor := 2;
	ELSIF 	RightTower.Sensor_Position_Cabin < 300 THEN
		RightCabin.Display_Current_Floor := 3;
	ELSIF 	RightTower.Sensor_Position_Cabin < 400 THEN
		RightCabin.Display_Current_Floor := 4;
	ELSIF 	RightTower.Sensor_Position_Cabin < 500 THEN
		RightCabin.Display_Current_Floor := 5;
	ELSIF 	RightTower.Sensor_Position_Cabin < 600 THEN
		RightCabin.Display_Current_Floor := 6;
	ELSE
		RightCabin.Display_Current_Floor := 7;
	END_IF	
	FOR i := 0 TO 6 DO
		FloorPanel[i].Display_Current_Floor_Right := RightCabin.Display_Current_Floor;
	END_FOR	
	
	
	
END_PROGRAM