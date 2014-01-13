From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [BUILD BUG] tegra-powergate
Date: Mon, 13 Jan 2014 15:02:10 -0700
Message-ID: <52D46262.20409@wwwdotorg.org>
References: <20140113183727.GD15937@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140113183727.GD15937-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/13/2014 11:37 AM, Russell King - ARM Linux wrote:
> One of the randconfigs found this:
> 
> In file included from drivers/gpu/drm/tegra/gr3d.c:15:0:
> include/linux/tegra-powergate.h:119:1: error: expected identifier or '(' before '{' token
> 
> static inline int tegra_powergate_sequence_power_up(int id, struct clk *clk,
>                                                     struct reset_control *rst);
> {
> 
> That semicolon should not be there.

Thanks for the heads-up. I sent a patch to fix this.
