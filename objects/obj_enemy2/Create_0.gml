data = create_stats_data(false);
data.max_life = 40;
data.damage = 20;

var _ascension_count;
if (instance_exists(obj_run_manager)) _ascension_count = obj_run_manager.get_ascension_count();
else _ascension_count = 0;

data.accuracy = min(0.01, -0.5 + 0.25 * _ascension_count);

event_inherited();