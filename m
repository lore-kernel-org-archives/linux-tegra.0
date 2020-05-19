From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1] sdhci: tegra: Remove warnings about missing
 device-tree properties
Date: Tue, 19 May 2020 18:24:44 +0200
Message-ID: <20200519162444.GD2113674@ulmo>
References: <20200516154314.14769-1-digetx@gmail.com>
 <CAPDyKFo_Xp-zipqE26iMv4CFwUoMCQZy3Zr63Cp=uzePgWX7BA@mail.gmail.com>
 <b634e7a5-9a30-3bd1-126d-be62e4dd73e1@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Km1U/tdNT/EmXiR1"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <b634e7a5-9a30-3bd1-126d-be62e4dd73e1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--Km1U/tdNT/EmXiR1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2020 at 05:05:27PM +0300, Dmitry Osipenko wrote:
> 19.05.2020 10:28, Ulf Hansson =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Sat, 16 May 2020 at 17:44, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >>
> >> Several people asked me about the MMC warnings in the KMSG log and
> >> I had to tell to ignore them because these warning are irrelevant to
> >> pre-Tegra210 SoCs.
> >=20
> > Why are the warnings irrelevant?
>=20
> That's what the DT binding doc says [1].
>=20
> [1]
> https://www.kernel.org/doc/Documentation/devicetree/bindings/mmc/nvidia%2=
Ctegra20-sdhci.txt
>=20
> Although, looking at the driver's code and TRM docs, it seems that all
> those properties are really irrelevant only to the older Terga20 SoC. So
> the binding doc is a bit misleading.
>=20
> Nevertheless, the binding explicitly says that the properties are
> optional, which is correct.

Optional only means that drivers must not fail if these properties
aren't found, it doesn't mean that the driver can't warn that they
are missing.

Quite possibly the only reason why they were made optional is because
they weren't part of the bindings since the beginning. Anything added
to a binding after the first public release has to be optional by
definition, otherwise DT ABI wouldn't be stable.

I think these warnings were added on purpose, though I also see that
there are only values for these in device tree for Tegra186 and Tegra194
but not Tegra210 where these should also be necessary.

Adding Sowjanya who wrote this code. Perhaps she can clarify why the
warnings were added. If these values /should/ be there on a subset of
Tegra, then I think we should keep them, or add them again, but perhaps
add a better way of identifying when they are necessary and when it is
safe to work without them.

That said, looking at those checks I wonder if they are perhaps just
wrong. Or at the very least they seem redundant. It looks to me like
they can just be:

	if (tegra_host->pinctrl_state_XYZ =3D=3D NULL) {
		...
	}

That !IS_ERR(...) doesn't seem to do anything. But in that case, it's
also obvious why we're warning about them on platforms where these
properties don't exist in DT.

So I think we either need to add those values where appropriate so that
the warning doesn't show, or we need to narrow down where they are
really needed and add a corresponding condition.

But again, perhaps Sowjanya can help clarify if these really are only
needed on Tegra210 and later or if these also apply to older chips.

Thierry

--Km1U/tdNT/EmXiR1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7ECEkACgkQ3SOs138+
s6EgNhAAqw1+R9dClbJN52qhX8PClRXnmElzmtGpuZf4cQ5wSG07AMfW5yk/9yGX
bJ3et36KfT30XOALiGf40LN2AYU8kHbr2cwyazj58f5KlAGUCUkr/CVPVDrqwWZ+
sVY5QmVZlJBZf5LTBzt7gowEtQ1eexQ3VtbgaHDxAHOJrc5n6k3JISNcYFGPs3Vn
grAGoyhj1nObR3r/4AjHXpQANSYEUUkGcYikg0yWM3MW/ATcRyRpAIYdFrIQj/3k
Q2i3lG8PCdBKhGtFom9doq+fkU72E0aBmOytJjhdxtqmWJAF0GpOgGE2hWd8o0cZ
UrNBKvY0dvFgBjwtsGfZtSRiNzJU37V7vfSFNNfvl5LPhfvlmYlvbF1YNIScytK1
/oa/sqHZygdwFJRxfuOAvat9q0v31LziUq8/eCGNGPJjxi+9TbQG1F7NBtbsXtBg
YvV3m70VOF7tPtRbWiHyPju/DEgM3tytIE8EluOMOYc2hxCO1K1qeBR9ujgB5iVo
cEUq/Ho4QvN9Taa+d/PrDb26PQiHKRPoU/z8W7Ni+S0VW1xm7Rf5XZ8pGnD2gwvp
QrBbF/r5zzs+XNUIBwBHBrXHRvV5UqDX092lrR0kbBfXNhWQCXq9ZyR2gWqrevtl
iGiH2A/0+xWGKXDZYVX2hT4ZfZD5YZztQqCP1KZ50m3k1h/7msg=
=FLne
-----END PGP SIGNATURE-----

--Km1U/tdNT/EmXiR1--
