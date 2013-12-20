From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 03/10] ARM: tegra: Add MIPI calibration DT entries for
 Tegra114
Date: Thu, 19 Dec 2013 17:11:00 -0700
Message-ID: <52B38B14.8080605@wwwdotorg.org>
References: <1387468774-14216-1-git-send-email-treding@nvidia.com> <1387468774-14216-4-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387468774-14216-4-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/19/2013 08:59 AM, Thierry Reding wrote:
> Add a device node for the MIPI calibration block on Tegra114. There is
> no need to disable it by default because it only enables the clock while
> performing calibration and therefore shouldn't be consuming any power
> when unused.

> diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi

> +	mipi: mipi {

That should be:

	mipi: mipi@700e3000 {

I fixed it up for you.
