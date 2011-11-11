From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v4 06/10] arm/tegra: prepare pinmux code for multiple
 tegra variants
Date: Fri, 11 Nov 2011 14:00:15 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17408058C6@HQMAIL01.nvidia.com>
References: <1321010541-31337-1-git-send-email-pdeschrijver@nvidia.com>
 <1321010541-31337-7-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1321010541-31337-7-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Peter De Schrijver wrote at Friday, November 11, 2011 4:22 AM:
> This patch modifies the pinmux code to be useable for multiple tegra variants.
> Some tegra20 specific constants will be replaced by variables which will be
> initialized to the appropriate value at runtime.

> diff --git a/arch/arm/mach-tegra/pinmux.c b/arch/arm/mach-tegra/pinmux.c

> +#ifdef CONFIG_OF
> +#include <linux/of_platform.h>
> +#endif

No need to ifdef the include.

> +#ifdef CONFIG_OF
> +	match = of_match_device(tegra_pinmux_of_match, &pdev->dev);
> +#endif

There's already a dummy of_match_device that returns NULL if !CONFIG_OF,
so you can avoid this ifdef. (at least in next-20111111).

-- 
nvpublic
