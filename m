From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/3] drm/tegra: vic: Implement explicit reset support
Date: Thu, 29 Nov 2018 15:51:21 +0100
Message-ID: <20181129145121.GA23750@ulmo>
References: <20181123120639.16706-1-thierry.reding@gmail.com>
 <67b69475-7bfe-afaf-8e45-2a3aef01c05e@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0355935105=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <67b69475-7bfe-afaf-8e45-2a3aef01c05e@nvidia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============0355935105==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 29, 2018 at 01:40:32PM +0000, Jon Hunter wrote:
>=20
> On 23/11/2018 12:06, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Tegra supports generic PM domains on 64-bit ARM, and if that is enabled,
> > the power domain code will make sure that resets are asserted and
> > deasserted at appropriate points in time.
> >=20
> > If generic PM domains are not implemented, such as on 32-bit Tegra, the
> > resets need to be asserted and deasserted explicitly by the driver.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/gpu/drm/tegra/vic.c | 35 ++++++++++++++++++++++++++++++++++-
> >  1 file changed, 34 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
> > index 9fa77405db01..23f530db45ad 100644
> > --- a/drivers/gpu/drm/tegra/vic.c
> > +++ b/drivers/gpu/drm/tegra/vic.c
> > @@ -38,6 +38,7 @@ struct vic {
> >  	struct iommu_domain *domain;
> >  	struct device *dev;
> >  	struct clk *clk;
> > +	struct reset_control *rst;
> > =20
> >  	/* Platform configuration */
> >  	const struct vic_config *config;
> > @@ -56,13 +57,37 @@ static void vic_writel(struct vic *vic, u32 value, =
unsigned int offset)
> >  static int vic_runtime_resume(struct device *dev)
> >  {
> >  	struct vic *vic =3D dev_get_drvdata(dev);
> > +	int err;
> > +
> > +	err =3D clk_prepare_enable(vic->clk);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	usleep_range(2000, 4000);
>=20
> The Tegra genpd code has a usleep_range(10, 20), is that not sufficient
> here? If it is, it would be good to be consistent.

Yeah, I think that's enough. The Tegra DRM driver uses these ranges in
many places, so that's where I copied them from. None of these are part
of a hot path or anything, so whether this sleeps for 10 ns or 4 ms is
not going to matter much.

With that changed, can I consider this R-b you?

Thierry

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlv//OYACgkQ3SOs138+
s6FRZg//XJLmAgIc6tCCB4e/UR7KOasBXmhhij5W0+i9heRAI/AJlmbP2Mth6Bfc
MCetuPWvsNVe7ejb+rEo+lCRa0FnBi4bF47GNCcXC/JvO9UtVPaLsd3N6Jdi5WjI
ZRbF1HOHmjGVamPkyIcMvo4v/ZRK6T5/GZZYIJSXdsFwlN/KofAnA0Xi2embpI8R
LGKznbwrW4BLthHnAUoRkkOsq39bYQ/lJvKLKgsgRmaacjfkSgrHGz2MahwpsH3E
/eh5PRaPaSn91RTHoUqmWGqEYZM8XcC9Deezjl9PTOeSKBqcgmNvUEIjapsWhkIi
rgGL9RNGADtr7Z3dxd12qvQjXs9rPN45Xq4hTc3kgMMHnqDFVbWZIp4mDehXPLUv
+3WQQQ1loM5FNPba4d8YE8/7a2PMM4f3tr5npV28ydaLBN3MDj1abnJZNtiMf01H
LoaoIQOScQ32EuLBRbN3kjKE+H1jBv15jbVLwRGh7McwUnJZpaXG+J7xXZPCdbSc
GsqdJsxep7K2Lp/fkDt+A2UbZRV+KFfVD8evxsQnMgDaAOHiDm3KOhqGzXTmnBBR
eL1xYEjhP2j3BVOelwFFLv4XpJy/Bjce30jJebbXzPc92zUSt+8VhyZ2ahChOz7Z
Bp8k36j3JbmtfaPYElTU9vblal+vH4M5m395yXt8RB+kNjwEh+A=
=+Bmf
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--

--===============0355935105==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0355935105==--
