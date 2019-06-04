From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 09/16] PM / devfreq: tegra: Avoid inconsistency of
 current frequency value
Date: Tue, 4 Jun 2019 13:14:42 +0200
Message-ID: <20190604111442.GI16519@ulmo>
References: <20190501233815.32643-1-digetx@gmail.com>
 <20190501233815.32643-10-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="X+nYw8KZ/oNxZ8JS"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190501233815.32643-10-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--X+nYw8KZ/oNxZ8JS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2019 at 02:38:08AM +0300, Dmitry Osipenko wrote:
> The frequency value potentially could change in-between. It doesn't
> cause any real problem at all right now, but that could change in the
> future. Hence let's avoid the inconsistency.
>=20
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra-devfreq.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--X+nYw8KZ/oNxZ8JS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz2UqIACgkQ3SOs138+
s6FdDw//XYp02JzFYTmM5pd+HyO9uQsHazV0k4wuxheR+J2EbT+HOp4DBtstdbNv
jEg35xHhbQ4xXgt67Uc6aJt74WQpSDOXX6SMLa7Mu9inUodKqFSoivMW+u0DsSRe
4Bz5uAcB7jX1e4vxA5toS5th+CKCi9oz1K4PJAQVBuRldO6Noo75hN6ojLx469As
Ary2EfGIQZ3fSutmmNJ6FC+HNx69MHy/pL30HIEEMqqi2xfQzDr8692zMPi3rZ/T
XJjVr6+MBs3Mn+z6QgQbvYeQPekSIOWIGj3RGvcXwKzi3jEGpG0s9sQPMaLDqsDk
BvhRa27hNvGUppGg8kx14UyYdxxahc0ZERwnerjEpyWzfsAa2EKvX9fyF/tOQ6PG
JXYy4E+vj8bkvxD9G6DdHwn7mugkqMD21PQVCrygfsSBfjyYvCdRUMIKzsoItVVB
08hJQeTBTZV9vAnfwvNwzjm38BDlZum+nO+SMewQtmtf1s7p+I1HO+kAmFhqhE+M
7cV/EeMhuGN8U7qWig2NxbcBNjmC650hthxgb2ntk5Q88NxpCfsay6+ESKIHGYzg
dEuaxVzAuU28snKN8KQgXWTIJpxy/Yt5XrGRaNqbChgyb6SHOydCOQW8hbexSuZm
eXgfZ+MJP2q/oc/a/f/b9iDoB3LrDKKSLtEUH2DJhjYdvoMW/e8=
=/qKL
-----END PGP SIGNATURE-----

--X+nYw8KZ/oNxZ8JS--
