From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [RFC v2 1/8] video: tegra: Add nvhost driver
Date: Sat, 01 Dec 2012 18:34:51 +0100
Message-ID: <1354383291.1503.25.camel@tellur>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com>
	 <1353935954-13763-2-git-send-email-tbergstrom@nvidia.com>
	 <20121128212301.GA25531@avionic-0098.adnet.avionic-design.de>
	 <50B73710.2040102@nvidia.com>
	 <20121129114704.GB6150@avionic-0098.adnet.avionic-design.de>
	 <50B7AB93.5060207@wwwdotorg.org> <1354265429.1479.187.camel@tellur>
	 <50B9EDA9.2000500@nvidia.com>
	 <20121201151020.GC18209@avionic-0098.adnet.avionic-design.de>
	 <50BA3668.1010504@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50BA3668.1010504-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?ISO-8859-1?Q?Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Samstag, den 01.12.2012, 18:55 +0200 schrieb Terje Bergstr=C3=B6m:
> On 01.12.2012 17:10, Thierry Reding wrote:
> > On Sat, Dec 01, 2012 at 01:44:41PM +0200, Terje Bergstr=C3=B6m wrot=
e:
> >> host1x module being in DRM directory hinders using nvhost from any=
where
> >> outside DRM in both upstream and downstream.
> >=20
> > That's not true. Nothing keeps the rest of the kernel from using an=
 API
> > exported by the tegra-drm driver.
>=20
> Right, it's just a directory. I was actually thinking that it'd be we=
ird
> if a V4L2 driver would use something from inside drivers/gpu/drm/tegr=
a
> (V4L use DRM? Oh nooooo!).
>=20
Yes it _is_ weird to have V4L using something which resides inside DRM,
but see below.

> Shoot the idea down if it's crazy, but please think about it first. :=
-)
>=20
> I started thinking about this and we are constrained by the Linux ker=
nel
> subsystems that have a complete different architecture than hardware.
> This leads to awkward design as DRM design as it conflicts with the w=
ay
> hardware works.
>=20
> Placing host1x driver in one place, DRM driver in another and XYZ dri=
ver
> in yet another is not ideal either. We're exposing a public API which
> needs to be strictly maintained, because we maintain drivers in
> different trees, but then again, the list of users is very static and
> well-defined, so public API is an overshoot.

> How about if we look at this from the hardware architecture point of
> view? You mentioned that perhaps drivers/bus/host1x would be the best
> place for host1x driver.
>=20
> What if we put also all host1x client modules under that same directo=
ry?
> drivers/bus/host1x/drm would be for DRM interface, and all other host=
1x
> client module drivers could be placed similarly. This way we could ke=
ep
> the host1x API private to host1x and the client module drivers, and i=
t's
> easy to understand how host1x is used by just following the directory
> structure.
>=20
This would certainly make life easier, but personally I don't think it'=
s
the right thing to do. The separation of the Linux kernel into differen=
t
subsystems was done for a reason and just because the specific hardware
at hands happens to work a bit different is no valid reason to break
with the standard rules of the kernel.

So I think there is no way around handling the different drivers that
use host1x in different trees. For the time being there is _only_
tegra-drm using host1x in the upstream kernel. We have to make sure to
come up with some API which is reasonably stable, so we don't run into
big problems later. That's why I'm really in favour to keep host1x and
tegra-drm side by side in the current upstream, to make sure we can
change the API without jumping through too much hoops.

Your downstream V4L would have to use host1x from the DRM directory, bu=
t
really: is your downstream such a nice, clean codebase that you are not
able to cope with the slight ugliness of this solution?

> Naturally, we could also think if we want to have sub-components per
> host1x client (dc, 2d, etc) and a drm sub-component that implements t=
he
> DRM interface, and a V4L2 sub-component that implements V4L2 interfac=
e
> (when/if I can convince people that camera should go upstream).
>=20
To me this sound as if V4L upstream support is still a fair time away.
IMHO the right time to move out host1x is exactly the point when a
second user starts appearing upstream. This will give us some time to
fiddle with the API until we have to commit to it as being stable.

> >> I also don't like first putting the driver in one place, and then
> >> moving it with a huge commit to another place.
> >=20
> > Hehe, you're doing exactly that in this patch series. =3D)
>=20
> True, I guess it's just a matter of determining what's the best time.
>=20
See above.

[...]
> I'm not in a hurry, so let's try to figure the best design first.
> Biggest architectural unsolved problem is the memory management and
> relationship between tegradrm and host1x driver. What Lucas proposed
> about memory management makes sense, but it'll take a while to implem=
ent it.

Please make sure to remove any unnecessary cruft from host1x in the
process and don't try to make too big of a step at once. We only need
one type of memory within host1x: native host1x objects, no need to pla=
n
for support of anything else. Also taking over ownership of the IOMMU
address space might take some more work in the IOMMU API. We can leave
this out completely for a start. Both Tegra 2 and 3 should be able to
work with CMA backed objects just fine.

Regards,
Lucas
