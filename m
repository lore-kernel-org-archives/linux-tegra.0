From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 13/16] arm64: tegra: Enable PCIe slots in P2972-0000
 board
Date: Mon, 15 Apr 2019 17:12:35 +0200
Message-ID: <20190415151235.GH29254@ulmo>
References: <1554407683-31580-1-git-send-email-vidyas@nvidia.com>
 <1554407683-31580-14-git-send-email-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zVyz+SkbhTrRQGHt"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1554407683-31580-14-git-send-email-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, lorenzo.pieralisi@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--zVyz+SkbhTrRQGHt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 05, 2019 at 01:24:40AM +0530, Vidya Sagar wrote:
> Enable PCIe controller nodes to enable respective PCIe slots on
> P2972-0000 board. Following is the ownership of slots by different
> PCIe controllers.
> Controller-0 : M.2 Key-M slot
> Controller-1 : On-board Marvell eSATA controller
> Controller-3 : M.2 Key-E slot
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
> Changes since [v1]:
> * Dropped 'pcie-' from phy-names property strings
>=20
>  arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |  2 +-
>  arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 50 ++++++++++++++++=
++++++
>  2 files changed, 51 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/=
boot/dts/nvidia/tegra194-p2888.dtsi
> index 246c1ebbd055..13263529125b 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
> @@ -191,7 +191,7 @@
>  						regulator-boot-on;
>  					};
> =20
> -					sd3 {
> +					vdd_1v8ao: sd3 {
>  						regulator-name =3D "VDD_1V8AO";
>  						regulator-min-microvolt =3D <1800000>;
>  						regulator-max-microvolt =3D <1800000>;
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/ar=
m64/boot/dts/nvidia/tegra194-p2972-0000.dts
> index b62e96945846..82eb30bceaa6 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
> @@ -169,4 +169,54 @@
>  			};
>  		};
>  	};
> +
> +	pcie@14180000 {
> +		status =3D "okay";
> +
> +		vddio-pex-ctl-supply =3D <&vdd_1v8ao>;
> +
> +		phys =3D <&p2u_2>,
> +		       <&p2u_3>,
> +		       <&p2u_4>,
> +		       <&p2u_5>;

You can use multiple entries on a single line, especially if they are
this short.

> +		phy-names =3D "p2u-0", "p2u-1", "p2u-2",
> +			    "p2u-3";

Same here.

> +	};
> +
> +	pcie@14100000 {
> +		status =3D "okay";
> +
> +		vddio-pex-ctl-supply =3D <&vdd_1v8ao>;
> +
> +		phys =3D <&p2u_0>;
> +		phy-names =3D "p2u-0";
> +	};
> +
> +	pcie@14140000 {
> +		status =3D "okay";
> +
> +		vddio-pex-ctl-supply =3D <&vdd_1v8ao>;
> +
> +		phys =3D <&p2u_7>;
> +		phy-names =3D "p2u-0";
> +	};
> +
> +	pcie@141a0000 {
> +		status =3D "disabled";
> +
> +		vddio-pex-ctl-supply =3D <&vdd_1v8ao>;
> +
> +		phys =3D <&p2u_12>,
> +		       <&p2u_13>,
> +		       <&p2u_14>,
> +		       <&p2u_15>,
> +		       <&p2u_16>,
> +		       <&p2u_17>,
> +		       <&p2u_18>,
> +		       <&p2u_19>;
> +
> +		phy-names =3D "p2u-0", "p2u-1", "p2u-2",
> +			    "p2u-3", "p2u-4", "p2u-5",
> +			    "p2u-6", "p2u-7";

And here.

Thierry

> +	};
>  };
> --=20
> 2.7.4
>=20

--zVyz+SkbhTrRQGHt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly0n2MACgkQ3SOs138+
s6EKUg/8CuQgd9IJSKcSqBqVy1qkktbrZ2TyIU+Nz6bWffZLOjmQVPJ/k1r6oyEW
RTMkDFsBdstbWGnHahJN69f0EphUtoQrWVwUW8T2qaddvOF7QWiuQ7FRgwUOeRJL
Or7wH64G/6JXpUX5hpVk9tSRTIv0Kngy7lV86+SD4RcmaEtKEJ+BT1Ks86Ak0v5Q
5wUFKIsUo8Rem8PBxCWlsRvGRN6+DkvLrkvdkekOo3D1QmoLbST0iFzfdV+BSeCn
D6DB1RJKzYwC8Lbf2T4816Gn+CuzcqwL8Hi5NYoNswn9SKvyVBri+JpZs4ZFqzrI
Dk6APQhJllMBfDghXaFGIovjqJZAdML3vKrOXmbAoW4H9Uvsj2vF7gwT2PGKzPwo
XZjUaa9QZn4KQZpOAtCiRFfD4b2aeJdokEwCVdRzTLoYOsXr8dIrZ3Wf3t0J6YVp
uVfpY8z8h2Cke0fsO7qQu1FqVWYBvw0sDuB/s8YCR6gf7g5WDiioYJJVRtcF5P55
NxL/LuieA5u7nfsdk2SEXKmiDo8uRGVLiTDEPppvrNlQnEPKxUFA1ZViXFRIYyaF
uQNFoJ1S9jWOd28PaiW5ruTig3oXNoU8CRHt6d0cdbjvzWk+MXiBfaXQQ/b19L6N
qZj5tCrjVJ1ZQFSXWsbjXVaFBZprQw00r30B7J3lKGv2GSfBImM=
=euk7
-----END PGP SIGNATURE-----

--zVyz+SkbhTrRQGHt--
