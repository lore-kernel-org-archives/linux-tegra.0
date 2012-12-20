From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC v2 6/8] gpu: drm: tegra: Remove redundant host1x
Date: Thu, 20 Dec 2012 11:17:06 +0200
Message-ID: <50D2D792.1050401@nvidia.com>
References: <50BF345A.8050201@nvidia.com> <20121205120429.GA29943@avionic-0098.adnet.avionic-design.de> <50C5CAB5.3040000@nvidia.com> <20121212160829.GA30278@avionic-0098.adnet.avionic-design.de> <50C99677.6090306@nvidia.com> <20121213085750.GA14740@avionic-0098.adnet.avionic-design.de> <50CA175F.60002@wwwdotorg.org> <50CAC2AC.1010704@nvidia.com> <50CB5205.1030303@wwwdotorg.org> <50CB850F.9090704@nvidia.com> <20121216121603.GA31780@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121216121603.GA31780-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 16.12.2012 14:16, Thierry Reding wrote:
> Okay, so we're back on the topic of using globals. I need to assert
> again that this is not an option. If we were to use globals, then we
> could just as well leave out the dummy device and just do all of that in
> the tegra-drm driver's initialization function.

I found a way of dropping the global in a straightforward way, and
introduce dummy device for drm_platform_init().

I added dummy device and driver, and moved the tegradrm global
(previously called struct host1x *host1x) allocation to happen in the
probe. In addition, probe calls device tree node traversal to do the
tegra_drm_add_client() calls. The dummy device is owner for this global.

I changed the device tree node traversal so that it goes actually
through each host1x child, checks if it's supported by tegradrm, and if
so, sets its drvdata to point to the tegradrm data.

Each probe will add the client with tegra_drm_register_client(), and
that will find the global via dev_get_drvdata(). In the end of probe,
each driver will replace the drvdata with its own data.

I am also setting the coherent_dma_mask for dummy device so that it can
be used with CMA FB helper.

Would this be ok for you? I could send a patchset with this implemented
by tomorrow and let it simmer for 2-3 weeks due to my and everybody
elses' holidays. I'm hoping we would have 2D acceleration in Linux
kernel 3.9.

Terje
