From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/3] rtc: tegra: switch to
 rtc_time64_to_tm/rtc_tm_to_time64
Date: Mon, 8 Apr 2019 12:23:25 +0200
Message-ID: <20190408102325.GD6644@ulmo>
References: <20190407211646.14962-1-alexandre.belloni@bootlin.com>
 <20190407211646.14962-2-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IMjqdzrDRly81ofr"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190407211646.14962-2-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--IMjqdzrDRly81ofr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 07, 2019 at 11:16:45PM +0200, Alexandre Belloni wrote:
> Call the 64bit versions of rtc_tm time conversion now that the range is
> enforced by the core.
>=20
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  drivers/rtc/rtc-tegra.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--IMjqdzrDRly81ofr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyrIR0ACgkQ3SOs138+
s6HX3Q//U3oKlv0L6mqhoSZEz1d0ICm/bMKHSblgOjNi43KROQnm5EdxX6nE7msb
SOPkPBtXpTxvxaPP+oXBV4CGscMVdOFjaKTRBrEfN88n4PM8FGr15RiXA4/Wrm3H
S+rs92nH9PxH+JPrgc8OJ3o+Z6jUm+0oRFoMl1d46THEZq7kZIuPvbvYdjvcRw0l
RLMGXOCQXHBm73KH/MYAOKNQBTJ55T6N+fGtxrfkRwNv6gFTsCUTSVaIivqa7b4Z
nwQr+sQXpJ2m/TrBELWvE/lkqHq9VOsWUxYaTsEP5cKME1OTV4NvRv5grGggHg5Y
Dt4uJiT5TSdfaNW4tYiHtn8rK1DCPEEC+u6tu72nQ7tx2vEcKJ9tFRu8iNB4K3Tq
lQUz8sQ5jFDVfjpXtC797xPYDU4kr+0C0dDR7y5AQTHNExePF3QSfMVMLBhtQmOq
Kgd6qNWsU/mJYd4mYR6R5WJw0/ABpPhK0UbLjv6d06yg18RZlwf2Wh+3P7VL4AY3
Jm7aMcEp0hLET/3ejpNcqrdICE0XwqVwL2MMOh0rRCFPQsqQzF1gq7f/qS56LGZv
wquKgw3W4MtbkmPa2rtJVYb5xZgOh/fz6Vue8Sgkh3JG0wnQEz+AnkNGoeLjFIaD
6GiC/P7fz1SipDX0c4UWNl0Ot6fcj0rDxa/0fgnRlvZ584iFfDs=
=ozrY
-----END PGP SIGNATURE-----

--IMjqdzrDRly81ofr--
