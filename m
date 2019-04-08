From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/3] rtc: tegra: set range
Date: Mon, 8 Apr 2019 14:57:20 +0200
Message-ID: <20190408125720.GG6644@ulmo>
References: <20190407211646.14962-1-alexandre.belloni@bootlin.com>
 <20190408102249.GC6644@ulmo>
 <20190408115406.GJ7480@piout.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="64j1qyTOoGvYcHb1"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190408115406.GJ7480@piout.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--64j1qyTOoGvYcHb1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 08, 2019 at 01:54:06PM +0200, Alexandre Belloni wrote:
> On 08/04/2019 12:22:49+0200, Thierry Reding wrote:
> > On Sun, Apr 07, 2019 at 11:16:44PM +0200, Alexandre Belloni wrote:
> > > The Tegra 20 RTC is a 32bit seconds counter (with an unused milliseco=
nd
> > > counter).
> > >=20
> > > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > > ---
> > >  drivers/rtc/rtc-tegra.c | 24 ++++++++++++++----------
> > >  1 file changed, 14 insertions(+), 10 deletions(-)
> > >=20
> > > diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
> > > index c6b0a99aa3a9..3f93a1f7abb5 100644
> > > --- a/drivers/rtc/rtc-tegra.c
> > > +++ b/drivers/rtc/rtc-tegra.c
> > > @@ -306,6 +306,13 @@ static int __init tegra_rtc_probe(struct platfor=
m_device *pdev)
> > > =20
> > >  	info->tegra_rtc_irq =3D ret;
> > > =20
> > > +	info->rtc_dev =3D devm_rtc_allocate_device(&pdev->dev);
> > > +	if (IS_ERR(info->rtc_dev))
> > > +		return PTR_ERR(info->rtc_dev);
> > > +
> > > +	info->rtc_dev->ops =3D &tegra_rtc_ops;
> > > +	info->rtc_dev->range_max =3D U32_MAX;
> >=20
> > The placement of this new block seems somewhat arbitrary, but either
> > way:
> >=20
>=20
> Well, I needed it to be before the clk_prepare_enable call so it can
> just return and I thought it would be better to leave devm_clk_get close
> to that clk_prepare_enable call. I don't mind, I can respin with it
> placed somewhere else.

Don't bother. It's really just a cosmetic change and I couldn't tell you
a much better place without moving some other pieces around either. If
somebody really cares a lot, this can be done in a separate follow-up.

Thierry

--64j1qyTOoGvYcHb1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyrRSwACgkQ3SOs138+
s6HzEQ/9ExhdNimQvOmx53R3w1xJ1Wk536aT0GLQDRqlWjzLPyUbvlZyzRfJ541s
uFOPMRmTyKrK8ovCzZBYJwXuUxOnErCdhU6zfRln6D6LWkf8Cufv89WcJzYMzOHn
EBJIm5+mhzOgZJKfk/fzYeZ+837PS9m+ngEWEG2suv6O3VE4//5gfM0ti4+31TyL
WcD1LOFMPW2YueYfQ1gsdnl+OOcOjahks3H+tSgfHyrJtHN/DlaKVT4NWvtMLWQ/
AcwaxECeb6REOeAgDMynYJgsX1blx+1ei7m1F0oRL5UIu4buDMVk4Pnimr+Iva41
+mprBE+AKrDKYwFU18lajbaj682asJSpraUxqC71rV9pf5Wx6Svg5UojvqxktE9G
dgQ+GDnsDX9TDwneRTwCK0CGQixlyPOEddiouO6NuLtLCO99jLnPTdQag9qk4T15
Ol3i0rQT8vJlW+VhOTsvzO9n5qgnOPxz0cP3fYrvM3cv1XFT4nax1/f1n1DJ4PbG
E7rfBQz+eAD4JE5bbh73zaCgmGQb7Y+kG0NSfwubId80wxO2bT4EMUlbQ2YQsLi3
CAw2P4QlSj5aO+sOlRFis8e9EE35x3Y+rRQk/xyFVM1+vRGUQmd15cYkBioueSZB
SQivmru56TP/JghItz6/pfCJNAGc/4j1GeTIJI3x7lMktDkL/HQ=
=sXSP
-----END PGP SIGNATURE-----

--64j1qyTOoGvYcHb1--
