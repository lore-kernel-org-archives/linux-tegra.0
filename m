From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH -next] drm/tegra: Use PTR_ERR_OR_ZERO in tegra_gem_create()
Date: Tue, 25 Sep 2018 10:58:17 +0200
Message-ID: <20180925085817.GA7097@ulmo>
References: <1537839351-104885-1-git-send-email-yuehaibing@huawei.com>
 <ad3ed7e3-17dd-a418-f951-3cae69b0ac32@kapsi.fi>
 <alpine.DEB.2.21.1809250936290.2702@hadrien>
 <ad47881b-59fb-7608-379c-c98cc9cc40a4@kapsi.fi>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1272135458=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <ad47881b-59fb-7608-379c-c98cc9cc40a4@kapsi.fi>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mikko Perttunen <cyndis@kapsi.fi>
Cc: David Airlie <airlied@linux.ie>, YueHaibing <yuehaibing@huawei.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>, Julia Lawall <julia.lawall@lip6.fr>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============1272135458==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Content-Disposition: inline


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 25, 2018 at 04:57:30PM +0900, Mikko Perttunen wrote:
> On 25/09/2018 16.37, Julia Lawall wrote:
> >=20
> >=20
> > On Tue, 25 Sep 2018, Mikko Perttunen wrote:
> >=20
> > > I'm not the maintainer, but in line with previous similar patches..
> > >=20
> > > NAK: this makes the code harder to read.
> >=20
> > If people don't like it, I wonder if it is a good thing for the function
> > to even exist?  Or at least the semantic patch that suggests this could=
 be
> > removed.
>=20
> Good question. I think it may still have its place in some situations - e=
=2Eg.
> if there's only one call, something like
>=20
>   return PTR_ERR_OR_ZERO(do_something());
>=20
> where this is the only potentially erroring thing in the function.
>=20
> In this case (and the previous ones I referred to), it's been a function
> with a longer series of code like
>=20
>   variable =3D function(...);
>   if (IS_ERR(variable))
>     return PTR_ERR(variable);
>=20
> and if we just change the last one it looks out of place. Although honest=
ly,
> I would just write the first example in long-form as well.
>=20
> In the end it's a question of taste. With Tegra code we have gone for not
> using PTR_ERR_OR_ZERO.

This has come up recently for the Tegra PCI driver as well, and we were
wondering the same thing. I know that Bjorn (PCI maintainer) and I have
in the past agreed that PTR_ERR_OR_ZERO() is not something we like. For
mostly the same reasons that Mikko already cited. In addition I think
that PTR_ERR_OR_ZERO() makes it needlessly complicated to append code
to a function. Instead of just adding a:

	ptr =3D function(...);
	if (IS_ERR(ptr))
		return PTR_ERR(ptr);

You need to split up the PTR_ERR_OR_ZERO() first and then be careful
that you return the correct result, etc.

I'm sure there are people that prefer PTR_ERR_OR_ZERO() over the open-
coded alternative, so this is probably just something we're going to
have to live with. Perhaps a good compromise would be to keep the macro
around, but get rid of the semantic patch that suggests the change. At
least that way we would have to go over this over and over again.

Thierry

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlup+KcACgkQ3SOs138+
s6GkyQ/8CkPM20hzLpybk7kJEyHtpVoCE24RzOcfxF6PjI6RlSLHOLXr9jBvpqYm
zDKD/geZgXUJQxnz8LS5tP1W9KUMkyFnpa5Db2WWMG0Zu0M3Op50iCLdLEnROo0a
7/iGEJ0q+Ne+jmtqy9G1T9Ik8QXMCAPkU8Sk0cSfz56c8CLWmsLI0QSw+sOVdrUG
dPJbDdEqCen8s1B5pkIm5Ico8maFcZZoeoBrnsuDnwgL+DWljx4oQRHw9hGyBV4k
g5G4b+ZJD0lNa5VaLIoEV+iBpC5ThXHX3HueLK+kzaBCm8dyQm0IVaF2ZjAXhsTf
0ygSAL3fqfCOIuLyovBymQBw/HJVZUgV9OojvTu5aEvBQiSn7YujXwTVG2gW26xE
d5d5hgrn1bPklGqyAdmfz8O0TRR18xV1KoLgBR8Ejoq2TznSFBUko5DUMmghs+g6
OAMNB5S2toooDTPJKTuGZDYezoUESqCtC8gQWyw/lRGGl+CUaRZWGy0fRsLPZcTi
9vu7N02VE0sU0BjH8Km4XRs7G+Vf/q95CS0BCwlSjt8epzcGCersLpeyuP9Sc6xY
S0D5EqZNsWpN+WieH2QsUbuSam1ytCuHY+Nf982rhE4cdRAINdph6w+vRqf+MmW2
ovC9xQPLop0KnkpUWdtk3+xVKHT25wplRBhOqkDhhWAsBnwLsp4=
=nlv0
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--

--===============1272135458==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1272135458==--
