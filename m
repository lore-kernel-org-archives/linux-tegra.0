From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 1/2] clocksource/drivers/tegra: Cycles can't be 0
Date: Mon, 17 Jun 2019 11:21:48 +0200
Message-ID: <20190617092148.GA508@ulmo>
References: <20190616234744.8975-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190616234744.8975-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2019 at 02:47:43AM +0300, Dmitry Osipenko wrote:
> The minimum number of "cycles" is limited to 1 by
> clockevents_config_and_register().

Looks to me like cycles also depends on the multiplier and shift that
are computed for the clock source. It looks like the multiplier will
never be zero and the shift will always be such that it won't result in
a zero cycles either. But might be worth mentioning this in the commit
message. And it might be nice to also repeate that in a comment close to
the code, just to document this.

It took me a couple of minutes to track this all down, so I think we
should take the same amount of time to document it so that we don't have
to go through it again once we've forgotten why we made this change.

> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clocksource/timer-tegra.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/time=
r-tegra.c
> index f6a8eb0d7322..090c85358fe8 100644
> --- a/drivers/clocksource/timer-tegra.c
> +++ b/drivers/clocksource/timer-tegra.c
> @@ -54,9 +54,7 @@ static int tegra_timer_set_next_event(unsigned long cyc=
les,
>  {
>  	void __iomem *reg_base =3D timer_of_base(to_timer_of(evt));
> =20
> -	writel_relaxed(TIMER_PTV_EN |
> -		       ((cycles > 1) ? (cycles - 1) : 0), /* n+1 scheme */
> -		       reg_base + TIMER_PTV);
> +	writel_relaxed(TIMER_PTV_EN | (cycles - 1), reg_base + TIMER_PTV);

Maybe keep the n+1 scheme comment and explain why we don't need to
handle the case where cycles < 1. That way it becomes crystal clear that
we don't need it, so we decrease the chances of somebody coming around
and trying to "fix" this.

Thierry

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0HW6kACgkQ3SOs138+
s6H95xAAt3MihWlhBTfBQKS+SEt8OK3jGabb9ObCvnOeFgW0+ZoQ1j9FxZ1W6n6v
0f2OlhTcGaZz+2WlivwemWmTxE2QSLbYYPCkoDOHwP1tUF61s0IiMmXMZNYUbnMF
343t1M3zI001EqXI1mOGRi4AKGotxp5nnqnvPmRtX27YMPxLG0s9pKvxkTHEPNMM
nMInSLkWzQtLvqosmIDw81FF6s0AI3b27WTHHQwNwEVJPmV1qE4vWp3rfsnAbpct
H1WibUTvayJN9Yfvy+tVYOrI29FGE4n4o/Yrks3spFzJRxoSZ10fU+VrXYlykT8M
Y5h5vEsKnoIj3tBCdoWru42+uLfwPsOjDxk99MlFxx+GNITsuePSL5h1wnJDcOrp
ySlqLTXvWkBcPXqiJzvrvOD3Gyq34x3jADuR4oKI4mGK3tX1zv2cGSVtdp/URk2N
PQvlijaMNh6mS47AWB/i9/+gsTQVUOIsCw0fqktQhghD36VrtXJGnMX5oz9FjXEI
zaCZwfBqNjO2AVxgADH+T2nrlnY9jl1wOMf6jKxjD97XwNbAZIvp0l9G4+CMmqI0
SVfpmg9ERRWf2PF8vmMm1BzSjBgYjnPOua/YWdnJC240mXJ/+MqciLfeLbExeAqU
T9k8N0hAZOb232Y2jWCNi1SOvMgUTgnDuvKwaXsA79z3b4ENsyY=
=CQ3S
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
