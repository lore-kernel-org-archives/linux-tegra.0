From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 27/27] drm/tegra: Add Tegra114 gr2d support
Date: Tue, 15 Oct 2013 10:37:32 +0200
Message-ID: <20131015083731.GI7856@ulmo.nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
 <1381134884-5816-28-git-send-email-treding@nvidia.com>
 <52587F2D.9070007@wwwdotorg.org>
 <525B880A.7090802@nvidia.com>
 <20131014140010.GC16302@ulmo.nvidia.com>
 <525C3497.6010700@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xGGVyNQdqA79rdfn"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <525C3497.6010700-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--xGGVyNQdqA79rdfn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2013 at 12:14:47PM -0600, Stephen Warren wrote:
> On 10/14/2013 08:00 AM, Thierry Reding wrote:
> > On Mon, Oct 14, 2013 at 08:58:34AM +0300, Terje Bergstr=C3=B6m wrote:
> >> On 12.10.2013 01:43, Stephen Warren wrote:
> >>> On 10/07/2013 02:34 AM, Thierry Reding wrote:
> >>>> The gr2d hardware in Tegra114 is compatible with that of
> >>>> Tegra20 and Tegra30. No functionaly changes are required.
> >>> Similarly here, if the HW is 100% backwards-compatible, there's
> >>> no need to add compatible values to the driver.
> >>=20
> >> We've used this mechanism for attaching a per-hw-version data
> >> structure in match table to accomodate differences in how the
> >> hardware is power gated, reset, booted, some per-soc performance
> >> related changes etc. It's also used in staging features for new
> >> chips, such as disabling power features when they're not
> >> working/verified yet.
> >>=20
> >> Upstream driver is not yet in a state where that is relevant.
> >>=20
> >> With this, would we still be able to do that with match table? It
> >> sounds like we could, because we can still (even with multiple
> >> compatible properties) add separate entries in match table and I
> >> guess the compatible properties matched in order.
> >=20
> > Yes, as long as the device tree files includes the most specific
> > value in the compatible this should still be possible. So we'd have
> > this:
> >=20
> > gr2d@54140000 { compatible =3D "nvida,tegra114-gr2d",
> > "nvidia,tegra20-gr2d"; ... };
> >=20
> > and the driver will match on "nvidia,tegra20-gr2d" if the more
> > specific "nvidia,tegra114-gr2d" is not there. When the driver is
> > updated to support Tegra114 specific functionality, then a more
> > specific entry can be added to the compatible table to handle it.
>=20
> True, but the DT fragment above is also only accurate /if/ a driver
> that only knows about "nvidia,tegra20-gr2d" can operate 100% of the
> features in Tegra20 HW on Tegra114 HW forever.

Yes, but given that we also list "nvidia,tegra114-gr2d" in the property
it will be possible to add that to the driver when new functionality is
implemented and immediately take advantage of it on Tegra114 hardware
with an old device tree file which has both compatible values.

Thierry

--xGGVyNQdqA79rdfn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSXP7LAAoJEN0jrNd/PrOhbmMQAJ9TVV7ELpEG7FarEGAUWD8k
BQn3uVYyIeAsjDdZhusXFwoCuyzKBGS5lZscuxNYBR2UIy20klK1RleIssk+YWyU
DLhzIpgvnbjRJGyQ86v/+EVpzUzr2sIYOzVgz7BsV6rl8liyhXt+Q7cewPv+bJvu
MC2TTmBHGKdQONu1iUBpjGrvlHaU4aenSz/qGd/Vo8loC5gXa3vIdaj6cRlYoQC1
sMWdZKZ743vNWQ6XDIMfFhiFO5eoyl7NtMbm/sk9yUCX7DznT60mfutkSZnx0jFY
o1eohzjXrGoCAcUTTiLwbtrxZ9aV7uJOcTSwUVVzJC3nSmnFL6NofpuIftv+REsV
389io9riwQQnMdg52uaMKFx3Hv1cO7wGQuz3pojY0laMpGachAMnvlNrqNiGDTh8
5IXf1ZRmCWuJMf1QSr7M+rdBIKDSD9NbeS3o8hUWAD1KvL4RW8rKSwXEwYZvJ7dx
jauiHRHOwjo/X6r6xSl7xbW/VWUdyCqCIi7I9X/lez2a0ljiSI8WM56+jd7e0gYl
mj69KW8jte5PfmrAJH0FhUqeouQLIA/jZe/pWmjXfHOTwVCIVmm45k0sWRI4uxOM
B9fvvdnqf/v6pkW2x+12k1R5E6lOWT/aghYO+kuFK0cpxk4njDKnHDaPvmsmWo36
TDYobv1s31XADE7Z5Rww
=c/2R
-----END PGP SIGNATURE-----

--xGGVyNQdqA79rdfn--
