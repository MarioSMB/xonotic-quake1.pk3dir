xonotic
{
	qer_editorimage textures/logo

	surfaceparm trans
	surfaceparm nonsolid
	surfaceparm nodlight
	surfaceparm nolightmap

	polygonOffset
	sort 6
	cull none

	{
		map textures/logo
		blendFunc GL_SRC_ALPHA GL_ONE
		alphaFunc GT0
		rgbgen identity
	}
}
