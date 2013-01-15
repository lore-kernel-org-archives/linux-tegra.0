From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/5] drm/tegra: Add plane support
Date: Tue, 15 Jan 2013 17:53:03 +0800
Message-ID: <50F526FF.1010101@gmail.com>
References: <1358179560-26799-1-git-send-email-thierry.reding@avionic-design.de> <1358179560-26799-3-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358179560-26799-3-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/15/2013 12:05 AM, Thierry Reding wrote:
> Add support for the B and C planes which support RGB and YUV pixel
> formats and can be used as overlays or hardware cursor.

I think "hardware cursor" has specific meaning for Tegra(e.g: Tegra30
has a 32x32 24bpp or 64x64 2bpp hardware cursor). So you may change it
to "hardware accelerated cursor"?

> 
> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> ---
[...]
> +
> +static const uint32_t plane_formats[] = {
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_YUV422,

I haven't found something related with YUV format in this patch set. For
example, "tegra_dc_format" also doesn't take YUV into consideration. So
remove this line.

> +};
> +
> +static int tegra_dc_add_planes(struct drm_device *drm, struct tegra_dc *dc)
> +{
> +	unsigned int i;
> +	int err = 0;
> +
> +	for (i = 0; i < 2; i++) {
> +		struct tegra_plane *plane;
> +
> +		plane = devm_kzalloc(drm->dev, sizeof(*plane), GFP_KERNEL);
> +		if (!plane)
> +			return -ENOMEM;
> +
> +		plane->index = i;

I suggest to change this line to: "plane->index = i + 1;". This makes
the plane's index be consistent with Tegra's windows number. And also we
don't need to worry about passing "plane->index + 1" to some functions
which need to know which window is operating on.

> +
> +		err = drm_plane_init(drm, &plane->base, 1 << dc->pipe,
> +				     &tegra_plane_funcs, plane_formats,
> +				     ARRAY_SIZE(plane_formats), false);
> +		if (err < 0)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +
[...]
>  
> +int tegra_dc_setup_window(struct tegra_dc *dc, unsigned int index,
> +			  const struct tegra_dc_window *window)
> +{
> +	unsigned h_offset, v_offset, h_size, v_size, h_dda, v_dda, bpp;
> +	unsigned long value;
> +
> +	bpp = window->bits_per_pixel / 8;
> +
> +	value = WINDOW_A_SELECT << index;
> +	tegra_dc_writel(dc, value, DC_CMD_DISPLAY_WINDOW_HEADER);
> +
> +	tegra_dc_writel(dc, window->format, DC_WIN_COLOR_DEPTH);
> +	tegra_dc_writel(dc, 0, DC_WIN_BYTE_SWAP);
> +
> +	value = V_POSITION(window->dst.y) | H_POSITION(window->dst.x);
> +	tegra_dc_writel(dc, value, DC_WIN_POSITION);
> +
> +	value = V_SIZE(window->dst.h) | H_SIZE(window->dst.w);
> +	tegra_dc_writel(dc, value, DC_WIN_SIZE);
> +
> +	h_offset = window->src.x * bpp;
> +	v_offset = window->src.y;
> +	h_size = window->src.w * bpp;
> +	v_size = window->src.h;
> +
> +	value = V_PRESCALED_SIZE(v_size) | H_PRESCALED_SIZE(h_size);
> +	tegra_dc_writel(dc, value, DC_WIN_PRESCALED_SIZE);
> +
> +	h_dda = compute_dda_inc(window->src.w, window->dst.w, false, bpp);
> +	v_dda = compute_dda_inc(window->src.h, window->dst.h, true, bpp);
> +
> +	value = V_DDA_INC(v_dda) | H_DDA_INC(h_dda);
> +	tegra_dc_writel(dc, value, DC_WIN_DDA_INC);
> +
> +	h_dda = compute_initial_dda(window->src.x);
> +	v_dda = compute_initial_dda(window->src.y);
> +

In current implementation, "compute_initial_dda" always returns zero. So
why we need it? Although according to TRM, typically we set H/V initial
dda to zero.

> +	tegra_dc_writel(dc, h_dda, DC_WIN_H_INITIAL_DDA);
> +	tegra_dc_writel(dc, v_dda, DC_WIN_V_INITIAL_DDA);
> +
> +	tegra_dc_writel(dc, 0, DC_WIN_UV_BUF_STRIDE);
> +	tegra_dc_writel(dc, 0, DC_WIN_BUF_STRIDE);
> +
> +	tegra_dc_writel(dc, window->base, DC_WINBUF_START_ADDR);
> +	tegra_dc_writel(dc, window->stride, DC_WIN_LINE_STRIDE);
> +	tegra_dc_writel(dc, h_offset, DC_WINBUF_ADDR_H_OFFSET);
> +	tegra_dc_writel(dc, v_offset, DC_WINBUF_ADDR_V_OFFSET);
> +
> +	value = WIN_ENABLE;
> +
> +	if (bpp < 24)
> +		value |= COLOR_EXPAND;
> +
> +	tegra_dc_writel(dc, value, DC_WIN_WIN_OPTIONS);
> +
> +	/*
> +	 * Disable blending and assume Window A is the bottom-most window,
> +	 * Window C is the top-most window and Window B is in the middle.
> +	 */
> +	tegra_dc_writel(dc, 0xffff00, DC_WIN_BLEND_NOKEY);
> +	tegra_dc_writel(dc, 0xffff00, DC_WIN_BLEND_1WIN);
> +
> +	switch (index) {
> +	case 0:
> +		tegra_dc_writel(dc, 0x000000, DC_WIN_BLEND_2WIN_X);
> +		tegra_dc_writel(dc, 0x000000, DC_WIN_BLEND_2WIN_Y);
> +		tegra_dc_writel(dc, 0x000000, DC_WIN_BLEND_3WIN_XY);
> +		break;
> +
> +	case 1:
> +		tegra_dc_writel(dc, 0xffff00, DC_WIN_BLEND_2WIN_X);
> +		tegra_dc_writel(dc, 0x000000, DC_WIN_BLEND_2WIN_Y);
> +		tegra_dc_writel(dc, 0x000000, DC_WIN_BLEND_3WIN_XY);
> +		break;
> +
> +	case 2:
> +		tegra_dc_writel(dc, 0xffff00, DC_WIN_BLEND_2WIN_X);
> +		tegra_dc_writel(dc, 0xffff00, DC_WIN_BLEND_2WIN_Y);
> +		tegra_dc_writel(dc, 0xffff00, DC_WIN_BLEND_3WIN_XY);
> +		break;
> +	}
> +
> +	value = (WIN_A_ACT_REQ << index) | (WIN_A_UPDATE << index);
> +	tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
> +
> +	return 0;
> +}
> +
> +unsigned int tegra_dc_format(uint32_t format)
> +{
> +	switch (format) {
> +	case DRM_FORMAT_XRGB8888:
> +		return WIN_COLOR_DEPTH_B8G8R8A8;
> +

Just for curious, why we choose "WIN_COLOR_DEPTH_B8G8R8A8" while not
"WIN_COLOR_DEPTH_R8G8B8A8" here? I recall you and Stephen talked about
this last year but I still don't know the reason.

> +	case DRM_FORMAT_RGB565:
> +		return WIN_COLOR_DEPTH_B5G6R5;
> +
> +	default:
> +		break;
> +	}
> +
> +	WARN(1, "unsupported pixel format %u, using default\n", format);
> +	return WIN_COLOR_DEPTH_B8G8R8A8;
> +}
> +
[...]
> +/* from dc.c */
> +extern unsigned int tegra_dc_format(uint32_t format);
> +extern int tegra_dc_setup_window(struct tegra_dc *dc, unsigned int index,
> +				 const struct tegra_dc_window *window);
> +
>  struct tegra_output_ops {
>  	int (*enable)(struct tegra_output *output);
>  	int (*disable)(struct tegra_output *output);
> 
