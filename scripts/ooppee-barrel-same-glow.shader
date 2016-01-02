
box_sign
{

	{
	animMap 6 textures/box_sign_0.tga textures/box_sign_1.tga textures/box_sign_2.tga textures/box_sign_3.tga textures/box_sign_4.tga textures/box_sign_3.tga textures/box_sign_2.tga textures/box_sign_1.tga
	alphaGen vertex
	rgbGen identity
	depthFunc equal
	}

	{
      	map $lightmap
      	rgbGen identity
    	blendFunc GL_DST_COLOR GL_ZERO
     	depthFunc equal
	}

}
