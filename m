From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC v2 6/8] gpu: drm: tegra: Remove redundant host1x
Date: Thu, 20 Dec 2012 23:34:26 +0200
Message-ID: <50D38462.3060302@nvidia.com>
References: <50CA175F.60002@wwwdotorg.org> <50CAC2AC.1010704@nvidia.com> <50CB5205.1030303@wwwdotorg.org> <50CB850F.9090704@nvidia.com> <20121216121603.GA31780@avionic-0098.adnet.avionic-design.de> <50D2D792.1050401@nvidia.com> <50D34775.5010606@wwwdotorg.org> <50D34F00.4080308@nvidia.com> <50D3511F.2090308@wwwdotorg.org> <50D35287.3040509@nvidia.com> <20121220203059.GA12977@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121220203059.GA12977-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 20.12.2012 22:30, Thierry Reding wrote:
> The problem with your proposed solution is that, even any of Stephen's
> valid objections aside, it won't work. Once the tegra-drm module is
> unloaded, the driver's data will be left in the current state and the
> link to the dummy device will be lost.

The dummy device is created by tegradrm's module init, because it's used
only by tegradrm. When tegradrm is unloaded, all the tegradrm devices
and drivers are unloaded and freed, including the dummy one.

> I don't think waiting for things to fail is the right option here. If we
> can make out this problem now, then now is the time to fix it. No
> excuses.

Of course not. If we know of something that fails now, let's not do that.

> And quite frankly given how all the various host1x components are
> interlinked I think having a single function that gets the DRM dummy
> device for DRM-related clients isn't that bad.

I like clear responsibilities. tegradrm is responsible for the DRM
interface, and host1x driver is responsible for host1x. tegradrm owns
its data, and can pass its pointers to the functions that need it.

But fine, I still don't like it, but I'll add host1x_set_tegradrm() and
host1x_get_tegradrm(), which act as setter and getter for tegradrm's
global data. I still think it's a solution to a problem we don't have,
but we've wasted an order of magnitude more time debating it than it
takes to implement.

Terje
