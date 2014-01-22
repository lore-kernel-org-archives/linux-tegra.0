From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v4 5/5] drm/tegra: Add eDP support
Date: Wed, 22 Jan 2014 14:14:07 -0700
Message-ID: <52E0349F.2050607@wwwdotorg.org>
References: <1390332263-11974-1-git-send-email-treding@nvidia.com> <1390332263-11974-6-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390332263-11974-6-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/21/2014 12:24 PM, Thierry Reding wrote:
> Add support for eDP functionality found on Tegra124 and later SoCs. Only
> fast link training is currently supported.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../bindings/gpu/nvidia,tegra20-host1x.txt         |   42 +

This part should go to the DT mailing list, although it looks fine to me.

> diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c

> + * Copyright (C) 2013 NVIDIA Corporation

2014? Perhaps elsewhere too?

> +static void tegra_dpaux_write_fifo(struct tegra_dpaux *dpaux, const u8 *buffer,

Is that anything like writesl(); similar for
tegra_dpaux_read_fifo()/readsl()?
