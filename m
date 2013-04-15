From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH resend 1/2] clk: tegra: remove USB from clk init table
Date: Mon, 15 Apr 2013 11:47:38 -0600
Message-ID: <516C3D3A.7000508@wwwdotorg.org>
References: <1366011105-2351-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1366011105-2351-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/15/2013 01:31 AM, Lucas Stach wrote:
> The USB clocks are just clock gates, so no need to set a specific clock.
> In fact trying to set a specific clock is just a NOP if the requested
> clockrate is the same as those of the parent (clk_m) or will trigger a
> WARN_ON() if rates don't match up.
> 
> As we are not setting a specific rate, nor activating the clocks at
> init, there is no point in keeping the the usb entries in the clock init
> table.

Peter, Prashant, I'd like to confirm that the usb* clocks really do have
clk_m as their parent; we're sure they aren't driven by the 12MHz PLL_U
output?

Either way, I guess it's safe to take this patch since the clock would
be fixed rate; I'd just like to make sure the clock driver is accurate.
