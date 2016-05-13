From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: beaver: allow SD card voltage to be changed
Date: Fri, 13 May 2016 09:25:31 +0200
Message-ID: <1463124331.2459.0.camel@lynxeye.de>
References: <1456779678-20173-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456779678-20173-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Montag, den 29.02.2016, 22:01 +0100 schrieb Lucas Stach:
> This allows to switch the card signal voltage level to 1.8V,
> which is needed for any ultra high speed modes to work.
>=20
> Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
> ---
> This needs the SDMMC memcomp pad calibration patches I just
> sent out to be applied, otherwise the card voltage change will
> fail with a message in the kernel log and a fall back to
> high speed operation.

The patches this one depends on have been applied for some time now.
Please pick up this patch.

Thanks,
Lucas
> ---
> =C2=A0arch/arm/boot/dts/tegra30-beaver.dts | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/tegra30-beaver.dts
> b/arch/arm/boot/dts/tegra30-beaver.dts
> index 1daed40..6b237f2 100644
> --- a/arch/arm/boot/dts/tegra30-beaver.dts
> +++ b/arch/arm/boot/dts/tegra30-beaver.dts
> @@ -1848,7 +1848,7 @@
> =C2=A0
> =C2=A0				ldo5_reg: ldo5 {
> =C2=A0					regulator-name =3D
> "vddio_sdmmc,avdd_vdac";
> -					regulator-min-microvolt =3D
> <3300000>;
> +					regulator-min-microvolt =3D
> <1800000>;
> =C2=A0					regulator-max-microvolt =3D
> <3300000>;
> =C2=A0					regulator-always-on;
> =C2=A0				};
> @@ -1919,6 +1919,7 @@
> =C2=A0
> =C2=A0	sdhci@78000000 {
> =C2=A0		status =3D "okay";
> +		vqmmc-supply =3D <&ldo5_reg>;
> =C2=A0		cd-gpios =3D <&gpio TEGRA_GPIO(I, 5) GPIO_ACTIVE_LOW>;
> =C2=A0		wp-gpios =3D <&gpio TEGRA_GPIO(T, 3)
> GPIO_ACTIVE_HIGH>;
> =C2=A0		power-gpios =3D <&gpio TEGRA_GPIO(D, 7)
> GPIO_ACTIVE_HIGH>;
