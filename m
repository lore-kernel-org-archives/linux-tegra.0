From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V4 11/18] clk: tegra210: use fence_udelay during PLLU init
Date: Wed, 26 Jun 2019 12:12:28 +0200
Message-ID: <20190626101228.GD6362@ulmo>
References: <1561345379-2429-1-git-send-email-skomatineni@nvidia.com>
 <1561345379-2429-12-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tEFtbjk+mNEviIIX"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1561345379-2429-12-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--tEFtbjk+mNEviIIX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2019 at 08:02:52PM -0700, Sowjanya Komatineni wrote:
> This patch uses fence_udelay rather than udelay during PLLU
> initialization to ensure writes to clock registers happens before
> waiting for specified delay.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--tEFtbjk+mNEviIIX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0TRQwACgkQ3SOs138+
s6EECBAAt983RKDFZsDzVg2lEPVZgSiZ/mMjKovPSk3AqmF0/JH4M5X6AD6qjDuO
smN43eRR9Wq+WHL2FMUsf5Dvl0DPAWLw1i/ptulYJy34DHyrzMHFDzoDuC4WwJhw
HYtYZeHoYpRh8bBbpKuMCCtTFM8QR+At5/EQmGqG7Pqc5txnVzFMJYKh1WLxTVFL
th0zX1naYsRAHLah6qkM+m1/LzYd+kBLZBe+K5OyjOS4Huc2I3LA5hcye7OPTEGp
6t/U81LqcvwO0DqKBl7QJIhnDfPDASa2GBPrd1s29ryl1y5/C8ZWKs4mU56tTmKh
xMOCEYwRXjKWbZkGHAq9xsHxlhOn95/3QwR/807QAPk5tTxOaPtYsfA7dTcPj7xW
4WNRMfke6/46tQuhc8DHypBjcXdw1Rj3ypFJVBnlEWUIQRCurabL/EyLM2DDm1We
9oBJgQYLPiB4cMvjAXkRa5TmdGH35JDHQ4c+ce+vAfNawL55cpaNykpe4OeOBkx5
dWJmS5WvLPaKmdmLg0x+3Bg5/7aEAWGpwu+3vUm3uOL0hGW+E0AdqXAG34u+CxVj
A8a0yGA6Kbv30UYO5P1/AZhvxYaefvXzHDH+F/BLHgqNCn0JIEDNdnF7pCct3sgy
/Pkt5F/kDPpM+m0B2jnuWyXTJpS1YGM2Jf6tBgEbb6b5azCcBTg=
=NGxm
-----END PGP SIGNATURE-----

--tEFtbjk+mNEviIIX--
