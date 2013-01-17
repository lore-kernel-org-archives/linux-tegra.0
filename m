From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/5] drm/tegra: Implement .mode_set_base()
Date: Thu, 17 Jan 2013 14:10:47 +0800
Message-ID: <50F795E7.2080206@gmail.com>
References: <1358179560-26799-1-git-send-email-thierry.reding@avionic-design.de> <1358179560-26799-4-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358179560-26799-4-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/15/2013 12:05 AM, Thierry Reding wrote:
> The sequence for replacing the scanout buffer is much shorter than a
> full mode change operation so implementing this callback considerably
> speeds up cases where only a new framebuffer is to be scanned out.
> 
> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/dc.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 157e962..8dd7d8a 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -116,6 +116,25 @@ static int tegra_dc_add_planes(struct drm_device *drm, struct tegra_dc *dc)
>  	return 0;
>  }
>  
> +static int tegra_dc_set_base(struct tegra_dc *dc, int x, int y,
> +			     struct tegra_framebuffer *fb)
> +{
> +	unsigned long value;
> +
> +	tegra_dc_writel(dc, WINDOW_A_SELECT, DC_CMD_DISPLAY_WINDOW_HEADER);
> +
> +	value = fb->base.offsets[0] + y * fb->base.pitches[0] +
> +		x * fb->base.bits_per_pixel / 8;
> +
> +	tegra_dc_writel(dc, fb->obj->paddr + value, DC_WINBUF_START_ADDR);
> +

Add one line here:

tegra_dc_writel(dc, fb->base.pitches[0], DC_WIN_LINE_STRIDE);

I mentioned in previous mail that the page-flip doesn't work well while
multiple heads attached(in my test case, LVDS & HDMI are enabled). And I
found out that this is because we didn't update the line stride
according to the new FB.

But ideally, I think we don't need to update the line stride setting.
The reason that we need it here is: We set a "incorrect" line stride
intentionally when multiple-head is enabled.

I use a Tegra30 cardhu board for testing. The LVDS panel works on
1366x768 while the resolution of the HDMI is 1080p. The size of the FB
created during KMS is 1080p. To make the LVDS & HDMI show correct, we
set the dc0's(connected with LVDS) line stride to 7680(1920x4). So the
final result is, the LVDS panel shows the (0,0)/(1366,768) portion in a
1080p FB.

But the video mode of the LVDS which reported to user space is still
1366x768. So the userspace program creates 2 FBs based on that and ask
drm driver to flip them. So we need to update the line stride here.

Actually, I think we need to find a better solution when multi-head is
enabled. For example, create a large FB and make two dcs display the
different part of it(just like the XRANDR's extension mode). Or maybe we
can take a look at other drm drivers for inspiration.

Mark
> +	value = GENERAL_ACT_REQ | WIN_A_ACT_REQ;
> +	value |= GENERAL_UPDATE | WIN_A_UPDATE;
> +	tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
> +
> +	return 0;
> +}
> +
>  static const struct drm_crtc_funcs tegra_crtc_funcs = {
>  	.set_config = drm_crtc_helper_set_config,
>  	.destroy = drm_crtc_cleanup,
> @@ -404,6 +423,15 @@ static int tegra_crtc_mode_set(struct drm_crtc *crtc,
>  	return 0;
>  }
>  
> +static int tegra_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
> +				    struct drm_framebuffer *old_fb)
> +{
> +	struct tegra_framebuffer *fb = to_tegra_fb(crtc->fb);
> +	struct tegra_dc *dc = to_tegra_dc(crtc);
> +
> +	return tegra_dc_set_base(dc, x, y, fb);
> +}
> +
>  static void tegra_crtc_prepare(struct drm_crtc *crtc)
>  {
>  	struct tegra_dc *dc = to_tegra_dc(crtc);
> @@ -483,6 +511,7 @@ static const struct drm_crtc_helper_funcs tegra_crtc_helper_funcs = {
>  	.dpms = tegra_crtc_dpms,
>  	.mode_fixup = tegra_crtc_mode_fixup,
>  	.mode_set = tegra_crtc_mode_set,
> +	.mode_set_base = tegra_crtc_mode_set_base,
>  	.prepare = tegra_crtc_prepare,
>  	.commit = tegra_crtc_commit,
>  	.load_lut = tegra_crtc_load_lut,
> 
