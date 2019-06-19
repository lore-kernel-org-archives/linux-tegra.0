From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 3/8] clocksource/drivers/tegra: Set and use timer's
 period
Date: Wed, 19 Jun 2019 10:18:22 +0200
Message-ID: <20190619081822.GD3187@ulmo>
References: <20190618140358.13148-1-digetx@gmail.com>
 <20190618140358.13148-4-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="oj4kGyHlBMXGt3Le"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190618140358.13148-4-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--oj4kGyHlBMXGt3Le
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 05:03:53PM +0300, Dmitry Osipenko wrote:
> The of_clk structure has a period field that is set up initially by
> timer_of_clk_init(), that period value need to be adjusted for a case of
> TIMER1-9 that are running at a fixed rate that doesn't match the clock's
> rate. Note that the period value is currently used only by some of the
> clocksource drivers internally and hence this is just a minor cleanup
> change that doesn't fix anything.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clocksource/timer-tegra.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--oj4kGyHlBMXGt3Le
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0J784ACgkQ3SOs138+
s6G7NA//VwmW7oUtMjv3N3sEQLTm5K8NQhFBB1WgJnGGgqD+PGdyKlmX93j4XAsd
MKaUtSVsFk6DaPnKlDWMoUCkJUqYjgwiLK1fNAXaiFyj1dxzc+sDVdIHNIJ5CnJc
4fqTQU4gkEInf7ac0kxAaYjR5woyzLjizhidK5aNzEtfqtEHwSUJmw9bWx6BDpdS
iP59g0AtACJodakc+5krfJ0ZDesSLL8KpA8szbvgpqVCWjgVJ9UvSJ5CzHniNXC/
YDGX+nY2UjED9h4yS8+xA5WGANmV2lm6T3QwpoUfcYK0vflywSmR488qTm+Fen47
a8518Y4FuLRNrwglQnZhF55BDWonyVsOEmfPOc4eIJ1EMbnKZ+ayUxxcOphWiSu8
tq0X8z8QllYftEcC6V0IqtqeB4CqR3fxVY0L/RK0LF/36Azn1361WFXmT7BcSqFR
HzWld/hlHKag/Ux1ka3kM8PhIz7AizGnvtrmPumEqyDs5Ju/vfUt0q/do1Ykj7vd
TNmousIP+brO1v15ryKsqs70M5Xejo+wVH1V7Wf3aQaFwOxt9syphL9PNGf7dfJ5
Y/FU9+sHtqtNU6Q4Bth7wT6OQhhlESRaH44AaDjBUb9JlQ/xqEOCaURDYFTO+Lsm
srbM1BEiuYkSfas3dZheMOpc/62g//hj9UmePPdeOtBa8cLKOas=
=HaRR
-----END PGP SIGNATURE-----

--oj4kGyHlBMXGt3Le--
