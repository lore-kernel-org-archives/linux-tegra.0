From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V1] i2c: tegra: fix tegra186 hw supported features
Date: Mon, 18 Feb 2019 09:42:27 +0100
Message-ID: <20190218084227.GB19363@ulmo>
References: <1550334787-27703-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1550334787-27703-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, talho@nvidia.com, wsa@the-dreams.de, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 16, 2019 at 08:33:07AM -0800, Sowjanya Komatineni wrote:
> Tegra186 does not support multi-master mode and also there is no
> master fifo control register.
>=20
> This patch fixes supported features of Tegra186 and prevents
> crashing during boot as master fifo control register are not
> present on Tegra186 and prior.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

We really should've caught this earlier. Jon, let's think about ways to
make it easier to catch these things in the future on our test system.

Acked-by: Thierry Reding <treding@nvidia.com>

--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxqb/MACgkQ3SOs138+
s6FagxAAvWuwDorw34oreWqmswSIdriQUXtzQQ2p9LQUN4DBp1QRekITOsZejuQH
Ci/HhUghBwqNihkwNwARevAHl2VdswnachySJKOXHCaTYu0jz3qP6xjCSQvKR7WC
U2FUzzgCDW4eeZCh1dYaBOdUevgYFhE9PGoM1SxA+8lV0udsan3G8wF+NoQ4gB/r
l4NCEPz5YndOBvSTQqJWkmHMJ0b0QcwOrigLQAYDM8l/GFmlYS6ZmwvG5ebRhdbt
b7j3A3KfoUGsZjsd90jU7d3DE/f7r/pRW5vL3kcc7iIgR6L/0yss13MNbMuotjK4
ivzMDcz/rASl4WbnSP3POP8TPtE7AlVcXxjadZU7sNHDNWW/HjNnYVaTPwYRxbvc
XgyY0oW5sx266NyLP4fvvvFT7iFBSwtLWq0arsgAU7gUgkFPNKRLwJ3FbrpBIkrH
tY+nzlq1Uvhk+pso5V3xe0K+Qv19uO7Ocwg8PZE60auIN92HeXtiqelf0rG9QU//
ZcmbOgqv7Y9485AS5/hAre1cMXMDv9pUMsWjCb8v9bhzDx6Ct+3bNR9mF0GzAWnS
vFpTCwXlRwmb2Zj68qub39vkRxUbNcatLJ3u+XO6iw6Zanv73CrHR4kABnBYU8jL
e+vjnfrW2rLKmrLn8p/8FIa6B8IM9F5nE/geENvEz/+dG3FJtbo=
=XEK2
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--
