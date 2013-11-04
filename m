From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH v2 13/27] drm/tegra: Move subdevice infrastructure to
 host1x
Date: Mon, 4 Nov 2013 11:20:55 +0100
Message-ID: <20131104102054.GD4167@phenom.ffwll.local>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
 <1381134884-5816-14-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1381134884-5816-14-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Oct 07, 2013 at 10:34:30AM +0200, Thierry Reding wrote:
> +static struct drm_bus drm_host1x_bus = {
> +	.bus_type = DRIVER_BUS_HOST1X,
> +	.set_busid = drm_host1x_set_busid,
> +};

Imo this needs to die asap, i.e. before it lands in drm-next. I've just
spent a bit of time trying to rid ourselves of this midlayer
brain-damange, and now new stuff crops up. See

http://cgit.freedesktop.org/~danvet/drm/log/?h=drm-init-cleanup

drm_bus is a terribly midlayer madness disaster and needs to just burn
down. So what exactly is the reason here to not go with the drm_platform.c
stuff until I've gotten around to completely rip it all out?

Adding Dave.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
