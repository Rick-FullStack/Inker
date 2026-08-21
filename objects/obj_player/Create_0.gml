#region Variables
velh = 0;
max_velh = 4;

#endregion

#region Methods

//Moveset
moveset = function() 
{
    //Getting inputs
    var _right = keyboard_check(vk_right);
    var _left = keyboard_check(vk_left);
    
    //Applying inputs
    velh = (_right - _left) * max_velh;
    
    x += velh;
};


#endregion