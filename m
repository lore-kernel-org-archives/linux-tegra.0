From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: tegra: correct Beaver pinmux
Date: Tue, 23 Feb 2016 14:56:53 -0700
Message-ID: <56CCD5A5.9080809@wwwdotorg.org>
References: <1456260543-18076-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456260543-18076-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/23/2016 01:49 PM, Lucas Stach wrote:
> Update pinmux to get rid of invalid uses of the rsvd1 function and
> add correct drive settings for SDIO1, which makes some more SD-cards
> work.

(Adding a variety of missing CCs)

I think this patch looks OK. Looking at the kernel pinctrl driver, I 
think that before this patch, because some of the mux settings were 
deemed invalid by the pinctrl driver, the pinmux settings were not all 
applied, and this change fixes it? Ouch! Luckily U-Boot programmed what 
is hopefully the same table before the kernel booted!

> diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts

... (many other fixes; see original email)

> +			sdio1 {
> +				nvidia,pins = "drive_sdio1";
> +				nvidia,high-speed-mode = <TEGRA_PIN_DISABLE>;
> +				nvidia,schmitt = <TEGRA_PIN_DISABLE>;
> +				nvidia,pull-down-strength = <46>;
> +				nvidia,pull-up-strength = <42>;
> +				nvidia,slew-rate-rising = <1>;
> +				nvidia,slew-rate-falling = <1>;
> +			};

I think it would be worth mentioning in the commit description where 
this data came from.
