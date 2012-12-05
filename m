From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [RFC v2 6/8] gpu: drm: tegra: Remove redundant host1x
Date: Wed, 05 Dec 2012 13:02:03 +0100
Message-ID: <1354708923.1503.56.camel@tellur>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com>
	 <1353935954-13763-7-git-send-email-tbergstrom@nvidia.com>
	 <20121205083335.GA20984@avionic-0098.adnet.avionic-design.de>
	 <50BF1DAA.8030805@nvidia.com>
	 <20121205111332.GA25676@avionic-0098.adnet.avionic-design.de>
	 <50BF345A.8050201@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50BF345A.8050201-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?ISO-8859-1?Q?Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Mittwoch, den 05.12.2012, 13:47 +0200 schrieb Terje Bergstr=C3=B6m:
[...]
>=20
> > The problem that this solves is that the DRM driver needs to be bou=
nd to
> > a specific platform device. None of the DRM subdevices are suitable
> > because they are only part of the whole DRM device. I think that ho=
st1x
> > is the only device that fits here.
> >=20
> > Note that this is only an administrative problem. It shouldn't inte=
rfere
> > with the way host1x works. The goal is that the DRM device is regis=
tered
> > at the proper hierarchical location.
> >=20
> > The circular dependency is indeed a problem, though. Quite frankly =
I
> > have no idea how to solve this. However the approach taken in the
> > current patch will break several other requirements as I already
> > explained.
>=20
> The problem with doing drm_platform_init() with host1x device as
> parameter is that drm_get_platform_dev() will take control of drvdata=
=2E
> We'd need to put host1x specific struct host1x pointer to some other
> place and I'm not sure what that place could be.
>=20
> You're right in that binding to a sub-device is not a nice way. DRM
> framework just needs a "struct device" to bind to. exynos seems to so=
lve
> this by introducing a virtual device and bind to that. I'm not sure i=
f
> this is the best way, but worth considering?
>=20
I also think the introduction of a dummy platform device to aggregate
the various DRM devices would be the best way to keep a clean interface
between host1x and the tegradrm parts.

But I haven't thought through how to instantiate such a dummy device
without clobbering the device tree and sprinkling global data all over
the driver. Perhaps the host1x driver could instantiate such a device
and only provide a single API entry point to make this dummy-drm-device
known to it's subdevices. This way we don't have to move all the drm
specific aggregation of devices into host1x and could keep the API a bi=
t
leaner. Obviously this solution would not get around the circular
dependency completely, but would cut down on it a bit.

Regards,
Lucas
