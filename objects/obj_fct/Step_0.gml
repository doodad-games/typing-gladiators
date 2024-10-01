--remaining_duration;

if (remaining_duration <= 0){
	instance_destroy();
	return;
}

--y;