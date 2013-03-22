From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: Don't enable PLLs during early boot
Date: Fri, 22 Mar 2013 09:48:11 -0600
Message-ID: <514C7D3B.40602@wwwdotorg.org>
References: <1363953308-28828-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363953308-28828-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/22/2013 05:54 AM, Peter De Schrijver wrote:
> The PLL code relies on udelay() which is not available when CCF is
> initialized. Hence we can't enable any PLL during this phase.
> 
> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> --
> 
> Stephen,
> 
> Can you confirm this is ok for the audio drivers?
> 
> We used to be lucky that this has worked up to now, but I will introduce some
> changes to the pll lock check code which cause this to fail due to the
> slight differences in timing.

No, this won't work for the audio drivers; they assume the clock is
enabled when they start.

This assumption was made long ago. I know drivers are supposed to assume
that clocks are disabled when they're probed, but historically that
wasn't always the case, so if the audio drivers assumed that, and then
did clk_enable() as the first thing, they got a warning due to the
enabling an already enabled clock and/or later attempts to disable the
clocks wouldn't actually disable them. Perhaps this has changed now, but
either way, audio driver changes would be needed to support this change.

Perhaps this is due to initializing the Tegra clock driver in the
machine descriptor's init_irq function, rather than in the init_machine
function? Can this be moved?
