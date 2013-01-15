From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [RFC v2 6/8] gpu: drm: tegra: Remove redundant host1x
Date: Tue, 15 Jan 2013 12:30:49 +0100
Message-ID: <20130115113049.GB18119@avionic-0098.adnet.avionic-design.de>
References: <50CAC2AC.1010704@nvidia.com>
 <50CB5205.1030303@wwwdotorg.org>
 <50CB850F.9090704@nvidia.com>
 <20121216121603.GA31780@avionic-0098.adnet.avionic-design.de>
 <50D2D792.1050401@nvidia.com>
 <50D34775.5010606@wwwdotorg.org>
 <50D42486.7080901@nvidia.com>
 <50D4D25B.7030506@wwwdotorg.org>
 <50E6AA69.4030001@nvidia.com>
 <50E73AA2.7090500@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8GpibOaaTibBMecb"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50E73AA2.7090500-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--8GpibOaaTibBMecb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 04, 2013 at 01:25:06PM -0700, Stephen Warren wrote:
> On 01/04/2013 03:09 AM, Terje Bergstr=C3=B6m wrote:
> ...
> > I think we have now two ways to go forward with cons and pros:
> >  1) Keep host1x and tegra-drm as separate driver
> >    + Code almost done
> >    - we need dummy device and dummy driver
> >    - extra code and API when host1x creates dummy device and its passed
> > to tegra-drm
>=20
> Just to play devil's advocate:
>=20
> I suspect that's only a few lines of code.
>=20
> >    - tegra-drm device would need to be a child of host1x device. Having
> > virtual and real devices as host1x children sounds weird.
>=20
> And I doubt that would cause problems.
>=20
> >  2) Merge host1x and tegra-drm into one module. drm is a subcomponent,
> > and whatever other personalities we wish would also be subcomponents of
> > host1x. host1x calls tegra-drm directly to handle preparation for drm
> > initialization. As they're in the same module, circular dependency is o=
k.
> >    + Simpler conceptually (no dummy device/driver)
> >    + Less code
> >    - Proposal doesn't yet exist
>=20
> But that said, I agree this approach would be very reasonable; it seems
> to me that host1x really is the main HW behind a DRM driver or a V4L2
> driver or ... As such, it seems quite reasonable for a single struct
> device to exist that represents host1x, and for the driver for that
> device to register both a DRM and a V4L2 driver etc. The code could
> physically be organized into separate modules, and under different
> Kconfig options for configurability etc.
>=20
> But either way, I'll let you (Thierry and Terje) work out which way to go.

Sorry for not getting back to you on this earlier. I just remembered
this thread when I saw Terje's latest patch series.

I agree that having everything in one location will make things a lot
easier, even if it means we have to add the tegra-drm driver to a new
location. In the long run I think this will pay off, though.

That said, I see that Terje has chosen this approach in his latest
series, so it's all good.

Thierry

--8GpibOaaTibBMecb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ9T3pAAoJEN0jrNd/PrOh2AwP/jcRl9vA4MiadUIQfzW4NtKT
GQwhUilcNgU3HeCgOCLVT8jzQMrxSExDTYFbSuiEjyieiAVDJil6TBJk7yOMq0+2
/2fc/xcHFpZwkiKHYmEv7FmHs6p3JogLSIx/TqdFWKV0/CVQHp1nzQ4edBeBxl/d
1gJR+YTPIQZIaCp/66JzWAuxISdv2tBC4euqzvaXPmYLdhNXyIiXVjCLFKsq+sJN
cotedrfXgVFpePwC/c/lp+i1uSql1KHLdGq6B1Qs/3OJFDvpZFUSVg38Qyew1F8E
q62vcNRFwkgnUKN6pDmezZjf+Riidsl/ExrmeVuDR4NvFlkosp24a+VymFFs4Iw/
afenWyA0nFD3T6795Ve8bXEogUWHZulGldnW86piPvg4iAfdunLG0PmQ8oTdwByt
EXIQoSt9Py+jX8J7ZYd6ZsF3ApAiUlVejdd8xiZpWjfkFK07aGBDMMvwSCyumAYi
d+fCFR6VVgYo8dVWFO6AogoAL7sOqO0Kc4m+z9XgHwzW16DWkPfjXpqyVn+mXpx5
/WqO0oNsYma88N5HGLxl8Ut/4BuXbTjfonRnuKBoIXMzEczk7hmzgwWer5O2saa4
hxjau/PZGefQYDAH0EwFDYmDuaVhcRAi7fmlmt3NhSBK0XC+lLuZvqlFokODxxzz
8Lwfothqji6QV0Wg5PEU
=8mTo
-----END PGP SIGNATURE-----

--8GpibOaaTibBMecb--
