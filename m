From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Tegra DRM device tree bindings
Date: Tue, 26 Jun 2012 21:27:12 +0200
Message-ID: <20120626192712.GA5247@avionic-0098.adnet.avionic-design.de>
References: <20120626105513.GA9552@avionic-0098.mockup.avionic-design.de>
 <4FE9B291.2020305@nvidia.com>
 <20120626134122.GA1115@avionic-0098.mockup.avionic-design.de>
 <4FE9C0E9.7060301@nvidia.com>
 <4FE9F457.6090104@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FE9F457.6090104-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 26, 2012 at 11:41:43AM -0600, Stephen Warren wrote:
> On 06/26/2012 08:02 AM, Terje Bergstr=C3=B6m wrote:
> > On 26.06.2012 16:41, Thierry Reding wrote:
> >=20
> >> On Tue, Jun 26, 2012 at 04:01:05PM +0300, Terje Bergstr=C3=B6m wrote:
> >>> We also assign certain host1x common resources per device by conventi=
on,
> >>> f.ex. sync points, channels etc. We currently encode that information=
 in
> >>> the device node (3D uses sync point number X, 2D uses numbers Y and Z=
).
> >>> The information is not actually describing hardware, as it just
> >>> describes the convention, so I'm not sure if device tree is the proper
> >>> place for it.
> >> Are they configurable? If so I think we should provide for them being
> >> specified in the device tree. They are still hardware resources being
> >> assigned to devices.
> >=20
> > Yes, they're configurable, and there's nothing hardware specific in the
> > assignment of a sync point to a particular use. It's all just a software
> > agreement. That's why I'm a bit hesitant on putting it in device trees,
> > which are supposed to only describe hardware.
>=20
> So I think that the DT can describe the existence of sync-points
> (presumably include a node for the sync-point HW device if it's
> separate). However, since the usage of each sync-point is entirely
> arbitrary, that seems like something which should be either assigned
> dynamically at run-time, or at least managed/assigned in SW at runtime
> somehow, rather than hard-coded into DT; it's more policy than HW.

The sync-points are part of the host1x device as I understand it. If
their usage is truly generic, then we can probably ignore them safely.
Maybe it'd make sense to carry a property that defines the number of
sync points available for the host1x hardware represented by the DT?

> >>> Either way is fine for me. The full addresses are more familiar to me=
 as
> >>> we tend to use them internally.
> >
> >> Using the OF mechanism for translating the host1x bus addresses,
> >> relative to the host1x base address, to CPU addresses seems "purer", b=
ut
> >> either way should work fine.
> >=20
> > I'll let you decide, as I don't have a strong opinion either way. I
> > guess whatever is the more common way wins.
>=20
> I'd certainly prefer all the nodes to use the full/absolute address.
> That way, the DT will exactly match the addresses in the documentation.

Okay, I'll leave the ranges property as it is now.

Thierry

--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJP6g0QAAoJEN0jrNd/PrOhb1sQAI4UQfReuDaSjojxK2TS13Cd
vf0hyZuoEItcQGvgYk1KkOQ0cwA3Ku8OxudRIfZBPxucNxykbRWrSwbyX7BizdnB
/uRoXnw2JtD9EEpDUhDdbr3axbj00rKzI7qLIRPCgZZC0fsq3nLvYZidqLOIGKz5
4sPret4LXIdhdRiTDnZw79MzpB8u5XW5rdIhZcOofkxM7dBYwJRJlCDnGBtsper9
fPXIhBgMCTkGQqddWdHcoCrfdKuQMWjDpxERwtRA1aMtWm+yl6fM/8U5GlaajGF1
8wvpucSCjc+4H0/D9/0P6eYfU5ZdXYLpPbmPg1YQm0yN1ILIi88yx0Bx9dfY+UdT
5bJ5pLIvVfJo0XjhE1KtxxD1hyYRqxV7/fzG7OG7S+396uDPpVtF/jrbkztZEalC
GQsouGirgKwTcbSiiUdgeb4cMsXTeDcY8SkN9+GNH01tVYDBI3Kv0TbV+jbm5ZGf
L3QYEQt9e8Bgk+0s6LGUB57vn4pE9igxmN0xdb51bmvqWnmmEihhdJ2V8iDaVkEj
GaXmYl1Z8gX+DmpKel8mpbnTkYSEF/zNbbtp2rKTwOKn02vn2NKQ9P4bdj3rNXJI
lDvHWmg+Y/7OSkTfbiwVjRu/FTOlNCljhT9gw6fQnVuGg9fLh8WTIwQ2h4EDL/Rh
1EiX1BzESdffftJFvdWs
=kfUi
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--
