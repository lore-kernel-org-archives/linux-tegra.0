From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] ARM: tegra: Add high speed UARTs to Jetson TK1
 device tree
Date: Wed, 27 Jan 2016 15:15:22 +0100
Message-ID: <20160127141522.GB21779@ulmo>
References: <1453827558-10954-1-git-send-email-ralf@ramses-pyramidenbau.de>
 <1453827558-10954-3-git-send-email-ralf@ramses-pyramidenbau.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cmJC7u66zC7hs+87"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1453827558-10954-3-git-send-email-ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--cmJC7u66zC7hs+87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 26, 2016 at 05:59:18PM +0100, Ralf Ramsauer wrote:
> This patch enables the APB DMA high speed UARTs of the Jetson TK1. So
> far, they were only enabled in NVidia's official BSP.
>=20
> Those additional UARTs are exposed on the expansion connector J3A2:
>=20
>  UART1:
>   Pin 41: BR_UART1_TXD
>   Pin 44: BR_UART1_RXD
>=20
>  UART2:
>   Pin 65: UART2_RXD
>   Pin 68: UART2_TXD
>   Pin 71: UART2_CTS_L
>   Pin 74: UART2_RTS_L
>=20
> Signed-off-by: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra124-jetson-tk1.dts | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)

Applied, thanks.

Thierry

--cmJC7u66zC7hs+87
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWqND5AAoJEN0jrNd/PrOhvpMP/12HazkipWmh9MZ+y1ghedMx
dOWxpPInyIXYj8xxAQPiF4AnKskJRefaKQ/wFD6gbPlWfuJWrST+dsZDCijbPTeg
3hEw7aPCr5QD+/kjtn2gdBjAGvtZ2IU+qYzcT8en+lSNNnAnaxC95mvQx8F5NnLR
4Hxd2cEMThXdTQniAkyj8HsSFZHJ+sDnpgJSTey+pBhAmofMhZif92WOrRWpCwuZ
hCUJHEdFWBPh30BcMCp9/APfum4NMM+c5CYXgchpZvk5IdRS7Z6vvrYDAyL5acwK
F2s2n3XbSjfLDesNt8+h2K84AflqktxlvlhsTm+WvHT+TqOh0voYH89bG45G+q5P
1hVN+GpLJjx32w7wGxRo8ZjLGsTEvvUeAzxHZeHyoh/EjiRCC+JKZgEXr8XxV7TE
cilT212k7YDzqKDim+fgA0y5XDb02aJVpq96lHRMo/pn4XyChQqbbQs8ks9lfGyX
bMMVC50SaSIcS2WGQi4Q9hxZNyNDi51XFAtcuG+0XOAWDqdoxznT4zCLSZK7yTlr
QZhA9ijLLfM0CXiLWgYl/0dj4SmmwdSwZvG8PEHyl4lS83yiddFfhmBwu19EUbxw
cA0duAVsOsKHlPRJXWPwpUitIMmbzQ4yJHkPn2iGJ8j0J0T59xrPcsW+5Km2cK5K
8lAuoQeN094+GXd+u+hP
=Qy9I
-----END PGP SIGNATURE-----

--cmJC7u66zC7hs+87--
