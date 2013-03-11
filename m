From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dt: tegra114: add PWM nodes
Date: Mon, 11 Mar 2013 17:30:11 -0600
Message-ID: <513E6903.6060506@wwwdotorg.org>
References: <1363041036-26358-1-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363041036-26358-1-git-send-email-achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/11/2013 04:30 PM, Andrew Chew wrote:
> This patch adds device tree nodes for the four PWM controllers present
> on tegra114.

Nit: Capitalize Tegra.

> diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi

> @@ -150,4 +150,36 @@
>  			     <1 11 0xf08>,
>  			     <1 10 0xf08>;
>  	};

DT nodes should be sorted in order by reg address, so I think this is in
the wrong place.

> +	pwm0: pwm@7000a000 {
> +		compatible = "nvidia,tegra20-pwm";

If the HW is 100% backwards-compatible, that should be:

compatible = "nvidia,tegra114-pwm", "nvidia,tegra20-pwm";

if not:

compatible = "nvidia,tegra114-pwm";
