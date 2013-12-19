From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 05/10] ARM: tegra: Add Tegra114 DSI support
Date: Thu, 19 Dec 2013 12:57:54 -0700
Message-ID: <52B34FC2.5010409@wwwdotorg.org>
References: <1387468774-14216-1-git-send-email-treding@nvidia.com> <1387468774-14216-6-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387468774-14216-6-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/19/2013 08:59 AM, Thierry Reding wrote:
> Add device tree nodes for the DSI controllers found on Tegra114 SoCs.

> diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi

> +		dsi@54300000 {
> +			compatible = "nvidia,tegra114-dsi";
> +			reg = <0x54300000 0x00040000>;
> +			clocks = <&tegra_car TEGRA114_CLK_DSIA>,
> +				 <&tegra_car TEGRA114_CLK_DSIALP>,
> +				 <&tegra_car TEGRA114_CLK_PLL_D_OUT0>;
> +			clock-names = "dsi", "lp", "parent";

The binding document
Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt doesn't
mention an "lp" clock:

  - clock-names: Must include the following entries:
    - dsi
      This MUST be the first entry.
    - parent

I assume this is simply an oversight, since this is an obvious extension
of the binding, and that the DT binding will be updated to include that
clock in the list, and hence won't block applying the series because of
this.
