From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 2/3] regulator: tps6586x: add and use correct voltage
 table
Date: Fri, 6 Dec 2013 15:40:06 +0000
Message-ID: <20131206154006.GE23519@lee--X1>
References: <cover.1386333697.git.stefan@agner.ch>
 <7c948660cda4684d28fa97f82295ab84f6ef658e.1386333697.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <7c948660cda4684d28fa97f82295ab84f6ef658e.1386333697.git.stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kai.poggensee-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, 06 Dec 2013, Stefan Agner wrote:

> Depending on the regulator version, the voltage table might be
> different. Use version specific regulator tables in order to select
> correct voltage table. For the following regulator versions different
> voltage tables are now used:
>=20
>   * TPS658623: Use correct voltage table for SM2
>   * TPS658643: New voltage table for SM2
>=20
> Both versions are in use on the Colibri T20 module. Make use of the
> correct tables by requesting the correct SM2 voltage of 1.8V.
>=20
> This change is not backward compatible since an old driver is not abl=
e
> to correctly set that value. The value 1.8V is out of range for the o=
ld
> driver and will refuse to probe the device. The regulator starts with
> default settings and the driver shows appropriate error messages.
>=20
> On Colibri T20, the old value used to work with TPS658623 since the
> driver applied a wrong voltage table too. However, the TPS658643 used
> on V1.2 devices uses yet another voltage table and those broke that
> pseudo-compatibility. The regulator driver now has the correct voltag=
e
> table for both regulator versions and those the correct voltage can b=
e
> used in the device tree.
>=20
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> ---
> Changes since v3:
>   - Check if version specific table is necessary
>=20
> Changes since v2:
>   - Removed reg_ from reg_version
>   - Moved walk through version dependent tables to find_regulator_inf=
o,
>     removed the inline definition. This reduces .o size and encapsula=
tes
>     the logic of finding the right regulator into one function. It co=
mes
>     with a slight code duplication, the table search now appears twic=
e.
> ---
>  arch/arm/boot/dts/tegra20-colibri-512.dtsi |  4 +-
>  drivers/regulator/tps6586x-regulator.c     | 93 ++++++++++++++++++++=
++++-----

Applied with Reviews and Acks.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
