From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 10/15] memory: tegra: Introduce memory client hot reset
Date: Mon, 30 Apr 2018 10:08:02 +0200
Message-ID: <20180430080802.GB2484@ulmo>
References: <cover.1523301400.git.digetx@gmail.com>
 <b063a7d44509189495825e73942329aca51e9e69.1523301400.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZfOjI3PrQbgiZnxM"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b063a7d44509189495825e73942329aca51e9e69.1523301400.git.digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--ZfOjI3PrQbgiZnxM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 13, 2018 at 02:33:49PM +0300, Dmitry Osipenko wrote:
> In order to reset busy HW properly, memory controller needs to be
> involved, otherwise it is possible to get corrupted memory or hang machine
> if HW was reset during DMA. Introduce memory client 'hot reset' that will
> be used for resetting of busy HW.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/mc.c | 210 ++++++++++++++++++++++++++++++++++++++
>  drivers/memory/tegra/mc.h |   2 +
>  include/soc/tegra/mc.h    |  33 ++++++
>  3 files changed, 245 insertions(+)

Applied, thanks.

Thierry

--ZfOjI3PrQbgiZnxM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlrmzuIACgkQ3SOs138+
s6GGiA/+NzYyoLLJcfGMds/qxur7OKi09JmO90XJFsaF9HfFvsN/6v09jhfwsoPD
caO/YAWVOSg1qjG8FOvWiL09TPXsxYbqriRLhEZoW8l6eWQGSxYBnkjyyhBjGlRc
1BCcNFm9FUhWUVBkQqy84hggUpUUg60lu4SPi0sRfVAtuaKvbM3NdfJJ8X/1Jbkr
AD7WsDhZKvuOwA0kD9MPsymDDWv62IE+7wnjaMPgvQKGgxtLJmCaLWPEYJgo9Tu1
ak0y6+tvCcu3ZI5C+hYf2HJZmtZHyLHnM1axLp8orl2yGm3o+btzrsyGlxRhg6HY
OJeGvinXi5zkcAGLKtp7+7/7O6hOe+BTVYA9bCPy3CHcsLlbZzSl+Y8UWYe18Lx2
+vC8tsoVi+TDa7sHXEOlcVsxgzg4K4oPl1X7IAPclhiq/9FqK4kK213jGPXoNu6e
jrnFx+5AQW4rZHk/EwCk9P7kubV8pjAAqcXbbJX9egiVhislvaWa5Yb5VN/HenrZ
xmlM993up7v5NjwFJLHmfmcMMPEXfaqT6Ro1/MnOnzRPx9OMmMmptYznbN/lSnwl
JV2LCU1f4mGhdGVjtNQv+b8x/EgdNnVAhtTQpnRaeAPTRa64xaDL4SmnUDXiK6cN
Xo3GV6y2U6cz1dxV+vDPDfdnGurbvsUulu63r/OU5p9WrsWsX5Y=
=uVsJ
-----END PGP SIGNATURE-----

--ZfOjI3PrQbgiZnxM--
