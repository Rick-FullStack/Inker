#region Variables
//Move Vars
velh        = 0;
velv        = 0;
max_velh    = 1;
max_velv    = 4;
grav        = 0.2;

//Test Vars
player_x = obj_player.x
player_y = obj_player.y

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
    jump =  keyboard_check(vk_space) or keyboard_check(ord("K"));
};

//Moveset
moveset = function() 
{ 
    //Applying inputs
    velh = (right - left) * max_velh;
    
    //Applying gravity
    //If it's touching the ground, apply gravity on "velv"
    if(!ground)
    {
        velv += grav;
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
        obj_player.x = player_x
        obj_player.y = player_y
        velv = 0
    }
}

#endregion