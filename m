From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] clk: tegra: fix pllu rate configuration
Date: Thu, 8 Mar 2018 15:57:43 +0100
Message-ID: <20180308145743.GK3529@ulmo>
References: <20180222230451.15515-1-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="YQEH9CATo+4lan7A"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180222230451.15515-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Prashant Gaikwad <pgaikwad@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--YQEH9CATo+4lan7A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2018 at 12:04:51AM +0100, Marcel Ziswiler wrote:
> Turns out latest upstream U-Boot does not configure/enable pllu which
> leaves it at some default rate of 500 kHz:
>=20
> root@apalis-t30:~# cat /sys/kernel/debug/clk/clk_summary | grep pll_u
>        pll_u                  3        3        0      500000          0
>=20
> Of course this won't quite work leading to the following messages:
>=20
> [    6.559593] usb 2-1: new full-speed USB device number 2 using tegra-
> ehci
> [   11.759173] usb 2-1: device descriptor read/64, error -110
> [   27.119453] usb 2-1: device descriptor read/64, error -110
> [   27.389217] usb 2-1: new full-speed USB device number 3 using tegra-
> ehci
> [   32.559454] usb 2-1: device descriptor read/64, error -110
> [   47.929777] usb 2-1: device descriptor read/64, error -110
> [   48.049658] usb usb2-port1: attempt power cycle
> [   48.759475] usb 2-1: new full-speed USB device number 4 using tegra-
> ehci
> [   59.349457] usb 2-1: device not accepting address 4, error -110
> [   59.509449] usb 2-1: new full-speed USB device number 5 using tegra-
> ehci
> [   70.069457] usb 2-1: device not accepting address 5, error -110
> [   70.079721] usb usb2-port1: unable to enumerate USB device
>=20
> Fix this by actually allowing the rate also being set from within
> the Linux kernel.
>=20
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>=20
> ---
>=20
>  drivers/clk/tegra/clk-pll.c | 2 ++
>  1 file changed, 2 insertions(+)

I'm aware of the discussion about how best to implement this, but this
seems like a reasonable fix until we have something better.

Peter, Jon: if you want to fix this more properly, please take point on
this.

Applied this to for-4.17/clk, thanks.

Thierry

--YQEH9CATo+4lan7A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqhT2QACgkQ3SOs138+
s6HfIg//QKMJaDaJsNPOL3kC7s3piPoVc3qyNEdrNAafHWTrnt25IU22tV/X2RV2
uAAGQVTk5MOunhgKNbBhz/i1I6FIyTqyQWx+QyB8NFjZQ8HXNfc+O2cl/IQGLq+k
BESU2HOISJ7THKGteMsMw3wJLKRFjBMHllLYxd9DEdvA+04SaIf318eBeHMeQyIQ
Dh+QMtq7FyAmrEDQLFTJhEkB627kty2bD/3BXhLZpHjG0Qb8MpXp4/BBPcqWubju
HsVeEJjcpfshp7k9uIAACnnh0TqtfliFdmksuis5NIpzIO9jzLkXbIc6Zyy+sDTk
2UyrJj7FGVG7fHGkLzLbI2wFpTq8sYu1om7Qp9vWk6GVTm+uBdWjQeym1ocKw6SM
R5voboBXMtDuTuBQ9FRzj2gf9AckOCgipOQsWK3dbp4u6H4aaRdaIJ6wwYz5DRMZ
8P/OMON/BJCuIF+sM4b5ddrLmhkiE0Pz4MCt5/LnRe7p+9pEHG5mFBV7bTwsJZsr
Dd+zgI4L8ReBStB7UAhD2fZFH+kz03BSQbwVn2UbaWt2Z3mF29KDMHkhHT8jwHH+
MEGStWJuCCenVgwP69IowpKkJlqusgJh9WmUXDBMqkgwc0WYo7hGKf8JCmfT10Xr
GCMzihI1h8TQb01sjJX5Yp9lkxy40Qd27jLPiMy0Zpi8RR4hk8E=
=9v9j
-----END PGP SIGNATURE-----

--YQEH9CATo+4lan7A--
