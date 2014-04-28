From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 0/7] ARM: tegra: HDMI and DSI updates
Date: Mon, 28 Apr 2014 10:04:13 -0600
Message-ID: <535E7BFD.60708@wwwdotorg.org>
References: <1398440691-23366-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398440691-23366-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/25/2014 09:44 AM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> This series enables support for HDMI on Venice2 and Jetson TK1. It also
> adds the missing +5V regulators for Harmony, Beaver and Dalmore. Other
> boards may also need similar changes, but I don't have access to them.
> That said existing boards should continue to work without modifications
> since we were completely ignoring the +5V regulator before. So the only
> change that this should introduce is that perhaps some additional power
> can be saved because the +5V regulator now isn't always on.
> 
> The final patch in this series hooks up the DSI power supply on Dalmore
> so that it can also be switched of if not used.

I've applied the series to Tegra's for-3.16/dt branch.
