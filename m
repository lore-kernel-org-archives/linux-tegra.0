From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V1 10/10] ARM: tegra: set hw trips for Tegra124
Date: Wed, 13 Jan 2016 16:57:08 +0100
Message-ID: <20160113155708.GI2588@ulmo>
References: <1452672064-563-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KrHCbChajFcK0yQE"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452672064-563-1-git-send-email-wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--KrHCbChajFcK0yQE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 13, 2016 at 04:01:04PM +0800, Wei Ni wrote:
> Set hw trips for Tegra124.
>=20
> Signed-off-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra124.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124=
=2Edtsi
> index 68669f791c8b..c670d71a8f37 100644
> --- a/arch/arm/boot/dts/tegra124.dtsi
> +++ b/arch/arm/boot/dts/tegra124.dtsi
> @@ -701,6 +701,15 @@
>  		resets =3D <&tegra_car 78>;
>  		reset-names =3D "soctherm";
>  		#thermal-sensor-cells =3D <1>;
> +
> +		hw-trips {
> +			cpu {
> +				therm-temp =3D <103000>;
> +			};
> +			gpu {
> +				therm-temp =3D <101000>;
> +			};
> +		};
>  	};
> =20
>  	dfll: clock@0,70110000 {

For Tegra210 you added a mem subnode, why doesn't Tegra124 have one like
that?

Thierry

--KrHCbChajFcK0yQE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWlnPUAAoJEN0jrNd/PrOhlj0P/R+VcZSd0L+SHZB/rbQTlN+4
wrbdneBBcftdW7BpdBvm97F++ZxXPecQb3GXDpXkCdP3YmamA45KYXyC92UZjmpz
50oTDgfZn40u+YB4Nry8TULrFVKZBPE934Inv/ltHVlNaCiaxn6UqHbXZOmLnr63
chGlCg3Cr+ff+CV3qlBTOsakwdavT/T2tvlAwxAN8l6u7AvHL89jOcb0FPQF2nuc
0oI/yr1JVzg+dLoansEKKaJOZJQprMeWlwnAWD3uCl95BBhos0B50TdcZLMzKlGV
X5XnEKAQO2v8HLTy9bF9sBVTDJjVhSikYbQASeTv9De6G6XDYHE9dWthk4PYokYC
IO0mt1feLlCGXOrGROQvEKRdFU3VJC03esuXTYI1tRKg+pcoxtCS06s7haqE9oe6
9v8AWxTm1Gj81Mz9zKYLwKE3l3WBGoAM89dzLslks2ZPU357oNRJbMaeElqTC7Pi
TfZKvc3JQFxn2ejGcmQt24Y1eEx4os3w8Jul0oQLoJnhSaUhx163vs7EuLpZewoy
v/yHJl1Etjr2TsagNZGbLLU+0JuHeR4HLqbBXP41talgReTMcecIh45jXoX6W/BH
iGp+aAYWGAPUaCZqeauPg/A5PukcvJn2vX2Mv+Wi0YFbxcynCqDXt9k3TDPykqan
bkaGaeqNfwsKBzus0Nq+
=v1Ox
-----END PGP SIGNATURE-----

--KrHCbChajFcK0yQE--
