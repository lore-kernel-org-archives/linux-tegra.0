From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 5/8] ARM: tegra: add LP1 suspend support for Tegra30
Date: Mon, 05 Aug 2013 11:53:37 -0600
Message-ID: <51FFE6A1.5090701@wwwdotorg.org>
References: <1375701664-14965-1-git-send-email-josephl@nvidia.com> <1375701664-14965-6-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375701664-14965-6-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/05/2013 05:21 AM, Joseph Lo wrote:
> The LP1 suspend mode will power off the CPU, clock gated the PLLs and put
> SDRAM to self-refresh mode. Any interrupt can wake up device from LP1. The
> sequence when LP1 suspending:

> V2:
...
> * modify tegra30_sdram_pad_save as suggestion

You should describe the change you made, not why you made the change.
Not everyone reading this new patch version will know/remember what
suggestions were made in response to v1, and that description above
therefore doesn't mean anything to them.

> diff --git a/arch/arm/mach-tegra/sleep-tegra30.S b/arch/arm/mach-tegra/sleep-tegra30.S

> +/*
> + * tegra30_lp1_reset
> + *
> + * reset vector for LP1 restore; copied into IRAM during suspend.
> + * Brings the system back up to a safe staring point (SDRAM out of
> + * self-refresh, PLLC, PLLM and PLLP reenabled, CPU running on PLLX,
> + * system clock running on the same PLL that it suspended at), and
> + * jumps to tegra_resume to restore virtual addressing.
> + * The physical address of tegra_resume expected to be stored in
> + * PMC_SCRATCH41.
> + *
> + * NOTE: THIS *MUST* BE RELOCATED TO TEGRA_IRAM_CODE_AREA AND MUST BE FIRST.

This comment still contains the confusing "AND MUST BE FIRST" that was
in v1:-(
