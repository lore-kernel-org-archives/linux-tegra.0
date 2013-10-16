From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 13/13] WIP: ARM: tegra: Add Tegra114 powergate support
Date: Wed, 16 Oct 2013 21:12:26 +0200
Message-ID: <20131016191225.GA660@ulmo.nvidia.com>
References: <1381850883-12722-1-git-send-email-treding@nvidia.com>
 <1381850883-12722-14-git-send-email-treding@nvidia.com>
 <525DB8B2.2050203@wwwdotorg.org>
 <1381890671.11523.15.camel@jlo-ubuntu-64.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1381890671.11523.15.camel-yx3yKKdKkHfc7b1ADBJPm0n48jw8i0AO@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2013 at 10:31:11AM +0800, Joseph Lo wrote:
> On Wed, 2013-10-16 at 05:50 +0800, Stephen Warren wrote:
> > On 10/15/2013 09:28 AM, Thierry Reding wrote:
> > > Extend the list of power gates found on Tegra114. Note that there are
> > > now holes in the list, so perhaps a simple array is no longer the best
> > > data structure to represent it. But perhaps this is good enough for n=
ow
> > > and can be cleaned up in a follow up patch?
> >=20
> > Peter should probably comment on this, since I think he's touched the
> > powergate driver the most recently.
> >=20
> > One idea might be to have the powergate IDs be "virtual", with a
> > virtual->HW ID mapping table per SoC. The virtual IDs need not have any
> > gaps. I'm not sure that having gaps is really much of a problem though,
> > except for the debugfs code in powergate.c...
> >=20
> > > diff --git a/include/linux/tegra-powergate.h b/include/linux/tegra-po=
wergate.h
> >=20
> > > +#define TEGRA_POWERGATE_DISA	18
> > > +#define TEGRA_POWERGATE_DISB	19
> >=20
> > s/DIS/DSI/ perhaps?
> >=20
> > > -#define TEGRA_POWERGATE_CPU0	TEGRA_POWERGATE_CPU
> >=20
> > I expect that was added deliberately. Perhaps Peter or Joseph can
> > comment? Admittedly, it's not used right now.
> >=20
> > BTW, while you're fiddling with powergate.c, I note that
> > mach-tegra/pmc.c #defines some TEGRA_POWERGATE_xxx rather than including
> > tegra-powergate.h. Can you fix that?
>=20
> The reason why we didn't keep updated this code and use this driver is
> because we want it to convert to use generic power domain
> infrastructure[1]. Not sure this makes sense to you. (Only PCIe uses
> this powergate driver until now.)

Hi Joseph,

Is this being tracked in an internal bug? Can you provide a bug number
for me? Also do you know if anyone's actively working on this?

Thierry

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSXuUZAAoJEN0jrNd/PrOhNpwP/RpkqE0pEXSOiLpEFrqhFOlZ
84yJ86NQ/xoXp+rocntKgFJmCC2XjkvQm/+EdAeG0YAmFD6cI6KxrOYbmZPOKfJJ
ILD6Uljl0GGKs0Z0q7G/fW4ZdDVNHna0jVEoDCKIKFcp5NeyYESbzIrh2Dev1wK4
84bv6cGZxDPOvG+3jAsU2l9m5MD+Jr5bub04d+z+MvtYaYgtAOYmaXhB/Md3GOfu
hhY6G9GFUOujlymViYFfWoOD+mZwbNCL/DFEuL4rGu8uAguV4EFrGxDI6s3V5clb
6Jg/9i0XtlJS4WuTfDJXeEvTmbLBVMAREa/fmDtuSX7kRGesUhmvTRhPC+TlLZHL
iuBVN0MeoKAfLBmMwSI0x1Viny1VhrsO9XnRzC90POwic5BuKJUYcQfVvaPvp127
0i1CNbQIXa23IRDqGxK9eQUE49BgB0r8HGUiM4AZOlUwlfcaZaVHfM0Ymmnxm6Pm
FTgTRiMaYt821urKddYmwlcmjERXNVv/32smWGOVZsGga2n0X8uZrpW5H3d0sF9R
2VxceLNVe4zg2viiqFVUkL/si3gcmSSlSrO3N6byjgJ7kzQDS4343ncDvWt2X6pr
DHB750QS5zsJCa9fB+Dk6y69dyHRK8mrIGC0qT0VjkSKoXxdM3H+NzU7YkYLjfCq
t4wSBvvpzJu2111FnUaR
=AAqy
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--
