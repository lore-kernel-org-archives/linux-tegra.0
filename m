From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v8 1/5] ARM: add basic support for Trusted Foundations
Date: Tue, 15 Oct 2013 12:07:25 +0100
Message-ID: <20131015110725.GZ25034@n2100.arm.linux.org.uk>
References: <1381527938-22840-1-git-send-email-acourbot@nvidia.com> <1381527938-22840-2-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1381527938-22840-2-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Oct 11, 2013 at 02:45:34PM -0700, Alexandre Courbot wrote:
> Trusted Foundations is a TrustZone-based secure monitor for ARM that
> can be invoked using the same SMC-based API on all supported
> platforms. This patch adds initial basic support for Trusted
> Foundations using the ARM firmware API. Current features are limited
> to the ability to boot secondary processors.
> 
> Note: The API followed by Trusted Foundations does *not* follow the SMC
> calling conventions. It has nothing to do with PSCI neither and is only
> relevant to devices that use Trusted Foundations (like most Tegra-based
> retail devices).
> 
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Reviewed-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../arm/firmware/tl,trusted-foundations.txt        | 20 ++++++
>  .../devicetree/bindings/vendor-prefixes.txt        |  1 +
>  arch/arm/Kconfig                                   |  2 +
>  arch/arm/Makefile                                  |  1 +
>  arch/arm/firmware/Kconfig                          | 28 ++++++++
>  arch/arm/firmware/Makefile                         |  1 +
>  arch/arm/firmware/trusted_foundations.c            | 79 ++++++++++++++++++++++
>  arch/arm/include/asm/trusted_foundations.h         | 68 +++++++++++++++++++
>  8 files changed, 200 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/firmware/tl,trusted-foundations.txt
>  create mode 100644 arch/arm/firmware/Kconfig
>  create mode 100644 arch/arm/firmware/Makefile
>  create mode 100644 arch/arm/firmware/trusted_foundations.c
>  create mode 100644 arch/arm/include/asm/trusted_foundations.h

Is having this under arch/arm appropriate?  What happens if the API
gets re-used on ARM64 for example?  Would drivers/firmware be a better
cross-arch location for this?

> diff --git a/arch/arm/include/asm/trusted_foundations.h b/arch/arm/include/asm/trusted_foundations.h
> new file mode 100644
> index 0000000..c6f20bd
> --- /dev/null
> +++ b/arch/arm/include/asm/trusted_foundations.h
> @@ -0,0 +1,68 @@
> +/*
> + * Copyright (c) 2013, NVIDIA Corporation.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + */
> +
> +/*
> + * Support for the Trusted Foundations secure monitor.
> + *
> + * Trusted Foundation comes active on some ARM consumer devices (most
> + * Tegra-based devices sold on the market are concerned). Such devices can only
> + * perform some basic operations, like setting the CPU reset vector, through
> + * SMC calls to the secure monitor. The calls are completely specific to
> + * Trusted Foundations, and do *not* follow the SMC calling convention or the
> + * PSCI standard.
> + */
> +
> +#ifndef __ASM_ARM_TRUSTED_FOUNDATIONS_H
> +#define __ASM_ARM_TRUSTED_FOUNDATIONS_H
> +
> +#include <linux/kconfig.h>
> +
> +struct trusted_foundations_platform_data {
> +	unsigned int version_major;
> +	unsigned int version_minor;
> +};
> +
> +#if IS_ENABLED(CONFIG_TRUSTED_FOUNDATIONS)
> +
> +void register_trusted_foundations(struct trusted_foundations_platform_data *pd);
> +void of_register_trusted_foundations(void);
> +
> +#else /* CONFIG_TRUSTED_FOUNDATIONS */
> +
> +#include <linux/printk.h>
> +#include <linux/of.h>
> +#include <asm/bug.h>

Please move these up along side the other #include - having includes depend
on config symbols is an additional unnecessary source of fragility.

Secondly, please use linux/*.h includes in preference to asm/*.h where the
linux/*.h include picks up the corresponding asm/*.h include.  In this case,
that should be linux/bug.h, not asm/bug.h.
