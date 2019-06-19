From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 5/8] clocksource/drivers/tegra: Add verbose definition
 for 1MHz constant
Date: Wed, 19 Jun 2019 10:18:43 +0200
Message-ID: <20190619081843.GF3187@ulmo>
References: <20190618140358.13148-1-digetx@gmail.com>
 <20190618140358.13148-6-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bGR76rFJjkSxVeRa"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190618140358.13148-6-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--bGR76rFJjkSxVeRa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 05:03:55PM +0300, Dmitry Osipenko wrote:
> Convert all 1MHz literals to a verbose constant for better readability.
>=20
> Suggested-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clocksource/timer-tegra.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--bGR76rFJjkSxVeRa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0J7+MACgkQ3SOs138+
s6FqFg//XBsxZBdBq5VKGzKISCCijv/slktRW63Wk+BT0VyHln6IGOGJjo/jDQF+
541wBbCJktHkMNJkao/G6Aph5UmHp6Ok7OacodxJ21w7ir4rDwxubuHSOYjdz8Wt
iFXzuoWsW41b919r5KT5xWxxNrDBAvHiTxf71aRvmWvHVgbpqE/tGnbbQME87NtF
38YQBCktLJvTtg3muWQefd4aoRd0uI3qH7x4Py4Xh+Igs+L6Et1/ZudDbdZ5UiCO
/7T/YrHNuFwNUR6SROG0MAV7464JYOS9H4r2Ep97vsrK31fIR/u74zSYGwrKkizC
5ham8Q0Tx1IZ4esxA7nuQZOsoNXewurj/4rvuceaQZrt2hGxHaMSWosqxiDM2irc
k4akNV4W4E5Q5VsZRMFwNyJV2l7gibu4bTVdR0SD6sQ0MppwhrrWwKxQdL74cwFt
ojZZzqJle65nOGXq5973D62kPgggYWbkC+a4jSdmmshj92Le6DG88NYX4ACqxQNw
ftBUpMToJkG7NLkzfbij8aHQwo84HVi6Mqvm/rW7t0ZeLoLCycLeGZc0D7/G5SsZ
iXbiSTPm2Z96dPhWRNTB07rx1z1pxujLruDQGQ4oF5CngQXWtci2gHXooDLCGlWL
KoHHpqWwtA1NKXVmVM7GlDFqHdjVd5Phz+GSAXafvst9MsSjIk8=
=ULQO
-----END PGP SIGNATURE-----

--bGR76rFJjkSxVeRa--
