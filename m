From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Add Tegra124 PWM support
Date: Thu, 12 Dec 2013 12:53:32 -0700
Message-ID: <52AA143C.8010508@wwwdotorg.org>
References: <1384790435-30269-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384790435-30269-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/18/2013 09:00 AM, Thierry Reding wrote:
> The PWM controller on Tegra124 is the same as the one on earlier SoC
> generations.

I've applied this series to Tegra's for-3.14/dt branch. Given the recent
conversion to the common reset framework and DT bindings, I needed to
insert a couple extra lines in this patch:

> diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi

> +	pwm@7000a000 {
> +		compatible = "nvidia,tegra124-pwm", "nvidia,tegra20-pwm";
> +		reg = <0x7000a000 0x100>;
> +		#pwm-cells = <2>;
> +		clocks = <&tegra_car TEGRA124_CLK_PWM>;

Here, I inserted:

+               resets = <&tegra_car 17>;
+               reset-names = "pwm";

... which matches the same node in at least tegra114.dtsi.

> +		status = "disabled";
> +	};
