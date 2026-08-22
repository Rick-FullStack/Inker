/*
#region Viewport Zoom
// Obtém a câmera vinculada à viewport 0
cam = view_camera[0];

// Guarda as dimensões originais da câmera
cam_w = camera_get_view_width(cam);
cam_h = camera_get_view_height(cam);

// Fator de escala do zoom (1 = normal, 0.5 = zoom in 2x, 2 = zoom out 2x)
zoom_level = 1;
zoom_speed = 0.1;

//Função de zoom
zoom = function (){
    // Zoom In
   if (keyboard_check(vk_up)) {
       zoom_level = max(0.2, zoom_level - zoom_speed);
   }
   
   // Zoom Out
   if (keyboard_check(vk_down)) {
       zoom_level = min(3.0, zoom_level + zoom_speed);
   }
   
   // Aplica o novo tamanho na câmera
   camera_set_view_size(cam, cam_w * zoom_level, cam_h * zoom_level);
}
#endregion
*/


