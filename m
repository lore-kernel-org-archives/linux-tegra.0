From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2] clk: tegra: defer application of init table
Date: Thu, 04 Apr 2013 17:33:51 -0600
Message-ID: <515E0DDF.6050008@wwwdotorg.org>
References: <1365111340-2143-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1365111340-2143-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/04/2013 03:35 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The Tegra clock driver is initialized during the ARM machine descriptor's
> .init_irq() hook. It can't be initialized earlier, since dynamic memory
> usage is required. It can't be initialized later, since the .init_timer()
> hook needs the clocks initialized. However, at this time, udelay()
> doesn't work.
> 
> The Tegra clock initialization table may enable some PLLs. Enabling a PLL
> may require usage of udelay(). Hence, this can't happen right when the
> clock driver is initialized.
> 
> To solve this, separate the clock driver initialization from the clock
> table processing, so they can execute at separate times.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Mike, the Tegra114 CCF V9 series assume this is applied first. Hence, I'm
> looking for an ack on this too. Thanks!

I've applied this to Tegra's for-3.10/clk branch, since Mike already
acked the Tegra114 CCF V9, which requires this patch, and embodies use
of it anyway.
