From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH V2 9/9] ARM: dts: tegra: add the PM configurations of PMC
Date: Tue, 12 Mar 2013 11:43:17 +0100
Message-ID: <97395805.p014F9TUYL@fb07-iapwap2.physik.uni-giessen.de>
References: <1363061043-9680-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363061043-9680-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Joseph,

Am Dienstag, 12. M=E4rz 2013, 12:04:03 schrieb Joseph Lo:
> Adding the PM configuration of PMC when the platform support suspend
> function.
>=20
> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> V2:
> * no change
> ---
>  arch/arm/boot/dts/tegra20-harmony.dts   | 6 ++++++
>  arch/arm/boot/dts/tegra20-paz00.dts     | 7 +++++++
>  arch/arm/boot/dts/tegra20-seaboard.dts  | 6 ++++++
>  arch/arm/boot/dts/tegra20-trimslice.dts | 9 +++++++++
>  arch/arm/boot/dts/tegra20-ventana.dts   | 6 ++++++
>  arch/arm/boot/dts/tegra20-whistler.dts  | 8 ++++++++
>  arch/arm/boot/dts/tegra30-beaver.dts    | 7 +++++++
>  arch/arm/boot/dts/tegra30-cardhu.dtsi   | 7 +++++++
>  8 files changed, 56 insertions(+)
>=20
> [...]
>
> diff --git a/arch/arm/boot/dts/tegra20-paz00.dts
> b/arch/arm/boot/dts/tegra20-paz00.dts index 41e82e3..cd8e798 100644
> --- a/arch/arm/boot/dts/tegra20-paz00.dts
> +++ b/arch/arm/boot/dts/tegra20-paz00.dts
> @@ -415,6 +415,13 @@
>=20
>  	pmc {
>  		nvidia,invert-interrupt;
> +		nvidia,suspend-mode =3D <2>;
> +		nvidia,cpu-pwr-good-time =3D <5000>;

should be 2000

> +		nvidia,cpu-pwr-off-time =3D <5000>;

should be 0

> +		nvidia,core-pwr-good-time =3D <3845 3845>;

mmh, no idea here. original source [1] shows 0x7e7e ticks which transla=
tes to=20
1 sec?

> +		nvidia,core-pwr-off-time =3D <3875>;

should be 0

> +		nvidia,sys-clock-req-active-high;
> +		nvidia,combined-power-req;

paz00 has no combined power req.

>  	};
>=20
>  	usb@c5000000 {

[1]: http://gitorious.org/ac100/kernel/blobs/2.6.32/arch/arm/mach-tegra=
/odm_kit/query/paz00/nvodm_query.c#line649

Marc
