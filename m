From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: fix section mismatch in tegra_pmc_parse_dt
Date: Mon, 24 Jun 2013 10:40:00 +0800
Message-ID: <1372041600.12718.4.camel@jlo-ubuntu-64.nvidia.com>
References: <1371854347-12091-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371854347-12091-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sat, 2013-06-22 at 06:39 +0800, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> tegra_pmc_parse_dt() references __initconst data. Fix it to be __init.
> This matches its only usage; a call from tegra_pmc_init() which is
> already __init. This fixes:
> 
> WARNING: vmlinux.o(.text.unlikely+0x580): Section mismatch in reference
> from the function tegra_pmc_parse_dt() to the (unknown reference)
> .init.rodata:(unknown)
> 
Hi Stephen,

Just curious, I don't see this warning message on my system. Does this
cause by some other patch or something else?

Thanks,
Joseph
