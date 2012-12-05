From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC v2 6/8] gpu: drm: tegra: Remove redundant host1x
Date: Wed, 5 Dec 2012 13:47:38 +0200
Message-ID: <50BF345A.8050201@nvidia.com>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com> <1353935954-13763-7-git-send-email-tbergstrom@nvidia.com> <20121205083335.GA20984@avionic-0098.adnet.avionic-design.de> <50BF1DAA.8030805@nvidia.com> <20121205111332.GA25676@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121205111332.GA25676-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05.12.2012 13:13, Thierry Reding wrote:
> What I propose is to move the client registration code that is currently
> in drivers/gpu/drm/tegra/host1x.c to the host1x driver, which may or may
> not end up in drivers/gpu/host1x.

Ok.

> 
>> host1x hardware access must be encapsulated in host1x driver
>> (drivers/gpu/host1x if that's the location we prefer). As for the
>> management of the list of DRM clients, we proposed the move to drm.c,
>> because host1x hardware would anyway be controlled by a different
>> driver. Having file called host1x.c in tegradrm didn't sound logical, as
>> its not really controlling host1x, and its probe wouldn't be called.
> 
> Oh well, at the time nobody from NVIDIA was involved so I wrote that
> code in preparation for proper host1x support that I thought I would
> have to add myself at some point. I'm more than glad that I don't have
> to do this all by myself. However the patch proposed in this series
> breaks a number of requirements such as proper encapsulation, which I
> already mentioned in more detail in another mail.

Hmm, I'm not sure if I remember that you refer to by the proper
encapsulation. Is that the fact that we bind DRM to a sub-client?

> The problem that this solves is that the DRM driver needs to be bound to
> a specific platform device. None of the DRM subdevices are suitable
> because they are only part of the whole DRM device. I think that host1x
> is the only device that fits here.
> 
> Note that this is only an administrative problem. It shouldn't interfere
> with the way host1x works. The goal is that the DRM device is registered
> at the proper hierarchical location.
> 
> The circular dependency is indeed a problem, though. Quite frankly I
> have no idea how to solve this. However the approach taken in the
> current patch will break several other requirements as I already
> explained.

The problem with doing drm_platform_init() with host1x device as
parameter is that drm_get_platform_dev() will take control of drvdata.
We'd need to put host1x specific struct host1x pointer to some other
place and I'm not sure what that place could be.

You're right in that binding to a sub-device is not a nice way. DRM
framework just needs a "struct device" to bind to. exynos seems to solve
this by introducing a virtual device and bind to that. I'm not sure if
this is the best way, but worth considering?

Terje
