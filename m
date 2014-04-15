From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: define Jetson TK1 regulators
Date: Tue, 15 Apr 2014 14:47:51 -0600
Message-ID: <534D9AF7.6030903@wwwdotorg.org>
References: <1397516120-18220-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397516120-18220-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/14/2014 04:55 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> These are mostly identical to the Venice2 regulator definitions, since
> the board designs are very similar. Differences are:
> 
> - Jetson TK1 doesn't have a built-in LCD panel, so on-board regulators
>   are not present for the backlight, touchscreen, or panel.
> - +3.3V_RUN needs to be boot-on/always-on, since it's widely used. This
>   change should likely be propagated to Venice2 for completeness,
>   although it will have no practical effect there since various other
>   regulators use +3.3V_RUN as their supply and are always-on.
> - +3.3V_LP0 needs to be boot-on as well as always-on. One reason
>   is because it's used to driver the UART level-shifter; without this, I
>   see a brief period of UART corruption during cold boots.I suspect this
>   change needs to be propagated to Venice2, and we simply haven't noticed
>   the need since there's no UART level-shifter on Venice2.
> - A few rails have different names in the schematics.

I have applied this to Tegra's for-3.16/dt branch.
