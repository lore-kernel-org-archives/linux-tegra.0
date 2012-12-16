From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC v2 6/8] gpu: drm: tegra: Remove redundant host1x
Date: Sun, 16 Dec 2012 18:37:24 +0200
Message-ID: <50CDF8C4.4070108@nvidia.com>
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
> The whole point of all this is to link the host1x and it's particular
> tegra-drm instance. I will see if I can find the time to implement this
> in the existing driver, so that the host1x code that you want to remove
> registers the tegra-drm dummy device and the tegra-drm devices use the
> accessors as discussed previously to access host1x and the dummy device.
> Once that is implemented, removing the original host1x implementation
> should be much easier since you will only have to keep the dummy device
> instantiation along with the one or two accessor functions.

I'm not sure what you have discussed with Stephen, so I might be missing
the reason why this is a problem that needs to be solved with new
dependency between tegradrm and host1x instead of locally in tegradrm
driver itself.

As far I remember, we had two reasons for discussing the dummy device.
First reason is for DC, HDMI probe calls to find the global data. Second
is giving something to DRM framework's drm_platform_init().

The easiest way to solve the probe problem is just to have a tegradrm
accessor for the global data in the way I proposed in the patchset.
Dummy device doesn't help there, as the dummy device is in no
relationship to DC and HDMI. Sure we could tell DC to ask its parent
(host1x), and call host1x driver with platform_device pointer found that
way, and host1x would return a pointer to tegradrm's data. Hanging the
data onto host1x driver is just a more complicated way of implementing
global data, and it's breaking the responsibility split between host1x
driver and tegradrm. To me, host1x driver is responsible of host1x, and
tegradrm is responsible of the DRM interface and everything related to that.

All other parts of code use drm_device->dev_private for getting the
global data, so the access problem is only for the probe calls.

drm_platform_init() needing a device is another problem.
drm_platform_init() leads to a call to the CMA FB helper. That again
needed the coherent_dma_mask set for the device give to it. I guess that
problem can be solved by just setting the mask to 0xffffffff. But that
is still something that can be handled inside tegradrm without involving
the host1x driver.

Terje
