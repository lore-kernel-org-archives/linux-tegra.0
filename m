From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 5/7] arm64: tegra: Add Memory controller DT node on T194
Date: Fri, 30 Aug 2019 13:18:10 +0200
Message-ID: <20190830111810.GE23902@ulmo>
References: <1567118827-26358-1-git-send-email-vdumpa@nvidia.com>
 <1567118827-26358-6-git-send-email-vdumpa@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/2994txjAzEdQwm5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1567118827-26358-6-git-send-email-vdumpa@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krishna Reddy <vdumpa@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, treding@nvidia.com, yhsu@nvidia.com, snikam@nvidia.com, praithatha@nvidia.com, talho@nvidia.com, avanbrunt@nvidia.com, thomasz@nvidia.com, olof@lixom.net, jtukkinen@nvidia.com, mperttunen@nvidia.com
List-Id: linux-tegra@vger.kernel.org


--/2994txjAzEdQwm5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2019 at 03:47:05PM -0700, Krishna Reddy wrote:
> Add Memory controller DT node on T194 and enable it.
> This patch is a prerequisite for SMMU enable on T194.
>=20
> Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 4 ++++
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi       | 7 +++++++
>  2 files changed, 11 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/=
boot/dts/nvidia/tegra194-p2888.dtsi
> index 62e07e11..4b3441b 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
> @@ -47,6 +47,10 @@
>  			};
>  		};
> =20
> +		memory-controller@2c00000 {
> +			status =3D "okay";
> +		};
> +
>  		serial@3110000 {
>  			status =3D "okay";
>  		};
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra194.dtsi
> index adebbbf..d906958 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -6,6 +6,7 @@
>  #include <dt-bindings/reset/tegra194-reset.h>
>  #include <dt-bindings/power/tegra194-powergate.h>
>  #include <dt-bindings/thermal/tegra194-bpmp-thermal.h>
> +#include <dt-bindings/memory/tegra186-mc.h>
> =20
>  / {
>  	compatible =3D "nvidia,tegra194";
> @@ -130,6 +131,12 @@
>  			};
>  		};
> =20
> +		memory-controller@2c00000 {
> +			compatible =3D "nvidia,tegra186-mc";

I think we need to make this "nvidia,tegra194-mc" and then enhance the
Tegra186 driver to match on that compatible string.

Nothing to worry about just yet and I can make that change when
applying.

Thierry

> +			reg =3D <0x02c00000 0xb0000>;
> +			status =3D "disabled";
> +		};
> +
>  		uarta: serial@3100000 {
>  			compatible =3D "nvidia,tegra194-uart", "nvidia,tegra20-uart";
>  			reg =3D <0x03100000 0x40>;
> --=20
> 2.1.4
>=20

--/2994txjAzEdQwm5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1pBfIACgkQ3SOs138+
s6F3pw/3cgWOBb8LS08yjsbxQJkSYr3KYazBB/0FtFlaIBLaASqL+2XxQRNgHKsx
pdXxkOABv6ltpV7L06zNs3HJZG6jkDpBy0Glpo0J6B8QEFqlNnZNVkLp2AzXZO/K
pkXadSzvUq9pBh8nJJ8V1FvVnj4pj+dgzVE7JO7+1onjG195Hd2dyTmYysvtgvGr
m92kq+YsBZDPoqVq3XhWcrKGpnQq+mXqseg4InEfcCb35Kn0mhgguiYDh9QcfbfF
+TOnm/A5ddPV+qXy4WMGHBZyqADRVrtMJh4o7/NyAfYEwL6f+DSGKLcP6nBJRZ1S
DPsSDwQE1v2RHjYVhflHnfx4VEGL81+Twvn5RcNghOZqi6vzWbcYMSE+edwQHNwC
rcFUtMMNuW1M1NdcgvgzHLdCyCa5EREVr28SPuAFIDtdYyYgc2PVaYNdx/zu3oN9
y9uPmwcsvydOZzQHylsAgBt21EvmvijdOVayTIMe+M8ZZzKDIWmsb2NlCjAUG/Uw
z7pUuHLwtZywFYAWP9r/8xp+M7PQNyMPyTqR3iF7p1+IzAQ0gLb6k4HKzejkIVV9
jZ3Jpe7la3Q6i9o0vBX/NQw4WoxS4V7oBLuSXlOrEXNdx2naO+JjUYifqj6DZNP5
T/yXjA3RJM/77CvrxXafkTG1EO68lceZeZPQgUpV9NOocRY9IQ==
=7ECF
-----END PGP SIGNATURE-----

--/2994txjAzEdQwm5--
