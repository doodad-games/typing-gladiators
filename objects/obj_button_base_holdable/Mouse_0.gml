++held_frames;

if (held_frames < hold_delay) return;
held_frames = 0;

base_press();