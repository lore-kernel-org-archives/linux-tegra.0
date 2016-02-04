From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V5 01/11] thermal: tegra: move tegra thermal files into
 tegra directory
Date: Thu, 4 Feb 2016 17:41:16 +0800
Message-ID: <56B31CBC.1090003@nvidia.com>
References: <1454057154-16149-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454057154-16149-1-git-send-email-wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi, Thieery
Do you have any comments on this series?

Thanks.
Wei.

On 2016=E5=B9=B401=E6=9C=8829=E6=97=A5 16:45, Wei Ni wrote:
> Move Tegra soctherm driver to tegra directory, it's easy to maintain
> and add more new function support for Tegra platforms.
> This will also help to split soctherm driver into common parts and
> chip specific data related parts.
>=20
> Signed-off-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/thermal/Kconfig                                     | 12 ++-=
---------
>  drivers/thermal/Makefile                                    |  2 +-
>  drivers/thermal/tegra/Kconfig                               | 13 +++=
++++++++++
>  drivers/thermal/tegra/Makefile                              |  1 +
>  .../thermal/{tegra_soctherm.c =3D> tegra/tegra-soctherm.c}    |  0
>  5 files changed, 17 insertions(+), 11 deletions(-)
>  create mode 100644 drivers/thermal/tegra/Kconfig
>  create mode 100644 drivers/thermal/tegra/Makefile
>  rename drivers/thermal/{tegra_soctherm.c =3D> tegra/tegra-soctherm.c=
} (100%)
>=20
> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
> index c463c89b90ef..e0577b15cbff 100644
> --- a/drivers/thermal/Kconfig
> +++ b/drivers/thermal/Kconfig
> @@ -254,16 +254,6 @@ config ARMADA_THERMAL
>  	  Enable this option if you want to have support for thermal manage=
ment
>  	  controller present in Armada 370 and Armada XP SoC.
> =20
> -config TEGRA_SOCTHERM
> -	tristate "Tegra SOCTHERM thermal management"
> -	depends on ARCH_TEGRA
> -	help
> -	  Enable this option for integrated thermal management support on N=
VIDIA
> -	  Tegra124 systems-on-chip. The driver supports four thermal zones
> -	  (CPU, GPU, MEM, PLLX). Cooling devices can be bound to the therma=
l
> -	  zones to manage temperatures. This option is also required for th=
e
> -	  emergency thermal reset (thermtrip) feature to function.
> -
>  config DB8500_CPUFREQ_COOLING
>  	tristate "DB8500 cpufreq cooling"
>  	depends on ARCH_U8500
> @@ -380,6 +370,8 @@ depends on ARCH_STI && OF
>  source "drivers/thermal/st/Kconfig"
>  endmenu
> =20
> +source "drivers/thermal/tegra/Kconfig"
> +
>  config QCOM_SPMI_TEMP_ALARM
>  	tristate "Qualcomm SPMI PMIC Temperature Alarm"
>  	depends on OF && (SPMI || COMPILE_TEST) && IIO
> diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile
> index cfae6a654793..119e25cdcc66 100644
> --- a/drivers/thermal/Makefile
> +++ b/drivers/thermal/Makefile
> @@ -46,5 +46,5 @@ obj-$(CONFIG_TI_SOC_THERMAL)	+=3D ti-soc-thermal/
>  obj-$(CONFIG_INT340X_THERMAL)  +=3D int340x_thermal/
>  obj-$(CONFIG_INTEL_PCH_THERMAL)	+=3D intel_pch_thermal.o
>  obj-$(CONFIG_ST_THERMAL)	+=3D st/
> -obj-$(CONFIG_TEGRA_SOCTHERM)	+=3D tegra_soctherm.o
> +obj-$(CONFIG_TEGRA_SOCTHERM)	+=3D tegra/
>  obj-$(CONFIG_HISI_THERMAL)     +=3D hisi_thermal.o
> diff --git a/drivers/thermal/tegra/Kconfig b/drivers/thermal/tegra/Kc=
onfig
> new file mode 100644
> index 000000000000..0b719d8b629b
> --- /dev/null
> +++ b/drivers/thermal/tegra/Kconfig
> @@ -0,0 +1,13 @@
> +menu "NVIDIA Tegra thermal drivers"
> +
> +config TEGRA_SOCTHERM
> +	tristate "Tegra SOCTHERM thermal management"
> +	depends on ARCH_TEGRA
> +	help
> +	  Enable this option for integrated thermal management support on N=
VIDIA
> +	  Tegra124 systems-on-chip. The driver supports four thermal zones
> +	  (CPU, GPU, MEM, PLLX). Cooling devices can be bound to the therma=
l
> +	  zones to manage temperatures. This option is also required for th=
e
> +	  emergency thermal reset (thermtrip) feature to function.
> +
> +endmenu
> diff --git a/drivers/thermal/tegra/Makefile b/drivers/thermal/tegra/M=
akefile
> new file mode 100644
> index 000000000000..d4dc4e7f279e
> --- /dev/null
> +++ b/drivers/thermal/tegra/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_TEGRA_SOCTHERM)	+=3D tegra-soctherm.o
> diff --git a/drivers/thermal/tegra_soctherm.c b/drivers/thermal/tegra=
/tegra-soctherm.c
> similarity index 100%
> rename from drivers/thermal/tegra_soctherm.c
> rename to drivers/thermal/tegra/tegra-soctherm.c
>=20
