From: jckuo <jckuo@nvidia.com>
Subject: Re: [PATCH 2/5] phy: tegra: xusb: Skip single function lane
 programming
Date: Mon, 28 Jan 2019 15:06:51 +0800
Message-ID: <7afb7753-39d2-69b9-3666-e159d3e85ae0@nvidia.com>
References: <20190125112525.10697-1-thierry.reding@gmail.com>
 <20190125112525.10697-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125112525.10697-2-thierry.reding@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Reviewed-by: JC Kuo <jckuo@nvidia.com>

On 1/25/19 7:25 PM, Thierry Reding wrote:
> From: JC Kuo <jckuo@nvidia.com>
>
> Tegra186 USB2 pads and USB3 pads do not have hardware mux for changing
> the pad function. For such "lanes", we can skip the lane mux register
> programming.
>
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/phy/tegra/xusb.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index 5b3b8863363e..e3bc60cfe6a1 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -1,5 +1,5 @@
>   /*
> - * Copyright (c) 2014-2015, NVIDIA CORPORATION.  All rights reserved.
> + * Copyright (c) 2014-2016, NVIDIA CORPORATION.  All rights reserved.
>    *
>    * This program is free software; you can redistribute it and/or modify it
>    * under the terms and conditions of the GNU General Public License,
> @@ -313,6 +313,10 @@ static void tegra_xusb_lane_program(struct tegra_xusb_lane *lane)
>   	const struct tegra_xusb_lane_soc *soc = lane->soc;
>   	u32 value;
>   
> +	/* skip single function lanes */
> +	if (soc->num_funcs < 2)
> +		return;
> +
>   	/* choose function */
>   	value = padctl_readl(padctl, soc->offset);
>   	value &= ~(soc->mask << soc->shift);
