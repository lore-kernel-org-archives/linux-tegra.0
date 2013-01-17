From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 5/5] drm/tegra: Implement page-flipping support
Date: Thu, 17 Jan 2013 14:33:47 +0800
Message-ID: <50F79B4B.1050505@gmail.com>
References: <1358179560-26799-1-git-send-email-thierry.reding@avionic-design.de> <1358179560-26799-6-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358179560-26799-6-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/15/2013 12:06 AM, Thierry Reding wrote:
> All the necessary support bits like .mode_set_base() and VBLANK are now
> available, so page-flipping case easily be implemented on top.
> 
> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
[...]
> +
> +static int tegra_dc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
> +			      struct drm_pending_vblank_event *event)
> +{
> +	struct tegra_framebuffer *newfb = to_tegra_fb(fb);
> +	struct tegra_dc *dc = to_tegra_dc(crtc);
> +	struct drm_device *drm = crtc->dev;
> +	unsigned long flags;
> +
> +	if (dc->event)
> +		return -EBUSY;
> +
> +	tegra_dc_set_base(dc, 0, 0, newfb);

"tegra_dc_set_base" only updates the frame buffer start address to dc
registers. I think this is not enough because it's possible that this
new FB may trigger a full modeset while not just a fb change. For
example, the "bpp" of the new FB differs from current setting in dc
register.

So I suggest to trigger a full modeset here(although it's slower than fb
change) or maybe you can explain why the FB change is enough.

Mark
> +
> +	if (event) {
> +		event->pipe = dc->pipe;
> +
> +		spin_lock_irqsave(&drm->event_lock, flags);
> +		dc->event = event;
> +		spin_unlock_irqrestore(&drm->event_lock, flags);
> +
> +		drm_vblank_get(drm, dc->pipe);
> +	}
> +
> +	return 0;
> +}
> +
[...]
>  struct tegra_output_ops {
>  	int (*enable)(struct tegra_output *output);
> 
