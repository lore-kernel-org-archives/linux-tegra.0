From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 6/7] ARM: tegra: enable Tegra RTC for Venice2
Date: Wed, 09 Oct 2013 17:27:49 -0600
Message-ID: <5255E675.5040706@wwwdotorg.org>
References: <1381310411-11391-1-git-send-email-josephl@nvidia.com> <1381310411-11391-7-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381310411-11391-7-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/09/2013 03:20 AM, Joseph Lo wrote:
> Enable the Tegra RTC device on Venice2. It also can be used as a wakeup
> device when platform suspended.

> diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts

> +	rtc@7000e000 {
> +		status = "okay";
> +	};

Does that mean this node has status = "disabled" in tegra124.dtsi? It
shouldn't have, since the RTC doesn't depend on any board-specific HW,
and hence can be enabled by default. We certainly have it enabled by
default on all previous SoCs.

I assume this was caused by one of the commits of yours I already
applied? Let's have a fixup patch to tegra124.dtsi.
