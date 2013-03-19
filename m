From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 1/3] ARM: dts: tegra: add clock source for PMC
Date: Tue, 19 Mar 2013 10:42:46 -0600
Message-ID: <51489586.9090605@wwwdotorg.org>
References: <1363594199-10974-1-git-send-email-josephl@nvidia.com> <1363594199-10974-2-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363594199-10974-2-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/18/2013 02:09 AM, Joseph Lo wrote:
> The clock source of PMC is PCLK. Adding it into DTS for Tegra20 and Tegra30.

> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi

>  	pmc {
>  		compatible = "nvidia,tegra20-pmc";
>  		reg = <0x7000e400 0x400>;
> +		clocks = <&tegra_car 110>;
>  	};

The DT binding documentation needs to list the set of clocks that must
be present.

Doesn't the PMC also receive a "clk32k_in" from the PMIC, or is that
routed into the CAR, and then into the PMC? Either way, the PMC module
receives that clock somehow. Since there are multiple clocks, that also
means that a clock-names property is required.
