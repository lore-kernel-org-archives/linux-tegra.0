From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: l2x0: fix compile error on !CONFIG_USE_OF
Date: Wed, 09 Nov 2011 14:14:42 -0600
Message-ID: <4EBADF32.6040106@gmail.com>
References: <1320864823-5015-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1320864823-5015-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/09/2011 12:53 PM, Olof Johansson wrote:
> fae2b89ab1 (ARM: l2x0: add empty l2x0_of_init) adds a static inline
> function that returns -ENODEV, but at least on tegra cache-l2x0.h is
> included without errno.h being pulled in first, resulting in compile
> errors if OF isn't enabled:
> 
> In file included from arch/arm/mach-tegra/common.c:26:
> arch/arm/include/asm/hardware/cache-l2x0.h: In function 'l2x0_of_init':
> arch/arm/include/asm/hardware/cache-l2x0.h:110: error: 'ENODEV' undeclared (first use in this function)
> arch/arm/include/asm/hardware/cache-l2x0.h:110: error: (Each undeclared identifier is reported only once
> arch/arm/include/asm/hardware/cache-l2x0.h:110: error: for each function it appears in.)
> 
> Add errno.h to the include file to make it self-contained.
> 
> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

Sigh... I guess the platforms I built happened to include errno.h first.

Acked-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

> ---
>  arch/arm/include/asm/hardware/cache-l2x0.h |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/include/asm/hardware/cache-l2x0.h b/arch/arm/include/asm/hardware/cache-l2x0.h
> index 1db1143..7df239b 100644
> --- a/arch/arm/include/asm/hardware/cache-l2x0.h
> +++ b/arch/arm/include/asm/hardware/cache-l2x0.h
> @@ -20,6 +20,8 @@
>  #ifndef __ASM_ARM_HARDWARE_L2X0_H
>  #define __ASM_ARM_HARDWARE_L2X0_H
>  
> +#include <linux/errno.h>
> +
>  #define L2X0_CACHE_ID			0x000
>  #define L2X0_CACHE_TYPE			0x004
>  #define L2X0_CTRL			0x100
