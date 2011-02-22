From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 3/6] ARM: tegra: remove stale nvidia atag handler
Date: Tue, 22 Feb 2011 11:39:46 -0800
Message-ID: <AANLkTim4aQkxab5rZwbrWWr-NiK9rf0YjhQGB2_zfGBP@mail.gmail.com>
References: <1298354117-19097-1-git-send-email-olof@lixom.net>
	<1298354117-19097-4-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298354117-19097-4-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 21, 2011 at 9:55 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> Remove dead atag handling code for nvidia-specific tags.
>
> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> ---
> =A0arch/arm/mach-tegra/board-harmony.c | =A0 25 ---------------------=
----
> =A01 files changed, 0 insertions(+), 25 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/board-harmony.c b/arch/arm/mach-tegr=
a/board-harmony.c
> index b9dbdb1..f6ad58b 100644
> --- a/arch/arm/mach-tegra/board-harmony.c
> +++ b/arch/arm/mach-tegra/board-harmony.c
> @@ -35,31 +35,6 @@
> =A0#include "board-harmony.h"
> =A0#include "clock.h"
>
> -/* NVidia bootloader tags */
> -#define ATAG_NVIDIA =A0 =A0 =A0 =A0 =A0 =A00x41000801
> -
> -#define ATAG_NVIDIA_RM =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x1
> -#define ATAG_NVIDIA_DISPLAY =A0 =A0 =A0 =A0 =A0 =A00x2
> -#define ATAG_NVIDIA_FRAMEBUFFER =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00x3
> -#define ATAG_NVIDIA_CHIPSHMOO =A0 =A0 =A0 =A0 =A00x4
> -#define ATAG_NVIDIA_CHIPSHMOOPHYS =A0 =A0 =A00x5
> -#define ATAG_NVIDIA_PRESERVED_MEM_0 =A0 =A00x10000
> -#define ATAG_NVIDIA_PRESERVED_MEM_N =A0 =A02
> -#define ATAG_NVIDIA_FORCE_32 =A0 =A0 =A0 =A0 =A0 0x7fffffff
> -
> -struct tag_tegra {
> - =A0 =A0 =A0 __u32 bootarg_key;
> - =A0 =A0 =A0 __u32 bootarg_len;
> - =A0 =A0 =A0 char bootarg[1];
> -};
> -
> -static int __init parse_tag_nvidia(const struct tag *tag)
> -{
> -
> - =A0 =A0 =A0 return 0;
> -}
> -__tagtable(ATAG_NVIDIA, parse_tag_nvidia);
> -
> =A0static struct plat_serial8250_port debug_uart_platform_data[] =3D =
{
> =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.membase =A0 =A0 =A0 =A0=3D IO_ADDRESS=
(TEGRA_UARTD_BASE),
> --
> 1.7.0.4
>
>

Acked-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>

Our version of the kernel will never use these atags, so it's better
to warn that they are being ignored and get the bootloaders updated.
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
