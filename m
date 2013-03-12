From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/1 v3] ARM: tegra: add PWM nodes to Tegra114 DT
Date: Tue, 12 Mar 2013 17:12:44 -0600
Message-ID: <513FB66C.2030007@wwwdotorg.org>
References: <1363124563-24784-1-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363124563-24784-1-git-send-email-achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/12/2013 03:42 PM, Andrew Chew wrote:
> This patch adds a device tree node for the four PWM controllers present
> on Tegra114.

> diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi

> +	pwm: pwm {
> +		compatible = "nvidia,tegra114-pwm", "nvidia,tegra20-pwm";
> +		reg = <0x7000a000 0x40>;

I notice that the size is 0x100 in previous chips. Which is more correct?

> +		#pwm-cells = <2>;
> +		clocks = <&tegra_car 17>;
> +		status = "disabled";

Previous chips don't disable this module by default. Perhaps they should?

> +	};
