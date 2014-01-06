From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Remove 3.3V supply and modem regulators
Date: Mon, 06 Jan 2014 13:59:27 -0700
Message-ID: <52CB192F.2020700@wwwdotorg.org>
References: <1389021933-6675-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1389021933-6675-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/06/2014 08:25 AM, Thierry Reding wrote:
> GPIO 1 and 2 of the PMIC are not used for the described purpose, so
> remove them.

As far as I can tell, this patch is correct, since those GPIOs are in
fact used to discharge the rails after disabling them, rather than to
enable/disable the rails.

Equally, these GPIOs affect multiple rails at once, so listing the GPIO
as a property of a single regulator seems wrong either way.

However, PMU_REGEN1 does seem to feed the "EN" pin of U13C1, a DC/DC
switcher for power rail 3.3v_modem, so perhaps there's more going on
here than I see?

In summary, I need Laxman to comment on this and ack the change, and
explain why these GPIOs were listed as regulator enables when it doesn't
seem that they are.

> Note: Removing these makes the work-in-progress eDP support work again.

> diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts

> -		vdd_3v3_reg: regulator@1 {
> -			compatible = "regulator-fixed";
> -			reg = <1>;
> -			regulator-name = "vdd_3v3";
> -			regulator-min-microvolt = <3300000>;
> -			regulator-max-microvolt = <3300000>;
> -			regulator-always-on;
> -			regulator-boot-on;
> -			enable-active-high;
> -			gpio = <&as3722 1 GPIO_ACTIVE_HIGH>;
> -		};
> -
> -		vdd_3v3_modem_reg: regulator@2 {
> -			compatible = "regulator-fixed";
> -			reg = <2>;
> -			regulator-name = "vdd-modem-3v3";
> -			regulator-min-microvolt = <3300000>;
> -			regulator-max-microvolt = <3300000>;
> -			enable-active-high;
> -			gpio = <&as3722 2 GPIO_ACTIVE_HIGH>;
> -		};

Don't you want to simply remove the "enable-active-high" and "gpio"
properties, but leave the regulator definitions present, in case
something wants to reference these fixed(?) rails as their supply?
