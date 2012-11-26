From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/1] arm: tegra: select correct parent clk for pll_p
Date: Mon, 26 Nov 2012 14:00:17 -0700
Message-ID: <50B3D861.7050700@wwwdotorg.org>
References: <1353396556-7738-1-git-send-email-sivaramn@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353396556-7738-1-git-send-email-sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/20/2012 12:29 AM, Sivaram Nair wrote:
> For Tegra30, pll_p clk's parent is wrongly specified as clk_m instead of
> pll_ref in the tegra30_clk_init_table and this is resulting in a
> boot-time warning. This patch fixes this by correcting the clk init
> table.

Thanks, applied.
