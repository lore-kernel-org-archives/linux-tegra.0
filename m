From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH RESEND] clk: tegra30: Don't wait for PLL_U lock bit
Date: Fri, 16 Aug 2013 10:38:27 -0600
Message-ID: <520E5583.2080604@wwwdotorg.org>
References: <1376510979-21562-1-git-send-email-ttynkkynen@nvidia.com> <1376510979-21562-2-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1376510979-21562-2-git-send-email-ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/14/2013 02:09 PM, Tuomas Tynkkynen wrote:
> The lock bit on PLL_U does not seem to be working correctly and
> sometimes never gets set when waiting for the PLL to come up.
> Remove the TEGRA_PLL_USE_LOCK flag to use a constant delay.

Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

(Mike I assume you'll take this through the clock tree)

I do suspect there's some underlying issue that needs fixing so that
PLL_U does report lock as expected. However, this fix does enable USB to
work correctly on Tegra30 right now (so I assume it is locking, but just
isn't reporting it), and should have zero negative fallout since nothing
else uses PLL_U. I'm following up internally to work out why the PLL
isn't reporting that it's locking as expected.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
