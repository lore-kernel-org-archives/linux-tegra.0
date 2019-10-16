From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] arm64: tegra: Assume no CLKREQ presence by default
Date: Wed, 16 Oct 2019 18:19:52 +0200
Message-ID: <20191016161952.GB2526111@ulmo>
References: <20191005164212.3646-1-vidyas@nvidia.com>
 <20191005164212.3646-2-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="KFztAG8eRSV9hGtP"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191005164212.3646-2-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, jonathanh@nvidia.com, andrew.murray@arm.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--KFztAG8eRSV9hGtP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 05, 2019 at 10:12:12PM +0530, Vidya Sagar wrote:
> Although Tegra194 has support for CLKREQ sideband signal and P2972
> has routing of the same till the slot, it is the case most of the time
> that the connected device doesn't have CLKREQ support. Hence, it makes
> sense to assume that there is no CLKREQ support by default and it can
> be enabled on need basis when a card with CLKREQ support is connected.
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 6 ------
>  1 file changed, 6 deletions(-)

Applied to for-5.5/arm64/dt, thanks.

Thierry

> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra194.dtsi
> index a312c051448b..11220d97adb8 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -1186,7 +1186,6 @@
> =20
>  		nvidia,bpmp =3D <&bpmp 1>;
> =20
> -		supports-clkreq;
>  		nvidia,aspm-cmrt-us =3D <60>;
>  		nvidia,aspm-pwr-on-t-us =3D <20>;
>  		nvidia,aspm-l0s-entrance-latency-us =3D <3>;
> @@ -1232,7 +1231,6 @@
> =20
>  		nvidia,bpmp =3D <&bpmp 2>;
> =20
> -		supports-clkreq;
>  		nvidia,aspm-cmrt-us =3D <60>;
>  		nvidia,aspm-pwr-on-t-us =3D <20>;
>  		nvidia,aspm-l0s-entrance-latency-us =3D <3>;
> @@ -1278,7 +1276,6 @@
> =20
>  		nvidia,bpmp =3D <&bpmp 3>;
> =20
> -		supports-clkreq;
>  		nvidia,aspm-cmrt-us =3D <60>;
>  		nvidia,aspm-pwr-on-t-us =3D <20>;
>  		nvidia,aspm-l0s-entrance-latency-us =3D <3>;
> @@ -1324,7 +1321,6 @@
> =20
>  		nvidia,bpmp =3D <&bpmp 4>;
> =20
> -		supports-clkreq;
>  		nvidia,aspm-cmrt-us =3D <60>;
>  		nvidia,aspm-pwr-on-t-us =3D <20>;
>  		nvidia,aspm-l0s-entrance-latency-us =3D <3>;
> @@ -1370,7 +1366,6 @@
> =20
>  		nvidia,bpmp =3D <&bpmp 0>;
> =20
> -		supports-clkreq;
>  		nvidia,aspm-cmrt-us =3D <60>;
>  		nvidia,aspm-pwr-on-t-us =3D <20>;
>  		nvidia,aspm-l0s-entrance-latency-us =3D <3>;
> @@ -1420,7 +1415,6 @@
>  		interrupt-map-mask =3D <0 0 0 0>;
>  		interrupt-map =3D <0 0 0 0 &gic GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
> =20
> -		supports-clkreq;
>  		nvidia,aspm-cmrt-us =3D <60>;
>  		nvidia,aspm-pwr-on-t-us =3D <20>;
>  		nvidia,aspm-l0s-entrance-latency-us =3D <3>;
> --=20
> 2.17.1
>=20

--KFztAG8eRSV9hGtP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2nQygACgkQ3SOs138+
s6GU5Q/+LV/SE++KyetHQKYMnNis8n7U2swfFXdv1B7ZJkbmd+LW7O2E1lRq8z+1
JJ+KsZwWs3tOXEezWuNL0Q8s5x6y+OrdPJ0GComdlBZ5bXOcQTf4+XbE6tYRwsmp
EV8/uSFQr0AHVCJBffDk+IAbPH0tjCWKo7NQkIXTX6Bf4LR5gfYdTkYuiYGFkmPz
yissUISHDcM0XGn135Hft6t/fpGiNOGwfBSWr/XsPDsT3WMs7/5UnK0aimMNTQdU
Uvz0CCC1dJmNudilYczX3fZ1gJ3kDm/o/ioq3/SZER+xgOkEZG58YBTJP+WJln1R
cKQXbCKCex/AQWq1L9FQAt+Rky1+iyuHE6nGLZO8c3k+dYKIQ7rAe4Vz88VyCu34
n6VRr/tYNK6p3aSgWIrOYPI6XmQoT7+KzniccBXkUUTEOV+XnPfP65DEbmJ1cCDl
d/X398HrO9O+YOp1A9v7nLf6ksM/yN/nQd2b7zW/CjrMMzRxtfC+7ThI0syMHCsO
vHXbgMWi1niBEoVp7Bse6hs2X2VGrbmmdmRD1phA6h+I5uVtW8LL14HuX0WKF5ar
VWio3vWpdP2Vy8Z44I+wE8y6ILxBVV0a9aW4KVBM4CvAg3ZvFadDSMkP1oHLoIqj
uSYxjyoKeuUWOpxaTkzEQuE/MB+DTZegGjlj1omMSWw9Y4u9n84=
=dgRG
-----END PGP SIGNATURE-----

--KFztAG8eRSV9hGtP--
