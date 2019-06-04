From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 11/16] PM / devfreq: tegra: Move governor registration
 to driver's probe
Date: Tue, 4 Jun 2019 13:15:50 +0200
Message-ID: <20190604111550.GK16519@ulmo>
References: <20190501233815.32643-1-digetx@gmail.com>
 <20190501233815.32643-12-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="huBJOJF9BsF479P6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190501233815.32643-12-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--huBJOJF9BsF479P6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2019 at 02:38:10AM +0300, Dmitry Osipenko wrote:
> There is no need to register the ACTMON's governor separately from
> the driver, hence let's move the registration into the driver's probe
> function for consistency and to make code cleaner a tad.
>=20
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra-devfreq.c | 43 +++++++++------------------------
>  1 file changed, 12 insertions(+), 31 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--huBJOJF9BsF479P6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz2UuUACgkQ3SOs138+
s6Fa/xAAs8/9N6QKLabrkCEp1ToGj+FPPRziPGrEF4FIVRI0CrWTozbqCUuSW8Eb
rEp2+kYShvkK/pJcWnxUNnfXYthbe3YJgpqdZsaZlmCUZ8BueuKi7z5hY9GHouM4
zX/X3nXzxib7mMP8+Rtv3jXyJs58bqW/uxT4Jo8udtWwhWj4VOL922XOHXKTxjKa
qZFO4vcdr4eRhvKCx+Up4eK2k8gcZW275NL60VPGhrF5Xkwv1oqVBc/GNrSnbQap
54EUU3VECtFfWJ8Z/TNZjgDaI0C70sDeZIjZBTQ9CucQZjnIqPFk3UMAL004X/QF
wp24N1LZzDPq+ymcFlZGqc1Lnzz3peebcu+ddL/uQIYuetddt+QVDzmwyyiCvnXG
bRlk0ibhdUEBW7/iogajwF62VJHNjk3qWGf9u7GCkVTUDaR/eaiFuHyj2dgFTUQ8
QWGSZ9G0FxZzNQX04yTd1+sWHeF6y6LNFW3/++iN2w0nI7T9/c3wYaheLrr//dC6
5+Zw9LaiU7P0v96xwgA3XgCyZwh2eze6V01yOJte+USSeR0DwLvGJNzq5MDI5fUh
a3MzkrWtDVbfExgWNWIidARnlPgvwSIoExNeJ6r40uWDNEunAj3vuiA2tushly3H
kXY/xyTe1tR2KNana6MfL9O6/FcVZi5AflGjyHToD3T5Ok2hx2E=
=xHPf
-----END PGP SIGNATURE-----

--huBJOJF9BsF479P6--
