From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 16/27] drm/tegra: Add Tegra114 display controller
 support
Date: Tue, 15 Oct 2013 10:06:34 +0200
Message-ID: <20131015080633.GF7856@ulmo.nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
 <1381134884-5816-17-git-send-email-treding@nvidia.com>
 <52587843.9070806@wwwdotorg.org>
 <20131012113231.GD22284@mithrandir>
 <525C325E.2090700@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lIrNkN/7tmsD/ALM"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <525C325E.2090700-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--lIrNkN/7tmsD/ALM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2013 at 12:05:18PM -0600, Stephen Warren wrote:
> On 10/12/2013 05:32 AM, Thierry Reding wrote:
> > On Fri, Oct 11, 2013 at 04:14:27PM -0600, Stephen Warren wrote:
> >> On 10/07/2013 02:34 AM, Thierry Reding wrote:
> >>> From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>>=20
> >>> The Tegra114 display controller is backwards-compatible with
> >>> previous generations of the Tegra SoC. No code changes are
> >>> required.
> >>=20
> >> If the HW is backwards-compatible, then there's no need to add
> >> extra compatible values to the driver; just write the following
> >> in the DT, and it'll just work:
> >>=20
> >> compatible =3D "nvidia,tegra114-dc", "nvidia,tegra30-dc";
> >=20
> > One reason why I thought it might be useful to still include this,
> > even though unnecessary, was to match it to the host1x_drm_subdevs
> > table. We can probably remove the entry from there as well,
> > though.
> >=20
> > As far as I can tell, the same holds for Tegra30, which is also=20
> > backwards compatible with Tegra20 but the DTS doesn't contain the=20
> > Tegra20 compatible. So to keep ABI compatibility we'll need to keep
> > the nvidia,tegra30-dc in the driver's match tables, but I could
> > still update the DTS to include the nvidia,tegra20-dc for
> > correctness.
> >=20
> > Does that make sense?
>=20
> Yes, fixing the Tegra30 .dtsi file sounds like a good idea.

Done.

Thierry

--lIrNkN/7tmsD/ALM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSXPeJAAoJEN0jrNd/PrOhuusP+wTH/WaCS4FWgmMzSmbsbLQt
/X/UCSQwMLGRSTfFxsPIFmVYRLa4UNZD+H37sAupuk0nCVBzYbRfm5fHYes4BA8i
xC1YIXrz2SnTerR1iSousvFjmE5jBKD2y4zAwBh1HBIGusGeddQWG63tifmvfAcu
ANyP5Sbel9NBkudJn6tpryOYW9wcJvtyu81+PU9DESA64voJ43FQW28NKeOktCRT
53Q6hQlfSFtDJtUJoWnxoAVYm0jQMKMysUir/676VIfnAgMYMg28YC2pauvF/OoW
z2rf9yRU5FD27Ya9gecWrD9zEvwXtds4++KQ4cNlOhO9Ys2OYGIvgDKjBvuwU73K
AlhGIzVtcdjTK1nl94yoN/Kd0/gN+fLVYZN9X4WdiPfQ7Ci1XzONvVjSUe0jdvAn
TPDuC13/YMrkng+XCz2NpsLcmANZwvte1ALrcbvyumVY7Ey/0/AYmOfV+X/Syrhn
ooZcTmX4Jk/g7vlRDLsu4BuWFN715ctOV74KQn2yBOL0wXwbXsIgh5laC9FBuYbu
WBwvLV6JEKbBmasxGLjZAbTEcaq5JS29XZOC8m7wxS5+8xKv210TokeWNt+a1A67
oewbXG4pzIZ/oLY4tJFS53RbZoIX+NtT0AdNDritTL1CNJ8A0YXmlHEWcn1ocTI/
IDIvPXR9qCBrzfLh4BQr
=vKuW
-----END PGP SIGNATURE-----

--lIrNkN/7tmsD/ALM--
