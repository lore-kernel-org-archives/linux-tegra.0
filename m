From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] i2c: tegra: Remove unnecessary clk_get
Date: Sat, 4 Feb 2012 16:48:24 +0530
Message-ID: <4F2D1400.5050907@nvidia.com>
References: <1328314217-16632-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1328314217-16632-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Saturday 04 February 2012 05:40 AM, Stephen Warren wrote:
> From: Laxman Dewangan<ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> The clock table has just one entry for a given i2c controller.
> Hence, the second clk_get is not required in the driver.
>
> Originally by Laxman Dewangan<ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, but S-o-b is
> missing in our internal repo.
>
> [swarren: Reworded commit description, resolved merge issue when cherry-
> picking to mainline]
> Signed-off-by: Stephen Warren<swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
The tegra i2c controller have two clock inputs i2c_div and i2c_fast_clk. 
There is way to select the clock source for i2c_div clock but 
i2c_fast_clk is fixed to PLLP_OUT3 clock source.
Both clocks are needed to proper functionality. This change assume that 
fast-clk (pllp_out3) is always be ON which is wrong assumption. For 
aggressive power management, if there is no client for pllp_out3, it 
will be turned off. And so this is require.
However, the code enable fast_clk always once it is registered which is 
also not correct. The div_clk and fast_clk should be enable together and 
diable together and so driver need to call the clk_enable(div_clk) and 
clk_enable(fast_clk) for enabling clock. We have fixed this in our 
internal tree (K3.1). Let me know if I can help here.
