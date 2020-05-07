From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] arm64: tegra: Fix ethernet phy-mode for Jetson Xavier
Date: Thu, 7 May 2020 12:05:02 +0200
Message-ID: <20200507100502.GB2890327@ulmo>
References: <20200501072756.25348-1-jonathanh@nvidia.com>
 <20200506234218.4E11D2082E@mail.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="f2QGlHpHGjS2mn6Y"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200506234218.4E11D2082E-+nuXSHJNwjE76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 06, 2020 at 11:42:17PM +0000, Sasha Levin wrote:
> Hi
>=20
> [This is an automated email]
>=20
> This commit has been processed because it contains a -stable tag.
> The stable tag indicates that it's relevant for the following trees: all
>=20
> The bot has tested the following trees: v5.6.8, v5.4.36, v4.19.119, v4.14=
=2E177, v4.9.220, v4.4.220.
>=20
> v5.6.8: Build OK!
> v5.4.36: Build OK!
> v4.19.119: Build OK!
> v4.14.177: Failed to apply! Possible dependencies:
>     5425fb15d8ee ("arm64: tegra: Add Tegra194 chip device tree")
>     b8656c673a6b ("arm64: tegra: Add device tree for the Tegra194 P2972-0=
000 board")
>     f69ce393ec48 ("arm64: tegra: Add GPIO controller on Tegra194")
>     f89b58ce71a9 ("arm64: tegra: Add ethernet controller on Tegra194")
>=20
> v4.9.220: Failed to apply! Possible dependencies:
>     5425fb15d8ee ("arm64: tegra: Add Tegra194 chip device tree")
>     99575bceebd6 ("arm64: tegra: Add NVIDIA P2771 board support")
>     b8656c673a6b ("arm64: tegra: Add device tree for the Tegra194 P2972-0=
000 board")
>     f69ce393ec48 ("arm64: tegra: Add GPIO controller on Tegra194")
>     f89b58ce71a9 ("arm64: tegra: Add ethernet controller on Tegra194")
>=20
> v4.4.220: Failed to apply! Possible dependencies:
>     0f279ebdf3ce ("arm64: tegra: Add NVIDIA Tegra132 Norrin support")
>     2cc85bd90337 ("arm64: tegra: Add NVIDIA P2571 board support")
>     34b4f6d0599e ("arm64: tegra: Add Tegra132 support")
>     5425fb15d8ee ("arm64: tegra: Add Tegra194 chip device tree")
>     5d17ba6e638e ("arm64: tegra: Add support for Google Pixel C")
>     63023e95bec0 ("arm64: tegra: Add NVIDIA P2371 board support")
>     99575bceebd6 ("arm64: tegra: Add NVIDIA P2771 board support")
>     b8656c673a6b ("arm64: tegra: Add device tree for the Tegra194 P2972-0=
000 board")
>     f69ce393ec48 ("arm64: tegra: Add GPIO controller on Tegra194")
>     f89b58ce71a9 ("arm64: tegra: Add ethernet controller on Tegra194")
>=20
>=20
> NOTE: The patch will not be queued to stable trees until it is upstream.
>=20
> How should we proceed with this patch?

Tegra194 support was merged into v4.17, so it doesn't make backport this
to any stable kernels prior to that.

Thierry

--f2QGlHpHGjS2mn6Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6z3U4ACgkQ3SOs138+
s6ERdQ/+M8e+Pq//sHoBLsVfspJENeX9JUSLVqTVsXEnHTxnv0Ri/qKuRYOzWcgU
zktBmBWHxJt8UPlgxRqL9rcRHBf2mXRu7QsRSvBozLOuszdbp2pDq8dKGO1TgBKm
ZQJekFzhEeWm8JAQiDlHjMfqwtPNXhRefl+gyRvWjOsTlROipbcm7Qr/RmztNmWJ
73p4lkUcZ6BuRQoZgn9JDIBhDK3v02DwlJHAUjdYjRt6n4Wh39D4bllyi0JAw6FG
4zV9fLL+PY9ie6ZtRiA3ACmjc9I28UiCMs4/VXnXVxGK+L9UjjrKvONaZtQ+aPDS
wP9P9jihX6wcYOEPSoIvNBw4ne1eyWIOCdDjM0PjtYVov73xoseYv1OQGPfFdR6T
77SWjnbppJNjA1IuV1adwWBJrY8w8jxdXLTXNehURSAc+ve6WOQ725kxIRZ2HAeL
AVZb7nUI/+TiAZVYP4dntzk6rzZsQx4JhyKgYF9yVQ1NANw6QAog+RIc+4KOW+Ee
0bLJeNRNoCvAlJdwaynn6gVXNmgF3jQeMHoLpVWPwDu2ARN1vhcwYmoVC4xtdPaY
V0Eb1gORelEyYb1HwVN446IjAse8ex9wvAMPKu59l7PrbonEO8ismM2tx+8/7bkJ
9ChG18/p+Ln1yUybHvHR+FGTYdBJriPZ33rcLZ1wSkzmbnFAcA4=
=+6E+
-----END PGP SIGNATURE-----

--f2QGlHpHGjS2mn6Y--
