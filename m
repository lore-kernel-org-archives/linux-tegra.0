From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] clockevents/drivers/tegra20: Remove obsolete inclusion
 of <asm/smp_twd.h>
Date: Fri, 16 Nov 2018 11:15:26 +0100
Message-ID: <20181116101526.GA14769@ulmo>
References: <20181115100037.17706-1-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181115100037.17706-1-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 15, 2018 at 11:00:37AM +0100, Geert Uytterhoeven wrote:
> As of commit da4a686a2cfb077a ("ARM: smp_twd: convert to use CLKSRC_OF
> init"), this header file is no longer used.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/clocksource/tegra20_timer.c | 1 -
>  1 file changed, 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlvumLsACgkQ3SOs138+
s6GHAxAAsY3Bc+7/MuN5iilPwhrsewh4i5YkA9An79ObK7T/WVY+XTqotgwZ6l5r
DnSspjbtg4RFXrhppGk8G5fduX33K6URBRpT6Vy8fZpz8oe7G+gorebb81fyX+mo
nIZ636RFiab2LkhQ6E3kcYJtAIwWXsgO8UM3+wi+qRDk6kv6I1ptREwkT6SbdEPh
cdmW2uv1iTTnlffZKMvF5Zb5jw+byD6TjioTm8Rq511Ql2YmMI8vD8ytWfi2gZGl
CgeODVtLdhjzSJ0Ffj86g0vOETKI7YhvWFpInH5En6auN7Hbx976qfI60nmVgcLU
9M1PW9uRhWkZ8acwhie1uQAnpmnjPcf9bW8KVmDY3os4AdnyrWug0Zf50GGix/vW
NO9dyjP+G+/u6+I/2uBuBAxShHx130vDh0zCsxyR0l3YFlvpjkprYhDT1aMN+mKk
kZSN2J3SsmbT0LTJv8sPuk1vwgMS6lRoy0IaJ8rH51KgtHMDkMpB//+FzwSnyD6v
tAGxiANdtZ/D/rHeOw51B4E6va8lMZxvUMkRuDesSY9o3BxPHFgAMpJVFqPouPVP
oT1cA+t6HoApyblPtrrZPRWE9zYL8C4jLbkX7Wn7yJx1hGfD3bAQJ2sdF8C9N5lY
OgtBgVSmQUmDHDq4lRygVmHxw68ORg8bB2WKqr0UJoejwa/b9wI=
=cJ92
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--
