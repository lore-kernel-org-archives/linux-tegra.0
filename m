From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] clocksource: tegra: move to of_clk_get
Date: Mon, 04 Feb 2013 15:09:57 -0700
Message-ID: <511031B5.4010900@wwwdotorg.org>
References: <1359985230-11506-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1359985230-11506-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, John Stultz <johnstul-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/04/2013 06:40 AM, Peter De Schrijver wrote:
> The new clockframework introduced DT IDs for each clock. To be able to remove
> the device registrations, this driver needs to be updated to use the DT IDs.
> Note that the actual removal of the clk_register_clkdev() calls will be done
> in a later series.

This seems fine for 3.10, but I wonder about dependencies. Will there be
a bunch of other similar changes? I guess this patch is a dependency of
some changes to drivers/clk/tegra/ to remove the non-DT clock
registrations? It'd be good to get a clear idea of all the dependencies,
so we can see what's the best tree to apply the changes to; perhaps this
should go through the drivers/clk tree, or Tegra's clk driver changes
need to go through the Tegra tree again in 3.10?
