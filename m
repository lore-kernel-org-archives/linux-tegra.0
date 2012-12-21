From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC v2 6/8] gpu: drm: tegra: Remove redundant host1x
Date: Fri, 21 Dec 2012 14:19:23 -0700
Message-ID: <50D4D25B.7030506@wwwdotorg.org>
References: <50BF345A.8050201@nvidia.com> <20121205120429.GA29943@avionic-0098.adnet.avionic-design.de> <50C5CAB5.3040000@nvidia.com> <20121212160829.GA30278@avionic-0098.adnet.avionic-design.de> <50C99677.6090306@nvidia.com> <20121213085750.GA14740@avionic-0098.adnet.avionic-design.de> <50CA175F.60002@wwwdotorg.org> <50CAC2AC.1010704@nvidia.com> <50CB5205.1030303@wwwdotorg.org> <50CB850F.9090704@nvidia.com> <20121216121603.GA31780@avionic-0098.adnet.avionic-design.de> <50D2D792.1050401@nvidia.com> <50D34775.5010606@wwwdotorg.org> <50D42486.7080901@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50D42486.7080901-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/21/2012 01:57 AM, Arto Merilainen wrote:
> On 12/20/2012 07:14 PM, Stephen Warren wrote:
>>
>> What's wrong with just having each device ask the host1x (its parent)
>> for a pointer to the (dummy) tegradrm device. That seems extremely
>>
> 
> We are talking about creating a dummy device because:
> - we need to give something for drm_platform_init(),
> - drm related data should be stored somewhere,

Yes to those too, I believe.

> - some data must be passed to all driver probe() functions. This is not
> hw-related data, but just some lists that are used to ensure that all
> drivers have been initialised before calling drm_platform_init().

I haven't really thought through /when/ host1x would create the dummy
device. I guess if tegradrm really must initialize after all the devices
that it uses (rather than using something like deferred probe) then the
above may be true.

> All these issues are purely tegra-drm related and solving them elsewhere
> (in host1x) would be just wrong! host1x would not even use the dummy
> device for anything so creating it there seems bizarre.

I see the situation more like:

* There's host1x hardware.

* There's a low-level driver just for host1x itself; the host1x driver.

* There's a high-level driver for the entire host1x complex of devices.
That is tegradrm. There may be more high-level drivers in the future
(e.g. v4l2 camera driver if it needs to aggregate a bunch of host1x
sub-devices liek tegradrm does).

* The presence of the host1x DT node logically implies that both the two
drivers in the previous two points should be instantiated.

* Linux instantiates a single device per DT node.

* So, it's host1x's responsibility to instantiate the other device(s). I
think it's reasonable for the host1x driver to know exactly what
features the host1x HW complex supports; raw host1x access being one,
and the higher level concept of a tegradrm being another. So, it's
reasonable for host1x to trigger the instantiation of tegradrm.

* If DRM core didn't stomp on the device object's drvdata (or whichever
field it is), I would recommend not creating a dummy device at all, but
rather having the host1x driver directly implement multiple driver
interfaces. There are many examples like this already in the kernel,
e.g. combined GPIO+IRQ driver, combined GPIO+IRQ+pinctrl driver, etc.
