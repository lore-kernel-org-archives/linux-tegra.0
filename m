From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: tegra: enable big-endian support
Date: Fri, 09 Jan 2015 18:46:46 +0300
Message-ID: <54AFF7E6.9030308@gmail.com>
References: <1420817231-8346-1-git-send-email-bob.mottram@codethink.co.uk> <1420817231-8346-4-git-send-email-bob.mottram@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420817231-8346-4-git-send-email-bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ct173-kernel-internal-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

09.01.2015 18:27, Bob Mottram =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Config changes to enable big-endian support. Tested on Jetson TK1.
>=20
> Signed-off-by: Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
> ---
>  arch/arm/mach-tegra/Kconfig   | 1 +
>  arch/arm/mach-tegra/headsmp.S | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfi=
g
> index d0be9a1..d8cb963 100644
> --- a/arch/arm/mach-tegra/Kconfig
> +++ b/arch/arm/mach-tegra/Kconfig
> @@ -2,6 +2,7 @@ menuconfig ARCH_TEGRA
>  	bool "NVIDIA Tegra" if ARCH_MULTI_V7
>  	select ARCH_REQUIRE_GPIOLIB
>  	select ARCH_SUPPORTS_TRUSTED_FOUNDATIONS
> +	select ARCH_SUPPORTS_BIG_ENDIAN
>  	select ARM_AMBA
>  	select ARM_GIC
>  	select CLKSRC_MMIO
> diff --git a/arch/arm/mach-tegra/headsmp.S b/arch/arm/mach-tegra/head=
smp.S
> index 2072e73..9896981 100644
> --- a/arch/arm/mach-tegra/headsmp.S
> +++ b/arch/arm/mach-tegra/headsmp.S
> @@ -1,11 +1,12 @@
>  #include <linux/linkage.h>
>  #include <linux/init.h>
> -
> +#include <asm/assembler.h>
>  #include "sleep.h"
>=20
>          .section ".text.head", "ax"
>=20
>  ENTRY(tegra_secondary_startup)
> +        ARM_BE8(setend    be)
>          check_cpu_part_num 0xc09, r8, r9
>          bleq    v7_invalidate_l1
>          b       secondary_startup
> --
> 2.1.0
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra=
" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

Hi, Bob.

What about suspend/cpuidle? Won't it make sense to set BE mode in reset=
 handler?

--=20
Dmitry
