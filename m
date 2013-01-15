From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH 5/5] drm/tegra: Implement page-flipping support
Date: Tue, 15 Jan 2013 18:53:19 +0100
Message-ID: <CAKMK7uFMa-QwyZJo6QaxAAbpGeNvoNp_T19wF_uA1hr1d2KHog@mail.gmail.com>
References: <1358178932-25505-1-git-send-email-thierry.reding@avionic-design.de>
	<1358178932-25505-6-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358178932-25505-6-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Jan 14, 2013 at 4:55 PM, Thierry Reding
<thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> +static void tegra_drm_preclose(struct drm_device *drm, struct drm_file *file)
> +{
> +       struct drm_crtc *crtc;
> +
> +       list_for_each_entry(crtc, &drm->mode_config.crtc_list, head)
> +               tegra_dc_cancel_page_flip(crtc, file);
> +}
> +

Why that? If userspace dies while a flip is outstanding, it's imo ok
to execute it - otherwise there might be an accounting mismatch if the
hw still scans out the old fb, but drm believes the new one is used.
Or do I miss something?

The reason I've skimmed through the patches is to check for
implications with my modeset locking rework. Review on that would be
highly appreciated ...


Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
