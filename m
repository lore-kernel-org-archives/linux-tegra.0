From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 02/16] PM / devfreq: tegra: Replace readl-writel with
 relaxed versions
Date: Tue, 4 Jun 2019 12:55:54 +0200
Message-ID: <20190604105554.GB16519@ulmo>
References: <20190501233815.32643-1-digetx@gmail.com>
 <20190501233815.32643-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190501233815.32643-3-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--gatW/ieO32f1wygP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2019 at 02:38:01AM +0300, Dmitry Osipenko wrote:
> There is no need to insert memory barrier on each readl/writel
> invocation, hence use the relaxed versions.
>=20
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra-devfreq.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--gatW/ieO32f1wygP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz2TjoACgkQ3SOs138+
s6HCig/+MYGm5lDlw7UEH/pX4xq0xSFTzfNLCvBD6nL3btL51CHXKvLRfsOJT1yy
mvGMSI7THp7XjAJkMWQfu3dyhdTFMsEKl+BAafPV4EhUtK0XkL4Jjttb7cP64ryf
l8OLys9nDOFLx3qHy1ZQ3HeWmWcxykzeVaX+ymvICq++6H6WR+hNYGO+bUuOA92y
588v7IjusMz4gxhiO0U6f8JhNJIvyco+TtND/KfeeNC1Svc3epWeijG25O/Zd1Yu
uYHo9F852kgM2ZVIPnVBQljZXX+5H5cOmCkP2L9iF3TcQRcCJwsTaIRpATBmWgJR
EcqM2XF+aJ2hlA8SlaJkLma0MP5EuZllYYrIO5+FpPfcDnEjOFNlK+2B1rN151pR
Zi35DCYQ0XZoK2ZKvw7ICQdPv56TZpW17u6GMS7qx+KbiCWHOFGMTg6KVNO4TeO6
Uk+nm9U4JzAhwdHdvkelGsIHIcer1QuAPCiT+v+JZNcdV0QE8nn30Np27EEVWdqK
EyNDxplwghjO8/PUaBHNwqjQs/fMemM/XCB6ffledqxi8SHLL4HZ/02KvYVI3rX7
wYyVs/HRaHaottLqKLGeaUFLz7XQkZ+eB4vmMuwSDjyRTcqAJDKf5eiN4TfTQvU/
up1EiOF/H31z8jGNyYfXZ4MK7s3+XKvouYN2ayy02N1ti9U/CjA=
=jArK
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--
