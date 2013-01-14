From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v2 2/5] drm/tegra: Add plane support
Date: Mon, 14 Jan 2013 18:03:44 +0100
Message-ID: <1358183024.1524.8.camel@tellur>
References: <1358179560-26799-1-git-send-email-thierry.reding@avionic-design.de>
	 <1358179560-26799-3-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358179560-26799-3-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Montag, den 14.01.2013, 17:05 +0100 schrieb Thierry Reding:
> Add support for the B and C planes which support RGB and YUV pixel
> formats and can be used as overlays or hardware cursor.
> 
> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> ---
[...]
> +static int tegra_plane_disable(struct drm_plane *plane)
> +{
> +	struct tegra_dc *dc = to_tegra_dc(plane->crtc);
> +	struct tegra_plane *p = to_tegra_plane(plane);
> +	unsigned int index = p->index + 1;
> +	unsigned long value;
> +
> +	value = WINDOW_A_SELECT << index;
> +	tegra_dc_writel(dc, value, DC_CMD_DISPLAY_WINDOW_HEADER);
> +
> +	value = tegra_dc_readl(dc, DC_WIN_WIN_OPTIONS);
> +	value &= ~WIN_ENABLE;
> +	tegra_dc_writel(dc, value, DC_WIN_WIN_OPTIONS);
> +
> +	value = (WIN_A_ACT_REQ << index) | (WIN_A_UPDATE << index);
> +	tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
This should be two separate writes to the register. I don't know how
relevant this is on real HW, but the TRM states: "Restrictions: ACT_REQ
cannot be programmed at the same time the corresponding "UPDATE" is
programmed."

Better be safe than sorry and split it up.
[...]
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
I would like to see the root window using WIN_C, so we only loose the
least capable plane (WIN_A: no filtering or YUV conversion) when using a
plane for the hardware cursor. Maybe you can fold this in, otherwise
I'll send a patch on top of this series.

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
Same comment as above.
> +
> +	return 0;
> +}
> +
[...]
