From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V10 12/15] arm64: tegra: Enable PCIe slots in P2972-0000
 board
Date: Thu, 20 Jun 2019 13:01:41 +0200
Message-ID: <20190620110141.GB15892@ulmo>
References: <20190612095339.20118-1-vidyas@nvidia.com>
 <20190612095339.20118-13-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5565069025433726594=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190612095339.20118-13-vidyas@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lorenzo.pieralisi@arm.com, mperttunen@nvidia.com, mmaddireddy@nvidia.com, linux-pci@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, kthota@nvidia.com, kishon@ti.com, linux-tegra@vger.kernel.org, robh+dt@kernel.org, gustavo.pimentel@synopsys.com, jingoohan1@gmail.com, bhelgaas@google.com, digetx@gmail.com, jonathanh@nvidia.com, linux-arm-kernel@lists.infradead.org, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--===============5565069025433726594==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TRYliJ5NKNqkz5bu"
Content-Disposition: inline


--TRYliJ5NKNqkz5bu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2019 at 03:23:36PM +0530, Vidya Sagar wrote:
> Enable PCIe controller nodes to enable respective PCIe slots on
> P2972-0000 board. Following is the ownership of slots by different
> PCIe controllers.
> Controller-0 : M.2 Key-M slot
> Controller-1 : On-board Marvell eSATA controller
> Controller-3 : M.2 Key-E slot
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
> Changes since [v9]:
> * None
>=20
> Changes since [v8]:
> * None
>=20
> Changes since [v7]:
> * None
>=20
> Changes since [v6]:
> * None
>=20
> Changes since [v5]:
> * Arranged PCIe nodes in the order of their addresses
>=20
> Changes since [v4]:
> * None
>=20
> Changes since [v3]:
> * None
>=20
> Changes since [v2]:
> * Changed P2U label names to reflect new format that includes 'hsio'/'nvh=
s'
>   strings to reflect UPHY brick they belong to
>=20
> Changes since [v1]:
> * Dropped 'pcie-' from phy-names property strings
>=20
>  .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi |  2 +-
>  .../boot/dts/nvidia/tegra194-p2972-0000.dts   | 41 +++++++++++++++++++
>  2 files changed, 42 insertions(+), 1 deletion(-)

Applied to for-5.3/arm64/dt, thanks.

Thierry

> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/=
boot/dts/nvidia/tegra194-p2888.dtsi
> index 9f5810765efc..62e07e1197cc 100644
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
> index 6e6df650a4b0..eb79663b2af8 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
> @@ -167,4 +167,45 @@
>  			};
>  		};
>  	};
> +
> +	pcie@14100000 {
> +		status =3D "okay";
> +
> +		vddio-pex-ctl-supply =3D <&vdd_1v8ao>;
> +
> +		phys =3D <&p2u_hsio_0>;
> +		phy-names =3D "p2u-0";
> +	};
> +
> +	pcie@14140000 {
> +		status =3D "okay";
> +
> +		vddio-pex-ctl-supply =3D <&vdd_1v8ao>;
> +
> +		phys =3D <&p2u_hsio_7>;
> +		phy-names =3D "p2u-0";
> +	};
> +
> +	pcie@14180000 {
> +		status =3D "okay";
> +
> +		vddio-pex-ctl-supply =3D <&vdd_1v8ao>;
> +
> +		phys =3D <&p2u_hsio_2>, <&p2u_hsio_3>, <&p2u_hsio_4>,
> +		       <&p2u_hsio_5>;
> +		phy-names =3D "p2u-0", "p2u-1", "p2u-2", "p2u-3";
> +	};
> +
> +	pcie@141a0000 {
> +		status =3D "disabled";
> +
> +		vddio-pex-ctl-supply =3D <&vdd_1v8ao>;
> +
> +		phys =3D <&p2u_nvhs_0>, <&p2u_nvhs_1>, <&p2u_nvhs_2>,
> +		       <&p2u_nvhs_3>, <&p2u_nvhs_4>, <&p2u_nvhs_5>,
> +		       <&p2u_nvhs_6>, <&p2u_nvhs_7>;
> +
> +		phy-names =3D "p2u-0", "p2u-1", "p2u-2", "p2u-3", "p2u-4",
> +			    "p2u-5", "p2u-6", "p2u-7";
> +	};
>  };
> --=20
> 2.17.1
>=20

--TRYliJ5NKNqkz5bu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0LZ5UACgkQ3SOs138+
s6E0OxAAqHtlSQS8hK55p9RUs8cm+q25f/x4sLncet4I7dGg+1mwumU92ACOOAo5
phKrW0oi/ZaR2KpU9T9edmuaWP3dDjXIvUBjJ+vIQTBvA5FzB8xOO+LGcvgj6Sj8
W/9pozwzVswEtxv/EolG7HIqNV4rbb8yKzIagqXc8pQBElS8NPJkUEz+VSj6+1b+
9QqFl/bqp+iQzdLvCCMKcIUKISJM4JVnqLQ3dgeJuRajAqVm7UzQOtg7Yhm3hGML
QEU48F8vmeutUyu6wziMkOX+EBGBx9ogiTi5J+IwZHnsVN8kn9aMAKmZyoZW0aOa
WQI4sy/6WWnKqisRNc6H+gepjdw0MG+ToJKjDFNfMld+8CRrqm9YlwpTVgRx6MT7
MPY2CJ7mUQzj/+tUrq7WueQOLI+kmqpB2PNeWe2pPDFCyE0tZgW99S8C7YKMF3Zp
n77aTAOXTAWvbB78nakTik4DQmzuETZl2XEoqHDYVJ7WBzjXH2t1nFaU2+9Yx6kI
EIiWYuSyR3NFzBuK368HQlJ3hyAmR0dvKapobzGz4zZrW+rAFT6INeQet+Snolhm
IQ6shdCKCkD8p90VrV8UOowNJSo7df5mr6LdGv/zWhEU0YnqhI6cv0XtYs1yUh/1
ZNbJfLMebxvjqwmB4n7pCnpt1otenWTcKgEfw0fxDiD2hJK51vw=
=sH4H
-----END PGP SIGNATURE-----

--TRYliJ5NKNqkz5bu--


--===============5565069025433726594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5565069025433726594==--
