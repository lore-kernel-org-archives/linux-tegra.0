From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: defer application of init table
Date: Thu, 28 Mar 2013 16:38:17 +0200
Message-ID: <20130328143817.GV18519@tbergstrom-lnx.Nvidia.com>
References: <1364253019-2533-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1364253019-2533-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 26, 2013 at 12:10:19AM +0100, Stephen Warren wrote:
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
> Peter, if this makes sense to you, perhaps you could included it at the
> start of your CCF V9 (with the Tegra114 parts split out into the relevant
> changes of yours).

This looks good. I will take this into CCF v9.

Thanks,

Peter.
