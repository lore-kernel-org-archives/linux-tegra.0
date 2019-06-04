From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 08/16] PM / devfreq: tegra: Clean up driver's probe /
 remove
Date: Tue, 4 Jun 2019 13:09:11 +0200
Message-ID: <20190604110911.GH16519@ulmo>
References: <20190501233815.32643-1-digetx@gmail.com>
 <20190501233815.32643-9-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="smOfPzt+Qjm5bNGJ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190501233815.32643-9-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--smOfPzt+Qjm5bNGJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2019 at 02:38:07AM +0300, Dmitry Osipenko wrote:
> Reset hardware, disable ACTMON clock, release OPP's and handle all
> possible error cases correctly, maintaining the correct tear down
> order. Also use devm_platform_ioremap_resource() which is now available
> in the kernel.
>=20
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra-devfreq.c | 83 +++++++++++++++++++--------------
>  1 file changed, 47 insertions(+), 36 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--smOfPzt+Qjm5bNGJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz2UVcACgkQ3SOs138+
s6Hgsg/+K4NiFub4c7Q/taEey+0URjvREsXfnRG4E66a6H0C4h5i1A/zjGOvexA6
XbF6ln87A0bDO1RSI61IdvnfYroYqgGYwhZVyRhAj9d3QJq5i1Tu19QBVlQPErj1
4pkBrax5sqjWzvqYXoDmZNlTlBAEV6oSe4IwBPlzA/MGff5o7QQWq8Ubu9FqV9DL
FORdeF0JR2tQDvNuVlP5Xi1oHi1iUZ6rBNQavAzUWobcuy+aI3BXt0tSqA9YKsMV
K02aylg+cTD2jlPkESgXzrSFKXEsKSAeqdD+iGl8PBp8PqKJfbDIwlqM3GPRWDov
o4kMQFIIpX8ZXBi0d7uxoFMRAs001rszaGNUEBk2CnG60wP/hTu6m0V0NiHavHz+
hpBSJ8DRAIyknkYn1SXDTY5QeTZfkPfjuDt6/QIJ4475LaNaKW8Fz/CXOt8XwCwX
W1kf61h9HHpqSAZ3eVvzOzZxL+8tecZ59aaw6uePxoW+zyUTD+tfZBUTiAflVkSM
/0M4OTU5LNYeJBBzKJIUX+gRhZQULERt70C4HwyMGsAGdPin3XI1LZI7MsHTHl6k
/uvSbJPPpf9Xt5Fh/1iYAK2C58KziUl8HUyopbfX69U0XTrPUnRZyMOqVlCkpL+Z
FXAbWpRz859ZhinVM089r/1M5C+CQn2+uj/Zfc1UATef4hny628=
=u80w
-----END PGP SIGNATURE-----

--smOfPzt+Qjm5bNGJ--
