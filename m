From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] i2c: tegra: Fix NACK error handling
Date: Mon, 9 Jul 2018 16:01:56 +0200
Message-ID: <20180709140156.GB18353@ulmo>
References: <1530608143-9222-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DBIVS5p969aUjpLe"
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1530608143-9222-1-git-send-email-jonathanh@nvidia.com>
Sender: stable-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Shardar Shariff Md <smohammed@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--DBIVS5p969aUjpLe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 03, 2018 at 09:55:43AM +0100, Jon Hunter wrote:
> On Tegra30 Cardhu the PCA9546 I2C mux is not ACK'ing I2C commands on
> resume from suspend (which is caused by the reset signal for the I2C
> mux not being configured correctl). However, this NACK is causing the
> Tegra30 to hang on resuming from suspend which is not expected as we
> detect NACKs and handle them. The hang observed appears to occur when
> resetting the I2C controller to recover from the NACK.
>=20
> Commit 77821b4678f9 ("i2c: tegra: proper handling of error cases") added
> additional error handling for some error cases including NACK, however,
> it appears that this change conflicts with an early fix by commit
> f70893d08338 ("i2c: tegra: Add delay before resetting the controller
> after NACK"). After commit 77821b4678f9 was made we now disable 'packet
> mode' before the delay from commit f70893d08338 happens. Testing shows
> that moving the delay to before disabling 'packet mode' fixes the hang
> observed on Tegra30. The delay was added to give the I2C controller
> chance to send a stop condition and so it makes sense to move this to
> before we disable packet mode. Please note that packet mode is always
> enabled for Tegra.
>=20
> Fixes: 77821b4678f9 ("i2c: tegra: proper handling of error cases")
>=20
> Cc: stable@vger.kernel.org
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)

Seems sensible:

Acked-by: Thierry Reding <treding@nvidia.com>

--DBIVS5p969aUjpLe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAltDatQACgkQ3SOs138+
s6Gr6RAAlVI3fpyoaEJqFnqAF1Hu9DAR/AgxeUqnBf8ZMsUTskUdRe+QxFnMot40
Oo6Ck5DBDFeZ0W/NeRTu63e+I/w+WjTMMiANfxwGgc1e0m6ih0lorLsf/FUsOMvG
NUyHy/RBIy1pKPs76vrJsxz/We29yiZqAGFeQsWLcN/XS+5CzvXSX0xwzYn43Bfr
5g9lulphxCfRAc3oLv4+Ehy/a0AJPCQxIyjFggvp2iwI+gWGURsrVij4UKweSKsk
fxWcrLWhKlqUToyM4i/XdOXa87wqGMYXefhtsLiYqSIdHOZbuCbmGhoRonlyI4Ls
1E8pDyS4zfRTiGTLcbo1C+t7aKw2+S3PrprOi0xRvhGAOceeddcJpL8JxUY0pFf8
9F88dZF1FKO6UZSU30h6MZuMAqgkT6Po6QFVQa24l9HJqrL1WUZkNEfXpOiX1aKD
6Bd+SF39tFAxkChmJl3hT1XEOXAo0PuTdGZmR8KtlF1DunXpIySmN6cpb3+C8cO4
pERVhCA0wv4MqFG19MdjbTh8MvEi60kqohfSie0U3IhBOwzTgyzMhV2/BpgzT2gw
wDnIUakuOmygH13T1ymLlWUUC70AxmpMj0BWo7FYp98sY6zaCgXnBVJubpuSduya
k5pzHmae69GhjrsaHWQJUIGn7vgMstCJ17NF2BWD661LFHicYxA=
=VXDy
-----END PGP SIGNATURE-----

--DBIVS5p969aUjpLe--
