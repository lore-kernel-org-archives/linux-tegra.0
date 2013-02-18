From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 3/7] drm/tegra: Implement .mode_set_base()
Date: Mon, 18 Feb 2013 14:17:53 +0800
Message-ID: <5121C791.3040903@gmail.com>
References: <1360771506-17849-1-git-send-email-thierry.reding@avionic-design.de> <1360771506-17849-4-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360771506-17849-4-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/14/2013 12:05 AM, Thierry Reding wrote:
> The sequence for replacing the scanout buffer is much shorter than a
> full mode change operation so implementing this callback considerably
> speeds up cases where only a new framebuffer is to be scanned out.
> 
> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> ---
> Changes in v3:
> - split DC_CMD_STATE_CONTROL writes
> 
>  drivers/gpu/drm/tegra/dc.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 8f97b1c..cc4c85e 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -114,6 +114,27 @@ static int tegra_dc_add_planes(struct drm_device *drm, struct tegra_dc *dc)
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
> +	value = GENERAL_UPDATE | WIN_A_UPDATE;
> +	tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
> +
> +	value = GENERAL_ACT_REQ | WIN_A_ACT_REQ;
> +	tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
> +
> +	return 0;
> +}

Again, what do you think about the "line stride" problem I mentioned:

http://lists.freedesktop.org/archives/dri-devel/2013-January/033561.html

Don't get me wrong that I also don't want to add a line stride update
here because that doesn't make sense. It's just a workaround. But we
need to find a way to make multi-head page flip working.

Mark
> +
>  static const struct drm_crtc_funcs tegra_crtc_funcs = {
>  	.set_config = drm_crtc_helper_set_config,
>  	.destroy = drm_crtc_cleanup,
> @@ -416,6 +437,15 @@ static int tegra_crtc_mode_set(struct drm_crtc *crtc,
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
> @@ -495,6 +525,7 @@ static const struct drm_crtc_helper_funcs tegra_crtc_helper_funcs = {
>  	.disable = tegra_crtc_disable,
>  	.mode_fixup = tegra_crtc_mode_fixup,
>  	.mode_set = tegra_crtc_mode_set,
> +	.mode_set_base = tegra_crtc_mode_set_base,
>  	.prepare = tegra_crtc_prepare,
>  	.commit = tegra_crtc_commit,
>  	.load_lut = tegra_crtc_load_lut,
> 
