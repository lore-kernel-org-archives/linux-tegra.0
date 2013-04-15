From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH resend 1/2] clk: tegra: remove USB from clk init table
Date: Mon, 15 Apr 2013 13:59:27 +0300
Message-ID: <20130415105926.GM3572@tbergstrom-lnx.Nvidia.com>
References: <1366011105-2351-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1366011105-2351-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Apr 15, 2013 at 09:31:44AM +0200, Lucas Stach wrote:
> The USB clocks are just clock gates, so no need to set a specific clock.
> In fact trying to set a specific clock is just a NOP if the requested
> clockrate is the same as those of the parent (clk_m) or will trigger a
> WARN_ON() if rates don't match up.
> 
> As we are not setting a specific rate, nor activating the clocks at
> init, there is no point in keeping the the usb entries in the clock init
> table.
> 

less entries in the clock init table is always good.

Acked-By: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers,

Peter.
