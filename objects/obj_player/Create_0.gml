#region Variables
//Move Vars
velh        = 0;
velv        = 0;
max_velh    = 1;
max_velv    = 4;
grav        = 0.2;
jumps       = 2;

//Level Vars
ground = false;

//Input Vars
right = false;
left  = false;
jump  = false;

#endregion

#region Methods

//Get Input
get_input = function()
{
    right = keyboard_check(vk_right) or keyboard_check(ord("D"));
    left = keyboard_check(vk_left) or keyboard_check(ord("A"));
    jump =  keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("K"));
};

//Moveset
moveset = function() 
{ 
    //Applying inputs
    velh = (right - left) * max_velh;
    
    //Applying gravity
    if(!ground)                         //If isn't touching the ground,
    {
        velv += grav;                       //apply gravity on "velv" to jump.
        if (jump && jumps >= 1)             //If jump button is pressed and nº of jumps is bigger than 1,
        {
            jumps --;                           //-1 jump,
            velv = 0;                           //stabilize velv,
            velv -= max_velv;                   //jump again.
        }
    }
    else                                //Else,
    {
    	velv = 0;                       //stabilize velv,
        x = round(x)
        y = round(y)
        jumps = 2;                      //jumps count is 2
        if (jump)                       //If jump button is pressed,
        {
            jumps --;                   //-1 jump,
            velv -= max_velv;           //jump.
        }
    }
    
    //Using horizontal "Move and Collide"
    move_and_collide(velh, 0, obj_wall, 4)
    
    //Using vertical "Move and Collide"
    move_and_collide(0, velv, obj_wall, 4)
};

//Checking if it's touching the floor(or others) object(s)
floor_check = function()
{
    ground = place_meeting(x, y + 1, obj_wall);
    //show_debug_message(ground)
};

//Player falling restart
room_check =  function ()
{
    if (obj_player.y >= room_height)
    {
        obj_player.x = room_height-900
        obj_player.y = obj_wall.y
        velv = 0
    }
}

#endregion


#region Debug
show_debug_overlay(1);

var _ref_grav = ref_create(id, "grav")
var _ref_velv = ref_create(id, "velv")
var _ref_max_velv = ref_create(id, "max_velv")

//velv info
dbg_watch(_ref_velv, "velv");

//Changing velv value
dbg_slider(_ref_max_velv, 0, 10, "Max velv", .1)


//Changing velv value
dbg_slider(_ref_grav, 0, 10, "Gravity", .1)

#endregion