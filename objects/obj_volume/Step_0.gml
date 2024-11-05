if (type != "sfx" && type != "music") return;

var _master_volume = obj_save_manager.get_volume("master");
var _group_volume = obj_save_manager.get_volume(type);
var _effective_volume = _master_volume * _group_volume;

var _audio_group;
if (type == "sfx") _audio_group = audiogroup_default;
else _audio_group = audiogroup_music;

audio_group_set_gain(_audio_group, _effective_volume, 0);