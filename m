From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: roth: enable input on mmc clock pins
Date: Mon, 23 Jun 2014 13:01:13 -0600
Message-ID: <53A87979.6000104@wwwdotorg.org>
References: <1403508779-25896-1-git-send-email-acourbot@nvidia.com> <1403508779-25896-3-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403508779-25896-3-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/23/2014 01:32 AM, Alexandre Courbot wrote:
> Input had been disabled by mistake on these pins, leading to issues with
> SDIO devices like the Wifi module not being probed or random errors
> occuring on the SD card.

I thought the host controller always drove the clock, so there should be
no need for the pin's input path to be enabled. Perhaps it depends on
the transfer mode (e.g. UHS)?

If this fix is valid, perhaps Jetson TK1's sdmmc3_clk and Venice2's
sdmmc1_clk need the same fix, although we'll need to file bugs against
their pinmux spreadsheets first if that's the case.
