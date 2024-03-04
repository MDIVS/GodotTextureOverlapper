extends Object
class_name TextureOverlapper

## merge two textures by overlapping it and returns a new and merged image
static func overlap(texture1:Texture2D, texture2:Texture2D) -> ImageTexture:
	var image1:Image = texture1.get_image()
	var image2:Image = texture2.get_image()
	
	# make sure all images are in the same format
	image1.convert(Image.FORMAT_RGBA8)
	image2.convert(Image.FORMAT_RGBA8)
	
	var merged_image = Image.create_from_data(image1.get_width(), image1.get_height(), false, Image.FORMAT_RGBA8, image1.get_data())
	merged_image.blend_rect(image2, Rect2(Vector2(0, 0), image2.get_size()), Vector2(0, 0))

	return ImageTexture.create_from_image(merged_image)
