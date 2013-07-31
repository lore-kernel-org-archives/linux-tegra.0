From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] clk: tegra30: Don't wait for PLL_U lock bit
Date: Wed, 31 Jul 2013 15:04:42 -0600
Message-ID: <51F97BEA.7040006@wwwdotorg.org>
References: <1375292551-7933-1-git-send-email-ttynkkynen@nvidia.com> <1375292551-7933-2-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375292551-7933-2-git-send-email-ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/31/2013 11:42 AM, Tuomas Tynkkynen wrote:
> The lock bit on PLL_U does not seem to be working correctly and
> sometimes never gets set when waiting for the PLL to come up.
> Remove the TEGRA_PLL_USE_LOCK flag to use a constant delay.

Peter, Prashant,

I think you said that the lock bits should work on Tegra30 (albeit they
don't on Tegra20)? Can you remind me if the do/don't?

If Peter and Prashant are OK with this patch, feel free to take my ack.
