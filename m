From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC v2 6/8] gpu: drm: tegra: Remove redundant host1x
Date: Wed, 5 Dec 2012 12:10:50 +0200
Message-ID: <50BF1DAA.8030805@nvidia.com>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com> <1353935954-13763-7-git-send-email-tbergstrom@nvidia.com> <20121205083335.GA20984@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121205083335.GA20984-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05.12.2012 10:33, Thierry Reding wrote:
> I've been thinking about this some more and came to the conclusion that
> since we will already have a tight coupling between host1x and tegra-drm
> we may just as well keep the client registration code in host1x. The way
> I imagine this to work would be to export a public API from tegra-drm,
> say tegra_drm_init() and tegra_drm_exit(), that could be called in place
> of drm_platform_init() and drm_platform_exit() in the current code.
> 
> tegra_drm_init() could then be passed the host1x platform device to bind
> to. The only thing that would need to be done is move the fields in the
> host1x structure specific to DRM into a separate structure. host1x would
> have to export host1x_drm_init/exit() which the DRM can invoke to have
> all DRM clients register to the DRM subsystem.
> 
> From a hierarchical point of view this makes sense, with host1x being
> the parent of all DRM subdevices. It allows us to reuse the current code
> from tegra-drm that has been tested and works properly even for module
> unload/reload. We also get to keep the proper encapsulation and the
> switch to the separate host1x driver will require a much smaller patch.
> 
> Does anybody see a disadvantage in this approach?

I'm a bit confused about the scope. You mention host1x several times,
but I'm not sure if you mean the file drivers/gpu/drm/tegra/host1x.c or
the host1x driver. So I might be babbling when I answer this. Could you
please clarify that?

host1x hardware access must be encapsulated in host1x driver
(drivers/gpu/host1x if that's the location we prefer). As for the
management of the list of DRM clients, we proposed the move to drm.c,
because host1x hardware would anyway be controlled by a different
driver. Having file called host1x.c in tegradrm didn't sound logical, as
its not really controlling host1x, and its probe wouldn't be called.

If your proposal is that we'd move the management of the list of host1x
devices from tegradrm to host1x driver, we'd have a tight circular
dependency between two drivers and that's almost always a bad idea. So
far all ideas have revolved around tegradrm calling host1x, and host1x
calling a bit of DRM (for CMA, would be fixed in later version) but not
host1x calling tegradrm.

host1x driver itself has only little use for the list of clients.
Basically we need only a list of channels, and platform devices
associated with channels, to be able to dump host1x channel state.

Mind you, I believe nvhost driver as part of our BSP has had quite many
more hours of runtime than tegradrm. :-)

Terje
