From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND PATCH] ARM: tegra: fix erroneous address in dts
Date: Mon, 18 Jul 2016 11:58:02 +0200
Message-ID: <20160718095802.GA422@ulmo.ba.sec>
References: <1468835208-13426-1-git-send-email-ralf@ramses-pyramidenbau.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1468835208-13426-1-git-send-email-ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 18, 2016 at 11:46:48AM +0200, Ralf Ramsauer wrote:
> c90bb7b enabled the high speed UARTs of the Jetson TK1. Due to a merge
> quirk, wrong addresses were introduced. Fix it and use the correct
> addresses.
>=20
> Thierry let me know, that there is another patch (b5896f67ab3c in
> linux-next) in preparation which removes all the '0,' prefixes of unit
> addresses on Tegra124 and is planned to go upstream in 4.8, so
> this patch will get reverted then.
>=20
> But for the moment, this patch is necessary to fix current misbehaviour.
>=20
> Fixes: c90bb7b9b9 ("ARM: tegra: Add high speed UARTs to Jetson TK1 device=
 tree")
> Signed-off-by: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
> Acked-by: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  arch/arm/boot/dts/tegra124-jetson-tk1.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

ARM-SoC maintainers,

Just to clarify, this is targetted at v4.7 because the offending patch
was merged in v4.7-rc1. If at all possible it'd be great to get this in,
even if this is terribly last minute.

Thanks,
Thierry

>=20
> diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dt=
s/tegra124-jetson-tk1.dts
> index 941f362..f4d8125 100644
> --- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
> +++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
> @@ -1386,7 +1386,7 @@
>  	 *   Pin 41: BR_UART1_TXD
>  	 *   Pin 44: BR_UART1_RXD
>  	 */
> -	serial@70006000 {
> +	serial@0,70006000 {
>  		compatible =3D "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
>  		status =3D "okay";
>  	};
> @@ -1398,7 +1398,7 @@
>  	 *   Pin 71: UART2_CTS_L
>  	 *   Pin 74: UART2_RTS_L
>  	 */
> -	serial@70006040 {
> +	serial@0,70006040 {
>  		compatible =3D "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
>  		status =3D "okay";
>  	};
> --=20
> 2.7.3
>=20

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXjKgmAAoJEN0jrNd/PrOhVU8QAL3PnxvtITx9Zq6fyFfvnyAh
1hsmuOgbY68UQBeRGRaBnSH7ZvInSSXpn8KPc7WKU67mJ5/jRYD21f8oktNFJKD+
m7+qa5v9TLVZCiKW/1fBgRAKOKz3DaOwhBAucVZL8mIbQUl9RPJkqen3WQ80oPtW
+YB8XHdzzeK2NnmpbYnTOi5g0upWFa7gEIFhNKS2rMyR0rACIcUhqmBeBejP/n1E
jsmCEWZxtnIvyXnbSqcw6N9hKxenLJIQAeYAqXnzdSb8l4fbYLBYptQi/wIOLnIZ
XL8U/IYMd6zZp2xh2XZL3voNsE/qqS16AaTbg0x/4e83gKb1RISuyYUfOZDcXhd1
hUQIZXfhRDrkDIgKRf6BvunRddh8BXkYPhyJRIOzdz4ywMWctSznIt1tziRLSXWJ
rRBWwF59lEL5FQh19lhfiPpyPr3yicVr4sUUhiPYOzC1yvO7tf7sZVguq+NyHYjc
dg9vHU3K6KrEzttSTr9OR+dOAB0KCDgORnVJbwU0H9579au4gifkvcZqrwnY7Jmr
/WfZ0AytfWGayq+ngRmgx+JutlHeY7vVCiWuModS+qkINzuyAIEykvTNtp5A9Lcz
kvBm/3b+XMlSYLl7zSsss7UNkqtXfSSga1l6ECs/lCnMxVDx3kXMtmMPa7TrlBQM
My1CzA1jOf7eXwWsVFAN
=p0jC
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--
