From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v6 1/2] arm64: tegra: add ACONNECT, ADMA and AGIC nodes
Date: Thu, 20 Jun 2019 11:39:29 +0200
Message-ID: <20190620093929.GI26689@ulmo>
References: <1560945082-24554-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mhOzvPhkurUs4vA9"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1560945082-24554-1-git-send-email-spujar@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>
Cc: jonathanh@nvidia.com, robh+dt@kernel.org, mark.rutland@arm.com, mkumard@nvidia.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--mhOzvPhkurUs4vA9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2019 at 05:21:21PM +0530, Sameer Pujar wrote:
> Add DT nodes for following devices on Tegra186 and Tegra194
>  * ACONNECT
>  * ADMA
>  * AGIC
>=20
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  changes in current revision
>    * updated ranges property for aconnect
>    * renamed agic node
>=20
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 67 ++++++++++++++++++++++++++=
++++++
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 67 ++++++++++++++++++++++++++=
++++++
>  2 files changed, 134 insertions(+)

Applied to for-5.3/arm64/dt, thanks.

I ended up deciding to put the aconnect node among the nodes with unit-
addresses, in the numerical order that it would fit in if the top-level
aconnect node didn't exist. I think that looks much more consistent in
the end, even though it's slightly bending the rules that we have.

> diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra186.dtsi
> index 426ac0b..4bb765d 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> @@ -1295,4 +1295,71 @@
>  				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
>  		interrupt-parent =3D <&gic>;
>  	};
> +
> +	aconnect {
> +		compatible =3D "nvidia,tegra210-aconnect";

I've also added a "nvidia,tegra186-aconnect" to this list following the
rules that we always need to have a most specific compatible string in
addition to any older compatible strings. This is useful in case where
the new version, even if basically compatible, might require workaround
code or similar.

Thanks,
Thierry

> +		clocks =3D <&bpmp TEGRA186_CLK_APE>,
> +			 <&bpmp TEGRA186_CLK_APB2APE>;
> +		clock-names =3D "ape", "apb2ape";
> +		power-domains =3D <&bpmp TEGRA186_POWER_DOMAIN_AUD>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges =3D <0x02900000 0x0 0x02900000 0x200000>;
> +		status =3D "disabled";
> +
> +		dma-controller@2930000 {
> +			compatible =3D "nvidia,tegra186-adma";
> +			reg =3D <0x02930000 0x20000>;
> +			interrupt-parent =3D <&agic>;
> +			interrupts =3D  <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> +			#dma-cells =3D <1>;
> +			clocks =3D <&bpmp TEGRA186_CLK_AHUB>;
> +			clock-names =3D "d_audio";
> +			status =3D "disabled";
> +		};
> +
> +		agic: interrupt-controller@2a40000 {
> +			compatible =3D "nvidia,tegra210-agic";
> +			#interrupt-cells =3D <3>;
> +			interrupt-controller;
> +			reg =3D <0x02a41000 0x1000>,
> +			      <0x02a42000 0x2000>;
> +			interrupts =3D <GIC_SPI 145
> +				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
> +			clocks =3D <&bpmp TEGRA186_CLK_APE>;
> +			clock-names =3D "clk";
> +			status =3D "disabled";
> +		};
> +	};
>  };
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra194.dtsi
> index c77ca21..d6aee0d 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -1054,4 +1054,71 @@
>  				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
>  		interrupt-parent =3D <&gic>;
>  	};
> +
> +	aconnect {
> +		compatible =3D "nvidia,tegra210-aconnect";
> +		clocks =3D <&bpmp TEGRA194_CLK_APE>,
> +			 <&bpmp TEGRA194_CLK_APB2APE>;
> +		clock-names =3D "ape", "apb2ape";
> +		power-domains =3D <&bpmp TEGRA194_POWER_DOMAIN_AUD>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges =3D <0x02900000 0x0 0x02900000 0x200000>;
> +		status =3D "disabled";
> +
> +		dma-controller@2930000 {
> +			compatible =3D "nvidia,tegra186-adma";
> +			reg =3D <0x02930000 0x20000>;
> +			interrupt-parent =3D <&agic>;
> +			interrupts =3D  <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> +			#dma-cells =3D <1>;
> +			clocks =3D <&bpmp TEGRA194_CLK_AHUB>;
> +			clock-names =3D "d_audio";
> +			status =3D "disabled";
> +		};
> +
> +		agic: interrupt-controller@2a40000 {
> +			compatible =3D "nvidia,tegra210-agic";
> +			#interrupt-cells =3D <3>;
> +			interrupt-controller;
> +			reg =3D <0x02a41000 0x1000>,
> +			      <0x02a42000 0x2000>;
> +			interrupts =3D <GIC_SPI 145
> +				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
> +			clocks =3D <&bpmp TEGRA194_CLK_APE>;
> +			clock-names =3D "clk";
> +			status =3D "disabled";
> +		};
> +	};
>  };
> --=20
> 2.7.4
>=20

--mhOzvPhkurUs4vA9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0LVE4ACgkQ3SOs138+
s6FS3A//Vm2CGNN2agZRifXL72aaS/PKkWK/n606KpUVeWCdWoOsPQzUBtsyqtj+
hqu/+cenwpdg4qYtmbE/H+O0+6Em9QvYMdcsxZHqxC7s2vyrFRyEITigZx9EKsJZ
uAtzqkOlygS8UvHISSD9ojkD/qY0/72VwpBehV5LFNco2s3hBkXDzTBr5D553xhR
f+Gilk4yiplD52GSpbJeMN0ewygHmEznSdW/WNt+GT8lEAQ8uCyf0K3Oh1zXKSmG
eqJ0fD92J46fTOykPEAXBysKxiH/AmEQdD7Juhq5rlNuR+tIwvvsfuwGA9e1LeP8
aVX1EKF61E7xNEnp5vJXSwuLQqm3t1Uak4B1JyHvyZufxg0Z2GGJRTvP6RBbK5Of
sn/UVReRXxZU3XWe8eSIb31yjQwOwf9jFTyqi1kqK+XegEWgln3CXvK66xs6EYCc
DxUQqZqxcW8Zm60YPrxmPjqy1z2IXRjAUSSpgW7feDfqO/8LfDGWe/QTJOkY5Ku5
qDTfI0EgIBaPDvpqXrvRc8ik5BynBiUq1NVZI3oDc0gF880mHGLSbdObJ9KRqnrU
anxdFaOJMzoAcwn/iTW4Hzk7V/hQyWCIy7iWiYPCYcfuapRYE9TOGiNgQvZW8FYa
Xo6qAFeS5K4pE55pmF2xAU1kZaDZHcWmSAkh3x5us13ytccdIvU=
=4g/d
-----END PGP SIGNATURE-----

--mhOzvPhkurUs4vA9--
