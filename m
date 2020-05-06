From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 3/3] cpuidle: tegra: Support CPU cluster power-down
 state on Tegra30
Date: Wed, 6 May 2020 18:33:41 +0200
Message-ID: <20200506163341.GA2723057@ulmo>
References: <20200324224335.5825-1-digetx@gmail.com>
 <20200324224335.5825-4-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200324224335.5825-4-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, Jasper Korten <jja2000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2020 at 01:43:35AM +0300, Dmitry Osipenko wrote:
> The new Tegra CPU Idle driver now has a unified code path for the coupled
> CC6 (LP2) state, this allows to enable the deepest idling state on Tegra30
> SoC where the whole CPU cluster is power-gated.
>=20
> Tested-by: Micha=C5=82 Miros=C5=82aw <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
> Tested-by: Jasper Korten <jja2000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Tested-by: David Heidelberg <david-W22tF5X+A20@public.gmane.org>
> Tested-by: Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/cpuidle/cpuidle-tegra.c | 1 -
>  1 file changed, 1 deletion(-)

Daniel,

do you mind if I pick this up into the Tegra tree because of the runtime
dependencies on the firmware and ARM core changes in patches 1 & 2?

Thierry

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6y5uIACgkQ3SOs138+
s6ELSg/+ODvaAUgkUW/e00mnp5rjl66/K9AQ6QUsvJwNoMl/3hKUNb2YOSIsiLck
h0POrtB4ShVEuibgWQqHanbVX90LC45500sxKDSpEz7ypUiuj+WyRLcsoV1PxEIK
SluqiHdGV+hELIlD3OiZSayTrWefPrzVTBotXomJWiEBhsL4333gvhiFQJmRvQAL
MKV1XBC1ay7FG2cdww33YpW8JAYgQnO1+ABVbI/d8LKbEXJFKxIOtpUOMWRc2AGH
MV/60S4fnebPWrF0psf6kGka5z0BDgxwYD5Cs2KjARpefJ5U6VQyW9k+B16F3Ul3
ID6C/EhM/uGwVvERaFI7TbJEaNGCaNdhC1c1Qm7b+Ez5p/iWBzZ/o72OV4gnXkqr
CSWVS7323VtouMc+Rd0sXNnZkOtBFrRPJkdC/Pjt9lfbfYwFbigDlbAmWuQ8PvLS
eXOH3JiSnrYHgjximbzLjcq4GHP20wMC6CImAb9xrHj2sndAvuBXMwaOw2TKKYY8
lXZSG/k3OACXIMzU1+FGvG4MHeBq/vcz9cRxduTMMI1gwcnRof5fXBJyDtxf/Q6Z
Sa1/Jpvw5Hd7hPHb44AyGoc+CEZpbnRFG89oLAzu/bPIbu5rqiA2eHF2zyUL/h2s
/68FiSsJiX2agbiyxrACmlJgn7HXPNnfql/i9Zhre4HA2my/kRo=
=EK7n
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
