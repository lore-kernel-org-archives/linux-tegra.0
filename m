From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 5/8] memory: tegra: Add EMC scaling support code for
 Tegra210
Date: Tue, 10 Mar 2020 19:43:12 +0300
Message-ID: <4ea3a96f-52cb-4eab-cf92-932f6882ad85@gmail.com>
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-6-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200310152003.2945170-6-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

10.03.2020 18:20, Thierry Reding пишет:
> From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> This is the initial patch for Tegra210 EMC frequency scaling. It has the
> code to program various aspects of the EMC that are standardized, but it
> does not yet include the specific programming sequence needed for clock
> scaling.
> 
> The driver is designed to support LPDDR4 SDRAM. Devices that use LPDDR4
> need to perform training of the RAM before it can be used. Firmware will
> perform this training during early boot and pass a table of supported
> frequencies to the kernel via device tree.
> 
> For the frequencies above 800 MHz, periodic retraining is needed to
> compensate for changes in timing. This periodic training will have to be
> performed until the frequency drops back to or below 800 MHz.
> 
> This driver provides helpers used during this runtime retraining that
> will be used by the sequence specific code in a follow-up patch.
> 
> Based on work by Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.
> 
> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v5:
> - major rework and cleanup
> 
>  drivers/memory/tegra/tegra210-emc.c | 1952 +++++++++++++++++++++------
>  drivers/memory/tegra/tegra210-emc.h |  893 +++++++++++-
>  2 files changed, 2390 insertions(+), 455 deletions(-)
> 
> diff --git a/drivers/memory/tegra/tegra210-emc.c b/drivers/memory/tegra/tegra210-emc.c
> index 80ea14d1e6ce..4ea8fb70a4fd 100644
> --- a/drivers/memory/tegra/tegra210-emc.c
> +++ b/drivers/memory/tegra/tegra210-emc.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Copyright (c) 2015-2019, NVIDIA CORPORATION.  All rights reserved.
> + * Copyright (c) 2015-2020, NVIDIA CORPORATION.  All rights reserved.
>   */

Would be nice to avoid all the unnecessary changes, like the one above
and then all the code's removals/reshuffling.

Such that a new patch was a clean addition to a previous patch, instead
of a re-write.
