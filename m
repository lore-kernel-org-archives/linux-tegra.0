From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 5/5] drm/tegra: Implement page-flipping support
Date: Tue, 22 Jan 2013 10:31:11 +0200
Message-ID: <50FE4E4F.6080506@nvidia.com>
References: <1358179560-26799-1-git-send-email-thierry.reding@avionic-design.de> <1358179560-26799-6-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358179560-26799-6-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 14.01.2013 18:06, Thierry Reding wrote:
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

The patch seems fine to me. I have a question for a follow-up.

In downstream dc driver we initiate a page flip, and assign a fence
(syncpt id, value) to it. We return the fence to user space. Then when
the actual page flip is done, dc increments the sync point.

User space can take the fence and use it for synchronizing graphics
operations. In downstream, we use that fence to be able to submit
operations to graphics units and synchronize them to the flip by adding
a host wait. It improves performance, because we can prepare and send
the graphics operations to hardware while flip is still happening.

Is this something we could do in tegra-drm, too? DRM's page flip IOCTL
doesn't seem to have a way to pass a fence back from fence, so we'd need
to find a way to pass the fence back to user space.

Of course, this has the prerequisite of having support for syncpts,
which I hoped we would get to 3.9. The review for host1x patches seem to
have stalled, so that's iffy.

Terje
