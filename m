From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3 3/5] ARM: tegra: decouple uncompress.h and
 debug-macro.S
Date: Mon, 22 Oct 2012 11:18:30 +0300
Message-ID: <20121022081830.GH3196@tbergstrom-lnx.Nvidia.com>
References: <1350686507-3022-1-git-send-email-swarren@wwwdotorg.org>
 <1350686507-3022-3-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1350686507-3022-3-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> +
> +#define checkuart(rp, rv, lhu, bit, uart) \
> +               /* Load address of CLK_RST register */ \
> +               movw    rp, #TEGRA_CLK_RST_DEVICES_##lhu & 0xffff ; \
> +               movt    rp, #TEGRA_CLK_RST_DEVICES_##lhu >> 16 ; \
> +               /* Load value from CLK_RST register */ \
> +               ldr     rp, [rp, #0] ; \
> +               /* Test UART's reset bit */ \
> +               tst     rp, #(1 << bit) ; \
> +               /* If set, can't use UART; jump to save no UART */ \
> +               bne     90f ; \
> +               /* Load address of CLK_OUT_ENB register */ \
> +               movw    rp, #TEGRA_CLK_OUT_ENB_##lhu & 0xffff ; \
> +               movt    rp, #TEGRA_CLK_OUT_ENB_##lhu >> 16 ; \
> +               /* Load value from CLK_OUT_ENB register */ \
> +               ldr     rp, [rp, #0] ; \
> +               /* Test UART's clock enable bit */ \
> +               tst     rp, #(1 << bit) ; \
> +               /* If clear, can't use UART; jump to save no UART */ \
> +               beq     90f ; \
> +               /* Passed all tests, load address of UART registers */ \
> +               movw    rp, #TEGRA_UART##uart##_BASE & 0xffff ; \
> +               movt    rp, #TEGRA_UART##uart##_BASE >> 16 ; \
> +               /* Jump to save UART address */ \
> +               b 91f
> 

Maybe make this a subroutine?

Cheers,

Peter.
