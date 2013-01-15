From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v2 2/5] drm/tegra: Add plane support
Date: Tue, 15 Jan 2013 12:50:49 +0100
Message-ID: <20130115115049.GA4220@avionic-0098.adnet.avionic-design.de>
References: <1358179560-26799-1-git-send-email-thierry.reding@avionic-design.de>
 <1358179560-26799-3-git-send-email-thierry.reding@avionic-design.de>
 <50F526FF.1010101@gmail.com>
 <20130115113532.GC3503@intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130115113532.GC3503-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 15, 2013 at 01:35:32PM +0200, Ville Syrj=C3=A4l=C3=A4 wrote:
> On Tue, Jan 15, 2013 at 05:53:03PM +0800, Mark Zhang wrote:
> > On 01/15/2013 12:05 AM, Thierry Reding wrote:
> > > Add support for the B and C planes which support RGB and YUV pixel
> > > formats and can be used as overlays or hardware cursor.
> >=20
> > I think "hardware cursor" has specific meaning for Tegra(e.g: Tegra30
> > has a 32x32 24bpp or 64x64 2bpp hardware cursor). So you may change it
> > to "hardware accelerated cursor"?
> >=20
> > >=20
> > > Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> > > ---
> > [...]
> > > +
> > > +static const uint32_t plane_formats[] =3D {
> > > +	DRM_FORMAT_XRGB8888,
> > > +	DRM_FORMAT_YUV422,
> >=20
> > I haven't found something related with YUV format in this patch set. For
> > example, "tegra_dc_format" also doesn't take YUV into consideration. So
> > remove this line.
>=20
> Also note that YUV422 is a planar format. And since it's not the most
> common 4:2:2 format, my first guess would be that it's probably not
> what you wanted. YUYV or UYVY is more likely the one you're after.

Yes, I copied it from the TRM, which has YUV422 listed as non-planar
format (it has YUV422, which is the planar variant). It isn't very
specific about which variant YUV422 really is, though.

As Mark said, the window setup code can't handle planar formats yet
and tegra_dc_format() doesn't convert between DRM and Tegra formats
other than 32-bit and 16-bit RGB either, so maybe I should just drop
it instead.

Thierry

--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ9UKZAAoJEN0jrNd/PrOhil4P/2qoshmOuPjNc44WH3owL6Vx
KDl4jTmohu13vB+KSbXWVl06pCsWGB1b0jRXXMiA5U9J+5b3YV9toRWEBEVq9cpC
0mz0SSmIfTTxVZE9eb91kAQaWS/JwJuIKUeJXHXeWyN+Mpi3E2WQwudVmO/G6viv
2y7UvTSPpP1UErmM00Eb2XXrBiNEVqhBvhzGuR5EnYlDH8kCJBgVo/0JplnBcswV
cAAFNcW10hybhndl6fbkg57h5GjZ3j/f8sNeSWXxOf2MI1iyE6WiFa89YULQuWfe
/azYXGknsKKcNikwyZJHDULowhnpFWWLUdatpgLSDfe5zN8pKnJEBr5K3cHvZpHe
ojqpocin70nuHCyxJ2o95FsiC+XX2D1TOXzH2Djwm1aGyybCQYnb0xdpdHk0q3ZR
0dvwb0tJjJ8S5wV9NcSJcP9jxkYwk0Ownui62TiLMCsfzlMY6hbZlAyD0MWQR6qt
0Ogbv2Y8aAb6jEgfzhgDNOktQe3uP8/yjtRwX4Q+MOKu538LzyJNZxNSKnCsoO4u
vmUEr40Afo47I+xYBCsQi1gqZ7+ag2lT/a9ISbOk7lkHgaV57Q4KlgoqITppDGq6
ydz/jQwseVunbnqXLO3XxHvdof/hUEQt1qEWQpWYHM4eDMshYWqRfiOJOZeOckiL
GiP0n6ws07jCpqBO4Hq4
=se/G
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--
