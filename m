From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: keep power on to SD slot on Dalmore
Date: Fri, 29 Mar 2013 10:36:02 -0600
Message-ID: <5155C2F2.3040009@wwwdotorg.org>
References: <1364498550-15972-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364498550-15972-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/28/2013 01:22 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Set "regulator-always-on" for the SD slot on Dalmore, so that SD
> cards work. This used to work, since this regulator is on by
> default, but was broken by commit "ARM: tegra: dalmore: add
> TPS65090 node", since that didn't specify always-on for this
> regulator.
> 
> In the long run, the regulators should all be hooked up to the
> SDHCI device nodes. However, we haven't done that for any of the
> Tegra boards yet, so to be consistent, this patch simply forces the
> regulator on, rather than hooking it up and making it work
> differently to other boards.

Applied to Tegra's for-3.10/dt branch.
