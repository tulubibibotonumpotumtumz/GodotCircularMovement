# GodotCircularMovement
---
This is a small demo on the Godot game engine to convert mouse coordinates into a circular movement for a sprite to follow relative to another node's position.

---

The process is simple and involves very basic trigonometry.  
The first step was to offset the usual coordinate system for another where the center (0,0) was the sprite's center. The coordinates of mouse M relative to the node N where simply defined as (Mx-Nx, Ny-My).   
  
Now, for the second part, the sprite is supposed to have the same coordinates as the mouse but converted to a unit circle. This is simple since computing the sine and cosine for the mouse coordinates already does that. In order to get the hypotenuse required in these formulas, I simply used the distance formula or more specifically in that case a direct application of pythagora's theorem because we measure it from the center at (0, 0).

![image of right triangle and formulas used](trig_triangle.png)  
_In green, the mouse coordinates (with offset to center) and in blue, the coordinates converted to the unit circle_  
## Result

![trig_demo](https://github.com/tulubibibotonumpotumtumz/GodotCircularMovement/assets/128854003/09677856-305b-4ef2-84c5-7955586b971a)


[Sprites credit](https://helianthus-games.itch.io/pixel-art-planets)
### Notes
One detail I haven't talked about is keeping the moon always facing the planet. I changed the orientation by finding the angle theta with arcos since I had all the measures for the sides of the triangle but not the angle (law of cosines). I just checked if y became negative and substracted the the angle from 360° if it's the case.
